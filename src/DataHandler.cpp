/* 
 * File:   DataHarvester.cpp
 * Author: Piotr Bentkowski : bentkowski.piotr@gmail.com
 * 
 * Created on 13 March 2015, 13:16
 * 
 *    This program is free software; you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation; either version 2 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program; if not, write to the Free Software
 *    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 *    MA 02110-1301, USA.
 */

#include <fstream>
#include <iostream>
#include <vector>
#include <tuple>

#include "DataHandler.h"
#include "nlohmann/json.hpp"

using jsonf = nlohmann::json;
typedef std::string sttr;

DataHandler::DataHandler() {
}

//DataHarvester::DataHarvester(const DataHarvester& orig) {
//}

DataHandler::~DataHandler() {
}

/**
 * @brief Data harvesting method. Calculates some stats of population genetics:
 * Shannon's index, number of MHC/antigen types, total number of MHC copies. 
 * Runs internally within DataHarvester class.
 * 
 * @return <a href="http://en.cppreference.com/w/cpp/utility/tuple/make_tuple">
 * STD Touple object</a> with 3 numbers: Shannon's index, number of MHC/antigen 
 * types, total number of MHC copies
 */
auto getShannonIndx(std::vector<unsigned long> GeneVals){
    int Types = 0;
    double Summ = 0.0;
    double tot_gene_numb = (double) GeneVals.size();
    if(GeneVals.size()){
        unsigned long GeneCounter = GeneVals.size();
        bool IfCountedLyst[GeneCounter];
        for (unsigned long w = 0; w < GeneCounter; ++w) {
            IfCountedLyst[w] = false;
        }
        double abundance;
        for (unsigned long i = 0; i < GeneCounter; ++i) {
            if (!IfCountedLyst[i]) {
                Types += 1;
                abundance = 1.0;
                for (unsigned long j = i + 1; j < GeneCounter; ++j) {
                    if (i != j && !IfCountedLyst[j] && GeneVals[i] == GeneVals[j]){
                        abundance += 1.0;
                        IfCountedLyst[j] = true;
                    }
                }
                // the proper calculations
                Summ = Summ - ((abundance / tot_gene_numb) 
                        * std::log(abundance / tot_gene_numb));
            }
        }
    }
    // ShannIndx (double), typesOfGenes (int), numberOfAllGenes (double)
    auto RTRN = std::make_tuple( Summ, Types, tot_gene_numb );
    return RTRN;
}

/**
 * @brief Data harvesting method. Sets status of all data files as "brand new".
 */
void DataHandler::setAllFilesAsFirtsTimers(){
    ifFirstSpecToFileRun = true;
    ifFirstHostClonesRun = true;
    ifFirstHostGeneDivRun = true;
    ifFirstGeneNumbersTotal = true;
    ifFirstGeneNumbersUnique = true;
    ifNoMuttPathoListUnique = true;
    ifNumberOfPresentedPatho = true;
    ifNumberOfMhcWhenMating = true;
    ifNumberOfMhcBeforeMating = true;
    ifNumberOfMhcAfterMating = true;
}

/** 
 * @brief Data harvesting method. Gets current date/time, format is YYYY-MM-DD.HH:mm:ss
 * 
 * Visit http://en.cppreference.com/w/cpp/chrono/c/strftime for more information 
 * about date/time format.
 * 
 * @return date and time in a string format ready to print out.
 */
const std::string currentDateTime(){
    time_t now = time(0);
    struct tm tstruct;
    char buf[80];
    tstruct = *localtime(&now);
    strftime(buf, sizeof(buf), "%Y-%m-%d.%X", &tstruct);
    return buf;
}

/**
 * @brief Input params validation method. Does the basic check if the entered
 * parameters are free of total nonsense. This one is for sex optimality hypothesis
 * and alpha-based selection.
 *
 * @param rndSeed
 * @param geneLength
 * @param antigenLength
 * @param hostPopSize
 * @param pathoPopSize
 * @param patho_sp
 * @param hostGeneNumbb
 * @param pathoGeneNumb
 * @param patoPerHostGeneration
 * @param numOfHostGenerations
 * @param hostMutationProb
 * @param pathoMutationProb
 * @param HeteroHomo
 * @param hostDeletion
 * @param hostDuplication
 * @param maxGene
 * @param alpha
 * @param numberOfMates
 * @return 'true' if something is wrong, 'false' if no errors were found.
 */
bool DataHandler::checkParamsIfWrong(unsigned int numberOfThreads, unsigned long geneLength, unsigned long antigenLength,
                        int hostPopSize, int pathoPopSize, int patho_sp, unsigned long hostGeneNumbb,
                        int patoPerHostGeneration, int numOfHostGenerations, double hostMutationProb,
                        double pathoMutationProb, int HeteroHomo, double hostDeletion, double hostDuplication,
                        unsigned long maxGene, double alpha, int numberOfMates){
     bool ifError = false;
    if (numberOfThreads < 0){
        std::cout << "\nError in the number of threads. It has to be a positive integer!." << std::endl;
        ifError = true;
    }
    if (geneLength > 31){
        std::cout << "\nError in number of bits per gene. ";
        std::cout << geneLength << " bits in genes is bit too much. ";
        std::cout << "Try something less radical, e.g. smaller than 31."  << std::endl;
        ifError =  true;
    }
    if (hostMutationProb < 0.0 or hostMutationProb > 1.0){
        std::cout << "\nError in the hosts' mutation probability. It has to be " <<
                "within the range [0, 1]." << std::endl;
        ifError = true;
    }
    if (hostDeletion < 0.0 or hostDeletion > 1.0){
        std::cout << "\nError in the hosts' probability of deletion of a gene. " <<
                "It has to be within the range [0, 1]." << std::endl;
        ifError = true;
    }
    if (hostDuplication < 0.0 or hostDuplication > 1.0){
        std::cout << "\nError in the hosts' duplication of a gene probability. " <<
                "It has to be within the range [0, 1]." << std::endl;
        ifError = true;
    }
    if (HeteroHomo != 10 and HeteroHomo != 11){
        std::cout << "\nError in the heterozygote advantage / lack of advantage " <<
                "mode. It has to be 10 for heterozygote advantage or 11 for " <<
                "lack of thereof." << std::endl;
        ifError = true;
    }
    if (maxGene < 1.0 or maxGene < hostGeneNumbb){
        std::cout << "\nError in the hosts' maximal number of genes per " <<
                "chromosome. It has to be at least one, but not less then the " <<
                "number used to initialize the system. "<< std::endl;
        ifError = true;
    }
    if (numberOfMates < 0 or numberOfMates > hostPopSize){
        std::cout << "\nError in the hosts' number of sexual partners. It has " <<
                "to be larger than 0 but not more than host population size ." << std::endl;
        ifError = true;
    }
    if (alpha < 0.0 or alpha > 1.0){
        std::cout << "\nError in the hosts' alpha factor for the host fitness function. " <<
                "It has to be within the range [0, 1]." << std::endl;
        ifError = true;
    }
    return ifError;
}

/**
 * @brief Saves given parametrisation of the model to a JSON file. Make sure you always have this JSON file, or
 * you will loose track what simulation did what!
 * 
 * @param numberOfThreads 
 * @param geneLength 
 * @param antigenLength 
 * @param hostPopSize 
 * @param pathoPopSize 
 * @param patho_sp 
 * @param hostGeneNumbb 
 * @param patoPerHostGeneration 
 * @param numOfHostGenerations 
 * @param hostMutationProb 
 * @param pathoMutationProb 
 * @param HeteroHomo 
 * @param hostDeletion 
 * @param hostDuplication 
 * @param maxGene 
 * @param alpha 
 * @param numberOfMates 
 */
void DataHandler::inputParamsToFile(unsigned int numberOfThreads, unsigned long geneLength, unsigned long antigenLength,
        int hostPopSize, int pathoPopSize, int patho_sp, unsigned long hostGeneNumbb,
        int patoPerHostGeneration, int numOfHostGenerations, double hostMutationProb, double pathoMutationProb,
        int HeteroHomo, double hostDeletion, double hostDuplication, unsigned long maxGene, double alpha,
        int numberOfMates){
    jsonf jsonfile;
    jsonfile["run_start_date_and_time"] = currentDateTime();
    jsonfile["number_of_threads"] = numberOfThreads;
    jsonfile["number_of_bits_per_gene"] = geneLength;
    jsonfile["number_of_bits_per_antigen"] = antigenLength;
    jsonfile["host_population_size"] = hostPopSize;
    jsonfile["pathogen_population_size"] = pathoPopSize;
    jsonfile["number_of_pathogen_species"] = patho_sp;
    jsonfile["number_of_genes_per_host_one_chromosome"] = hostGeneNumbb;
    jsonfile["number_of_pathogen_generation_per_one_host_generation"] = patoPerHostGeneration;
    jsonfile["number_of_host_generations"] = numOfHostGenerations;
    jsonfile["mutation_probability_in_host"] = hostMutationProb;
    jsonfile["mutation_probability_in_pathogen"] =  pathoMutationProb;
    if (HeteroHomo == 10){
        jsonfile["heterozygote_advantage"] = "YES";
    }else if (HeteroHomo == 11){
        jsonfile["heterozygote_advantage"] = "NO";
    } else {
        jsonfile["heterozygote_advantage"] = "ERROR";
    }
    jsonfile["host_gene_deletion_probability"] = hostDeletion;
    jsonfile["host_gene_duplication_probability"] = hostDuplication;
    jsonfile["host_maximal_number_of_genes_in_chromosome"] = maxGene;
    jsonfile["number_of_sex_mates"] = numberOfMates;
    jsonfile["alpha_factor_for_the_host_fitness_function"] = alpha;

    std::string s = jsonfile.dump(4); // making it look human-readable instead of one long line in a file
    std::ofstream InputParams;
    InputParams.open("InputParameters.json");
    InputParams << s;
    InputParams.close();
}


/**
 * @brief Data harvesting method. Writes to a file population sizes of all 
 * pathogen species in a given time.
 * 
 * @param EnvObj - the Environment object
 * @param tayme - time stamp (hosts generation number) 
 */
void DataHandler::saveNumOfPathoSpeciesToFile(Environment& EnvObj, int tayme){
    if(ifFirstSpecToFileRun){
        std::ofstream PathoPopulFile;
        PathoPopulFile.open("PathoPopSizes.csv");
        PathoPopulFile << "#time subsequent_species_pop_size" << std::endl;
        PathoPopulFile.close();
        ifFirstSpecToFileRun = false;
    }
    std::ofstream PathoPopulFile;
    PathoPopulFile.open("PathoPopSizes.csv",
            std::ios::out | std::ios::ate | std::ios::app);
    PathoPopulFile << tayme;
    for(unsigned j = 0; j < EnvObj.getPathoNumOfSpecies(); ++j){
        PathoPopulFile << " " << EnvObj.getPathoSpeciesPopSize(j);      
    }
    PathoPopulFile << std::endl;
    PathoPopulFile.close();
}

/**
 * @brief Data harvesting method. Writes to a file all pathogens with their
 * genomes in a human-readable format.
 * 
 * @param EnvObj - the Environment object
 * @param tayme - time stamp (hosts generation number)
 */
void DataHandler::savePathoPopulToFile(Environment& EnvObj, int tayme){
    sttr theFilename = sttr("PathoGenomesFile.") + std::to_string(tayme) + sttr(".csv");
    std::ofstream PathogGenomeFile;
    PathogGenomeFile.open(theFilename);
    PathogGenomeFile << "#Genomes_of_all_pathogens_at_time = " << tayme << std::endl;
    PathogGenomeFile << "#bit-gene\tchromosome\ttime_of_origin\tgene_own_tag\tAll_parental_tags"
            << std::endl;
    for(unsigned long i = 0; i < EnvObj.getPathoNumOfSpecies(); ++i){
        for(unsigned long j = 0; j < EnvObj.getPathoSpeciesPopSize(i); ++j){
            PathogGenomeFile << EnvObj.getPathoGenesToString(i, j);
        }
    }
    PathogGenomeFile.close();
}

/**
 * @brief Data harvesting method. Writes to a file all hosts with their
 * genomes in a human-readable format.
 * 
 * @param EnvObj - the Environment object
 * @param tayme - time stamp (hosts generation number)
 */
void DataHandler::saveHostPopulToFile(Environment& EnvObj, int tayme){
    sttr theFilename = sttr("HostGenomesFile.") + std::to_string(tayme) + sttr(".csv");
    std::ofstream HostGenomesFile;
    HostGenomesFile.open(theFilename);
    HostGenomesFile << "#Genomes_of_all_host_at_time = " << tayme << std::endl;
    HostGenomesFile << "#bit-gene\tchromosome\ttime_of_origin\tgene_own_tag" <<
            "\tTime_of_parental_mutation\tAll_parental_tags etc."
            << std::endl;
    for(int i = 0; i < EnvObj.getHostsPopSize(); ++i){
        HostGenomesFile << EnvObj.getHostGenesToString(i);
//        HostGenomesFile << EnvObj.getHostUniqMHCtoString(i);
    }
    HostGenomesFile.close();
}

/**
 * @brief Data harvesting method. Calculates and writes to a file some stats 
 * about the hosts population genetic. Will create one file per run. First column
 * is time stamp (hosts generation number).
 * 
 * You call it ones per host generation iteration. In each call it adds a line
 * with some statistics regarding population genetics of the host population.
 * Data regarding individuals are not being stored here. We wrote custom Python
 * scripts to visualize this dataset.
 * 
 * @param EnvObj - the Environment object
 * @param tayme - time stamp (hosts generation number)
 */
void DataHandler::saveHostGeneticDivers(Environment& EnvObj, int tayme){
    if(ifFirstHostGeneDivRun){
        std::ofstream HostGeneDivFile;
        HostGeneDivFile.open("HostsGeneDivers.csv");
        HostGeneDivFile << "#time pop_size tot_num_of_genes num_of_MHC_types" <<
                " Shannon_indx mean_fitness std_fitness" << std::endl;
        HostGeneDivFile.close();
        ifFirstHostGeneDivRun = false;
    }
    std::vector<unsigned long> AllTheGeneVals;
    std::vector<double> Fitness;
    double popSize = (double) EnvObj.getHostsPopSize();
//    int homoLociNum = -1; // not applicable at the moment!
//    double tot_gene_numb = 0;
    Fitness.clear();
    for(unsigned long i = 0; i < EnvObj.getHostsPopSize(); ++i){
//        tot_gene_numb += EnvObj.getSingleHostGenomeSize(i);
        Fitness.push_back(EnvObj.getHostFitness(i));
        // Harvesting genes from Chromosome One in all hosts
        for(unsigned long j = 0; j < EnvObj.getSingleHostChromoOneSize(i); ++j){
            AllTheGeneVals.push_back(EnvObj.getSingleHostRealGeneOne(i, j));
        }
        // Harvesting genes from Chromosome Two in all Phosts
        for(unsigned long m = 0; m < EnvObj.getSingleHostChromoTwoSize(i); ++m){
            AllTheGeneVals.push_back(EnvObj.getSingleHostRealGeneTwo(i, m));
        }
    }
    // Calculating the Shannon index et al. plus extracting it from the tuple
    auto ShOut = getShannonIndx(AllTheGeneVals);
    double Summ = std::get < 0 >( ShOut );
    int mhcTypes = std::get < 1 >( ShOut );
    double tot_gene_numb = std::get < 2 >( ShOut );
    
    // calculating for coefficient of variation of hosts fitness
    double cv_sum = std::accumulate(Fitness.begin(), Fitness.end(), 0.0);
    double fit_mean = cv_sum / Fitness.size();
    double sq_sum = std::inner_product(Fitness.begin(), Fitness.end(), 
                                       Fitness.begin(), 0.0);
    double stdev = std::sqrt(sq_sum / Fitness.size() - fit_mean * fit_mean);
    
    std::ofstream HostGenomesFile;
    HostGenomesFile.open("HostsGeneDivers.csv",
            std::ios::out | std::ios::ate | std::ios::app);
    HostGenomesFile << tayme << " " << popSize << " " << tot_gene_numb << " " <<
            mhcTypes << " " << Summ << " " << fit_mean <<
            " " << stdev << std::endl;
    HostGenomesFile.close();
}

/**
 * @brief  Data harvesting method. Saves the number of genes in Chromosome ONE and the number of unique MHC types.
 * You get a pair of files with corresponding data in each row-and-column. First column is time stamp
 * (hosts generation number).
 * 
 * @param EnvObj - the Environment class object
 * @param tayme - time stamp (hosts generation number)
 */
void DataHandler::saveHostGeneNumbers(Environment& EnvObj, int tayme){
    if(ifFirstGeneNumbersTotal){
        std::ofstream HostGeneNumbTotal;
        HostGeneNumbTotal.open("HostGeneRecord the total number of genes and types\n"
                                       " * of MHCs in hosts. All the freaking hosts!\n"
                                       " * \n"
                                       " * Writes to separate files (a) the number of  genes of all the host in each \n"
                                       " * time step, (b) the number of unique MHC types corresponding to the numbers\n"
                                       " *  in the first file. All together you get two files witch data sync to each\n"
                                       " * other.NumbTotal_ChrOne.csv");
        HostGeneNumbTotal << "#time total_number_of_genes_in_all_host_cells"
                << std::endl;
        HostGeneNumbTotal.close();
        ifFirstGeneNumbersTotal = false;
    }
    if(ifFirstGeneNumbersUnique){
        std::ofstream HostMHCNumbUnique;
        HostMHCNumbUnique.open("HostMHCsNumbUniq_ChrOne.csv");
        HostMHCNumbUnique << "#time number_of_unique_MHCs_in_all_host_cells" 
                << std::endl;
        HostMHCNumbUnique.close();
        ifFirstGeneNumbersUnique = false;
    }
    std::vector<unsigned int> AllGenomesSize;
    std::vector<int> UniqueMHCs;
    std::vector<unsigned long> TheGeneVals;
    for(unsigned long i = 0; i < EnvObj.getHostsPopSize(); ++i){
        TheGeneVals.clear();
        // Harvesting genes from Chromosome One in all hosts
        for(unsigned long j = 0; j < EnvObj.getSingleHostChromoOneSize(i); ++j){
            TheGeneVals.push_back(EnvObj.getSingleHostRealGeneOne(i, j));
        }
        // Harvesting genes from Chromosome Two in all hosts
//        for(int m = 0; m < EnvObj.getSingleHostChromoTwoSize(i); ++m){
//            TheGeneVals.push_back(EnvObj.getSingleHostRealGeneTwo(i, m));
//        }
        AllGenomesSize.push_back((int) TheGeneVals.size());
        auto ShOut = getShannonIndx(TheGeneVals);
        int mhcTypes = std::get < 1 >( ShOut );
        UniqueMHCs.push_back(mhcTypes);
    }
    std::ofstream HostGeneNumbTotal;
    HostGeneNumbTotal.open("HostGeneNumbTotal_ChrOne.csv",
                            std::ios::out | std::ios::ate | std::ios::app);
    HostGeneNumbTotal << tayme;
    for(unsigned long ii = 0; ii < AllGenomesSize.size(); ++ii){
        HostGeneNumbTotal << " " << AllGenomesSize[ii];
    }
    HostGeneNumbTotal << std::endl;
    HostGeneNumbTotal.close();
    
    std::ofstream HostMHCNumbUnique;
    HostMHCNumbUnique.open("HostMHCsNumbUniq_ChrOne.csv",
                            std::ios::out | std::ios::ate | std::ios::app);
    HostMHCNumbUnique << tayme;
    for(unsigned long jj = 0; jj < UniqueMHCs.size(); ++jj){
        HostMHCNumbUnique << " " << UniqueMHCs[jj];
    }
    HostMHCNumbUnique << std::endl;
    HostMHCNumbUnique.close();
}

/**
 * @brief Data harvesting method. Record the indices of fixed bits that are not allow to mutate in all
 * pathogen species. Run this just ones. 
 * 
 * @param EnvObj - the Environment class object
 */
void DataHandler::savePathoNoMuttList(Environment& EnvObj){
    if(ifNoMuttPathoListUnique){
        std::ofstream NoMuttPathoList;
        NoMuttPathoList.open("NoMutationInPathoList.csv");
        NoMuttPathoList << "#list_of_bits_excluded_from_mutating_Each_line_is_a_spp"
                << std::endl;
        NoMuttPathoList.close();
        ifNoMuttPathoListUnique = false;
    }
    std::ofstream NoMuttPathoList;
    NoMuttPathoList.open("NoMutationInPathoList.csv",
                            std::ios::out | std::ios::ate | std::ios::app);
    NoMuttPathoList << EnvObj.getFixedBitsInAntigens();
    NoMuttPathoList.close();
}

/**
 * @brief Data harvesting method. Saves the number of presented pathogens by each indrividual host in each time step.
 * First column is time stamp (hosts generation number).
 *
 * @param EnvObj - the Environment class object
 * @param tayme - time stamp (hosts generation number)
 */
void DataHandler::savePresentedPathos(Environment &EnvObj, int tayme) {
    if(ifNumberOfPresentedPatho){
        std::ofstream PresentedPathoNumb;
        PresentedPathoNumb.open("PresentedPathogenNumbers.csv");
        PresentedPathoNumb << "#time number_of_pathogens_presented_by_hosts"
                << std::endl;
        PresentedPathoNumb.close();
    ifNumberOfPresentedPatho = false;
    }
    std::ofstream PresentedPathoNumb;
    PresentedPathoNumb.open("PresentedPathogenNumbers.csv",
                            std::ios::out | std::ios::ate | std::ios::app);
    PresentedPathoNumb << tayme;
    PresentedPathoNumb << EnvObj.getNumbersOfPathogensPresented();
    PresentedPathoNumb.close();
}


/**
 * @brief Data harvesting method. Records the number of unique MHCs a "mother" and
 * a "farther" had. First column is time stamp (hosts generation number).
 *
 * Writes to two separate files in each time step the number of unique MHCs a
 * seceting individual had (the "mather") in file NumberOfMhcInMother.csv and
 * how many unique MHCs the selected individual had (the "father") in file
 * NumberOfMhcInFather.csv. Both files are in sync - one line is same time
 * stamp, one enty in both lines is the same individual.
 *
 * @param EnvObj - the Environment class object
 * @param tayme - time stamp (hosts generation number)
 */
void DataHandler::saveMhcNumbersWhenMating(Environment &EnvObj, int tayme) {
    if(ifNumberOfMhcWhenMating){
        std::ofstream NumberOfMhcInMotherWnenMating;
        NumberOfMhcInMotherWnenMating.open("NumberOfMhcInMother.csv");
        NumberOfMhcInMotherWnenMating << "#time number_of_MHCs_in_mother"
                                      << std::endl;
        NumberOfMhcInMotherWnenMating.close();
        std::ofstream NumberOfMhcInFatherWhenMating;
        NumberOfMhcInFatherWhenMating.open("NumberOfMhcInFather.csv");
        NumberOfMhcInFatherWhenMating <<"#time number_of_MHCs_in_father"
                                      << std::endl;
        NumberOfMhcInFatherWhenMating.close();
        ifNumberOfMhcWhenMating = false;
    }
    std::ofstream NumberOfMhcInMotherWnenMating;
    NumberOfMhcInMotherWnenMating.open("NumberOfMhcInMother.csv",
                                       std::ios::out | std::ios::ate | std::ios::app);
    NumberOfMhcInMotherWnenMating << tayme;
    NumberOfMhcInMotherWnenMating << EnvObj.getNumbersOfMhcInMother();
    NumberOfMhcInMotherWnenMating.close();
    std::ofstream NumberOfMhcInFatherWhenMating;
    NumberOfMhcInFatherWhenMating.open("NumberOfMhcInFather.csv",
                                       std::ios::out | std::ios::ate | std::ios::app);
    NumberOfMhcInFatherWhenMating << tayme;
    NumberOfMhcInFatherWhenMating << EnvObj.getNumbersOfMhcInFather();
    NumberOfMhcInFatherWhenMating.close();
}

/**
 * @brief Saves the number of unique MHC types of each individual in each time step. Should be used BEFORE
 * mating occurs. First column is time stamp (hosts generation number).
 *
 * @param EnvObj - the Environment class object
 * @param tayme - time stamp (hosts generation number)
 */
void DataHandler::saveMhcNumbersBeforeMating(Environment &EnvObj, int tayme) {
    if(ifNumberOfMhcBeforeMating){
        std::ofstream NumberOfMhcBeforeMating;
        NumberOfMhcBeforeMating.open("NumberOfMhcBeforeMating.csv");
        NumberOfMhcBeforeMating << "#time number_of_MHCs_before_mating"
                                      << std::endl;
        NumberOfMhcBeforeMating.close();
        ifNumberOfMhcBeforeMating = false;
    }
    std::ofstream NumberOfMhcBeforeMating;
    NumberOfMhcBeforeMating.open("NumberOfMhcBeforeMating.csv",
                                       std::ios::out | std::ios::ate | std::ios::app);
    NumberOfMhcBeforeMating << tayme;
    NumberOfMhcBeforeMating << EnvObj.getNumbersOfUniqueMHCs();
    NumberOfMhcBeforeMating.close();

}

/**
 * @brief Saves the number of unique MHC types of each individual in each time step. Should be used AFTER
 * mating occurs.
 *
 * @param EnvObj - the Environment class object
 * @param tayme - time stamp (hosts generation number)
 */
void DataHandler::saveMhcNumbersAfterMating(Environment &EnvObj, int tayme) {
    if(ifNumberOfMhcAfterMating){
        std::ofstream NumberOfMhcBeforeMating;
        NumberOfMhcBeforeMating.open("NumberOfMhcAfterMating.csv");
        NumberOfMhcBeforeMating << "#time number_of_MHCs_after_mating"
                                << std::endl;
        NumberOfMhcBeforeMating.close();
        ifNumberOfMhcAfterMating = false;
    }
    std::ofstream NumberOfMhcBeforeMating;
    NumberOfMhcBeforeMating.open("NumberOfMhcAfterMating.csv",
                                 std::ios::out | std::ios::ate | std::ios::app);
    NumberOfMhcBeforeMating << tayme;
    NumberOfMhcBeforeMating << EnvObj.getNumbersOfUniqueMHCs();
    NumberOfMhcBeforeMating.close();
}