/* 
 * File:   Pathogen.h
 * Author: Piotr Bentkowski : bentkowski.piotr@gmail.com
 *
 * Created on 18 February 2015, 13:11
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
#ifndef PATHOGEN_H
#define	PATHOGEN_H

#include <cstdlib>
#include <vector>
#include <string>
#include "boost/dynamic_bitset.hpp"

#include "Antigen.h"

typedef boost::dynamic_bitset<> anigenstring;
typedef std::vector<Antigen> antigenvector;

/**
 * @brief Core class. Stores and handles a single pathogen object. Each pathogen
 * can have just one instance of the Antigen class objects. Has methods for calling
 * methods to mutate the antigen, stores stats regarding the pathogen (infected hosts etc.)
 */
class Pathogen {
public:
    Pathogen();
//    Pathogen(const Pathogen& orig);
    virtual ~Pathogen();
    // === Core methods ===
//    std::vector<unsigned long> HostsInfected; // which host are infected
    unsigned NumOfHostsInfected;  // how many host are infected
    int SelectedToReproduct;
    void setNewPathogen(unsigned long antigen_size, unsigned long mhcSize,
                        int species, int timeStamp, Random& randGen, Tagging_system& tag);
    void setNewPathogenNthSwap(anigenstring antigen, unsigned long int Tag, unsigned long mhcSize,
                               int species, int timeStamp, int Nth);
    Antigen getAntigenProt();
    void chromoMutProcess(double mut_probabl, unsigned long mhcSize, int timeStamp, Random& randGen, Tagging_system& tag);
    void chromoMutProcessWithRestric(double mut_probabl, unsigned long mhcSize, int timeStamp,
                                     std::set<unsigned long>& noMutts, Random& randGen, Tagging_system& tag);
    void setNewSpeciesNumber(int new_spp_num);
    int getSpeciesTag();
    void clearInfections();
    // === Data harvesting methods ===
    std::string stringGenesFromGenome();
    // === Auxiliary methods ===
    void printGenesFromGenome();
private:
    Antigen PathoProtein;
    int Species;
};

#endif	/* PATHOGEN_H */

