#!/usr/bin/env python3.5
# -*- coding: utf-8 -*-
"""
Walks the directory tree looking for model runs which are characterized by same
parametrisation as the template file provided by the user. Then process these
results by fancy stats and plots that processed output on a nice graph.

Created on Tue May 10 18:53:47 2016
for Evolutionary Biology Group, Faculty of Biology
    Adam Mickiewicz University, Poznan, Poland
@author: Piotr Bentkowski - bentkowski.piotr@gmail.com
"""
import os
import re
import sys
import json
import datetime as dt
# import linecache as ln
import numpy as np
import numpy.polynomial.polynomial as poly
import matplotlib.pyplot as plt
import scipy.stats


# """Data type for loading data from files HostsGeneDivers.csv"""
inType = np.dtype([('time', np.int), ('pop_size', np.int),
                   ('tot_num_of_genes', np.int), ('num_of_MHC_types', np.int),
                   ('Shannon_indx', np.float), ('mean_fitness', np.float),
                   ('std_fitness', np.float)])
# """Data type for storing processed data"""
outType = np.dtype([('VAR', 'f8'), ('VARX', 'f8'), ('meanAllel', 'f8'),
                    ('stdAllel', 'f8'), ('slope', 'f8'), ('indvMean', 'f8'),
                    ('indvSTD', 'f8'), ('meanFitt', 'f8'), ('stdFitt', 'f8'),
                    ('cvFitMean', 'f8'), ('cvFitSTD', 'f8'),
                    ('meanPato', 'f8'), ('stdPato', 'f8'),
                    ('sourceDir', 'S199')])
# """Data type for storing data processed even more (averages for the final plots)"""
meanTyp = np.dtype([('VAR', 'f8'), ('VARX', 'f8'), ('meanAllel', 'f8'),
                    ('stdAllel', 'f8'), ('indvMean', 'f8'), ('indvSTD', 'f8'),
                    ('meanFitt', 'f8'), ('stdFitt', 'f8'), ('cvFitMean', 'f8'),
                    ('cvFitSTD', 'f8'), ('meanPato', 'f8'), ('stdPato', 'f8')])


def getVarxLabel(filepath):
    """Acquires the name of the VARX variable from input file to later place it
    as the plot's x-axis label."""
    try:
        with open(filepath, 'r') as f:
            for ii, line in enumerate(f):
                if re.search("VARX", line):
                    return line.split()[0]
                else:
                    pass
        print("ERROR in getVarxLabel(): Cannot find the X label.")
        return None
    except Exception:
        print("ERROR in getVarxLabel(): Cannot get the X label.")
        return None


def loadParamSettings(filepath):
    """Loads model's parametrisation from i.g. InputParameters.json file into
    a handy list. """
    nogphoch = 'number_of_genes_per_host_one_chromosome'
    nopgpohg = 'number_of_pathogen_generation_per_one_host_generation'
    hmnogich = 'host_maximal_number_of_genes_in_chromosome'
    paramzList = []
    try:
        with open(filepath) as f:
            prms = json.load(f)
        paramzList.append(prms['number_of_threads'])
        paramzList.append(prms['number_of_bits_per_gene'])
        paramzList.append(prms['number_of_bits_per_antigen'])
        paramzList.append(prms['host_population_size'])
        paramzList.append(prms['pathogen_population_size'])
        paramzList.append(prms['number_of_pathogen_species'])
        paramzList.append(prms[nogphoch])
        paramzList.append(prms[nopgpohg])
        paramzList.append(prms['number_of_host_generations'])
        paramzList.append(prms['mutation_probability_in_host'])
        paramzList.append(prms['mutation_probability_in_pathogen'])
        paramzList.append(prms['separated_species_genomes'])
        paramzList.append(prms['host_gene_deletion_probability'])
        paramzList.append(prms['host_gene_duplication_probability'])
        paramzList.append(prms[hmnogich])
        paramzList.append(prms['number_of_sex_mates'])
        paramzList.append(prms['alpha_factor_for_the_host_fitness_function'])
        return paramzList
    except Exception:
        print("ERROR in loadParamSettings(): Cannot load params into a list.")
        return None


def compareParams(template, paramz):
    """Compares parameters of two runs. They have to be loaded into a list
    first, i.g. with loadParamSettings() function."""
    same = None
    if len(template) == len(paramz):
        for ii, itm in enumerate(zip(template, paramz)):
            try:
                ITM_0 = float(itm[0])
                ITM_1 = float(itm[1])
            except Exception:
                ITM_0 = str(itm[0])
                ITM_1 = str(itm[1])
            if(itm[0] == "VARX" or itm[0] == "VAR" or itm[0] == "IRR" or
               ii <= 1 or ii >= 19):
                pass
            elif ITM_0 == ITM_1:
                same = True
            else:
                same = False
                break
    else:
        print("ERROR in compareParams(): Params lists have different length.")
        return same
    if same is None:
        print("ERROR in compareParams(): Comparison failed to commence.")
    return same


def lookForVAR(template):
    """Checks which parameters are designated to be investigated as independent
    variables. Gets their name in the JSON file with parameter description. You
    have to provide a different template JSON file."""
    varrs = {"VAR": "", "VARX": "", "IRR": ""}
    with open(template) as f:
        prms = json.load(f)
    for itm in prms.keys():
        if(prms[itm] == "VAR"):
            varrs["VAR"] = itm
        elif(prms[itm] == "VARX"):
            varrs["VARX"] = itm
        elif (prms[itm] == "IRR"):
            varrs["IRR"] = itm
        else:
            pass
    return varrs


def lookForVARinList(templateList):
    """Checks which parameters are designated to be investigated as independent
    variables. Gets their index in the list of template parameter description.
    The list can be genarated with `loadParamSettings(templateFile)`."""
    varsList = {"VAR": 0, "VARX": 0, "IRR": 0}
    for ii, itm in enumerate(templateList):
        if(itm == "VAR"):
            varsList["VAR"] = ii
        elif(itm == "VARX"):
            varsList["VARX"] = ii
        elif(itm == "IRR"):
            varsList["IRR"] = ii
        else:
            pass
    return varsList


def readDate(string):
    """Takes a string and tries to convert it into a date. String has to have
    the ISO yyyy-mm-dd format"""
    try:
        dd = string.split("-")
        theDate = dt.date(int(dd[0]), int(dd[1]), int(dd[2]))
        return theDate
    except Exception:
        print("ERROR in readDate(): Bad string format! It has to be ISO's",
              "yyyy-mm-dd format!")
        return None


def loadTheDateFromParamFile(filePar):
    """Takes InputParameters.json file and tries to figure out what day the run
    was started."""
    try:
        with open(filePar) as f:
            prms = json.load(f)
        ll = prms['run_start_date_and_time'].split(".")[0].split("-")
#        ll = re.split(" ", ln.getline(filePar, 2))[2].split(".")[0].split("-")
    except Exception:
        print("ERROR in loadTheDate(): Cannot load the Params file. Check if",
              "the path to the params file is correct as well as its name.")
        return None
    try:
        theDay = dt.date(int(ll[0]), int(ll[1]), int(ll[2]))
        return theDay
    except Exception:
        print("ERROR in loadTheDate(): Cannot convert data into the date",
              "format. Check if the data file has the right flavour.")
        return None


def getTheData(theStartDate, templateList, genrsUsed=1000, dirr=os.getcwd()):
    """Walking the dir using Python 3.5. Variable theStartDate has to be
    a datetime.date() data type."""
    nopgpohg = 'number_of_pathogen_generation_per_one_host_generation'
    vv = lookForVARinList(templateList)
    datOut = []
    dataOrdering = ['VAR', 'VARX', 'meanAllel', 'stdAllel', 'slope']
    for dirName, subdirList, fileList in os.walk(dirr):
        for file in fileList:
            filepath = os.path.join(dirName, file)
            if(filepath == os.path.join(dirName, 'InputParameters.json') and
               loadTheDateFromParamFile(filepath) >= theStartDate):
                paramzList = loadParamSettings(filepath)
                with open(filepath) as f:
                    prms = json.load(f)
                if compareParams(templateList, paramzList):
                    path_spp = float(prms['number_of_pathogen_species'])
#                    ll = re.split(" ", ln.getline(filepath, 9))
#                    path_spp = float(ll[2].split()[0])
                    pathoNorm = float(prms[nopgpohg]) * path_spp
#                    ll = re.split(" ", ln.getline(filepath, 12))
#                    pathoNorm = float(ll[2].split()[0]) * path_spp
                    var = float(paramzList[vv['VAR']])
                    varx = float(paramzList[vv['VARX']])
                    dataFilePath = os.path.join(dirName, "HostsGeneDivers.csv")
                    data = np.genfromtxt(dataFilePath, dtype=inType)
                    EqPt = len(data) - genrsUsed
                    if EqPt <= 0:
                        print("ERROR in getTheData(): not enough generations",
                              "in run", dirName, ";", EqPt, "is not good.")
                        sys.exit(1)
                    c0, c1 = poly.polyfit(data['time'][EqPt::],
                                          data['num_of_MHC_types'][EqPt::], 1)
                    meanAlle = data['num_of_MHC_types'][EqPt::].mean()
                    stdAlle = data['num_of_MHC_types'][EqPt::].std()
                    meanFitt = data['mean_fitness'][EqPt::].mean() / pathoNorm
#                    stdFitt = np.std(data['mean_fitness'][EqPt::] / pathoNorm)
                    cvFitt = data['std_fitness']/data['mean_fitness']
                    cvFitt = cvFitt[EqPt::]
                    cvFitt = cvFitt[~np.isnan(cvFitt)]
                    cvFittMean = np.mean(cvFitt) / pathoNorm
                    cvFittSTD = np.std(cvFitt) / pathoNorm
                    dataFilePath = os.path.join(dirName,
#                                                "HostMHCsNumbUniq_ChrOne.csv")
#                                                "NumberOfMhcAfterMating.csv")
                                                "NumberOfMhcBeforeMating.csv")
                    hgsUNIQ = np.genfromtxt(dataFilePath)
                    # Note, that the MHC type number is given per 1 chromosome
                    indvMean = np.mean(hgsUNIQ[EqPt:, 1:])
                    indvSTD = np.std(hgsUNIQ[EqPt:, 1:])
                    stdFitt = np.std(data['mean_fitness'][EqPt::] / pathoNorm)
                    dataFilePath = os.path.join(dirName,
                                                "PresentedPathogenNumbers.csv")
                    try:
                        patoPres = np.genfromtxt(dataFilePath)
                        patoMean = np.mean(patoPres[EqPt:, 1:]) / pathoNorm
                        patoSTD = np.std(patoPres[EqPt:, 1:]) / pathoNorm
                    except OSError:
                        print("No PresentedPathogenNumbers.csv in:", dirName)
                        patoMean = np.nan
                        patoSTD = np.nan
                    datOut.append((var, varx, meanAlle, stdAlle, c1,
                                   indvMean, indvSTD, meanFitt, stdFitt,
                                   cvFittMean, cvFittSTD, patoMean, patoSTD,
                                   dirName))
    datOut = np.array(datOut, dtype=outType)
    return np.sort(datOut, order=dataOrdering)


def checkOneParamValue(templateList, theStartDate,
                       theParam='run_start_date_and_time', dirr=os.getcwd()):
    """Auxiliary function. Crawls the directory tree according to given
    template and minimal date, searches the runs with parametrisations
    compatible with the template file and run after the given date and extracts
    from them just one parameter value. Useful to check if some parameters are
    there or still missing before running time-consuming `getTheData()`
    function."""
    datOut = []
    for dirName, subdirList, fileList in os.walk(dirr):
        for file in fileList:
            filepath = os.path.join(dirName, file)
            if(filepath == os.path.join(dirName, 'InputParameters.json') and
               loadTheDateFromParamFile(filepath) >= theStartDate):
                paramzList = loadParamSettings(filepath)
                with open(filepath) as f:
                    prms = json.load(f)
                if compareParams(templateList, paramzList):
                    datOut.append((theParam, prms[theParam], dirName))
    return datOut


def buildStats(theData):
    """Averages the data generated by getTheData() function and formats them
    into Numpy array suitable for latter plotting."""
    LL = []
    for itm in theData:
        tt = (itm['VAR'], itm['VARX'])
        if tt in LL:
            pass
        else:
            LL.append(tt)
    meanResult = []
    for ii in LL:
        ww = theData[theData['VAR'] == ii[0]]
        ww = ww[ww['VARX'] == ii[1]]
        NN = float(len(ww))
        meanAll = np.mean(ww['meanAllel'])
        stdAll = np.sqrt(np.sum(ww['stdAllel']**2) / NN)
        meanIndv = np.mean(ww['indvMean'])
        stdSTD = np.sqrt(np.sum(ww['indvSTD']**2) / NN)
        meanFitt = np.mean(ww['meanFitt'])
        stdFitt = np.sqrt(np.sum(ww['stdFitt']**2) / NN)
        meanCvFit = np.mean(ww['cvFitMean'])
        stdCvFit = np.sqrt(np.sum(ww['cvFitSTD']**2) / NN)
        patoMean = np.nanmean(ww['meanPato'])
        patoSTD = np.sqrt(np.nansum(ww['stdPato']**2) / NN)
        meanResult.append((ii[0], ii[1], meanAll, stdAll, meanIndv, stdSTD,
                           meanFitt, stdFitt, meanCvFit, stdCvFit, patoMean,
                           patoSTD))
    return np.array(meanResult, dtype=meanTyp)


def confidence_interval(data, confidence=0.95):
    """Computes a confidence interval from sample data."""
    a = 1.0 * np.array(data)
    n = len(a)
    se = scipy.stats.sem(a)
    h = se * scipy.stats.t.ppf((1 + confidence) / 2., n-1)
    return h


def buildStats95CI(theData):
    """Averages the data generated by getTheData() function and formats them
    into Numpy array suitable for latter plotting with 95% confidence interval.
    """
    LL = []
    for itm in theData:
        tt = (itm['VAR'], itm['VARX'])
        if tt in LL:
            pass
        else:
            LL.append(tt)
    meanResult = []
    for ii in LL:
        ww = theData[theData['VAR'] == ii[0]]
        ww = ww[ww['VARX'] == ii[1]]
        meanAll = np.mean(ww['meanAllel'])
        ciAll = confidence_interval(ww['meanAllel'])
        meanIndv = np.mean(ww['indvMean'])
        ciINDV = confidence_interval(ww['indvMean'])
        meanFitt = np.mean(ww['meanFitt'])
        ciFitt = confidence_interval(ww['meanFitt'])
        meanCvFit = np.mean(ww['cvFitMean'])
        ciCvFit = confidence_interval(ww['cvFitMean'])
        patoMean = np.nanmean(ww['meanPato'])
        xx = ww['meanPato']
        patoci = confidence_interval(xx[~np.isnan(xx)])
        meanResult.append((ii[0], ii[1], meanAll, ciAll, meanIndv, ciINDV,
                           meanFitt, ciFitt, meanCvFit, ciCvFit, patoMean,
                           patoci))
    return np.array(meanResult, dtype=meanTyp)


def plotAllAllesInPop(meanResult, x_label, logsc='linear'):
    """Uses the array generated by buildStats() function and plots a fancy plot
    of averaged data."""
    FS = 22
    annoSize = int(0.85*FS)
    ll = []
#    maxX = 1.15 * float(np.max(meanResult[:, 1]))
#    limitz = (0., maxX)
    figSize = (12, 9)
    for itm in meanResult:
        if itm[0] in ll:
            pass
        else:
            ll.append(itm[0])
    # First plot - unique MHC alleles in population
    plt.figure(1, figsize=figSize)
    for var in ll:
        ww = meanResult[meanResult['VAR'] == var]
        plt.errorbar(ww['VARX'], ww['meanAllel'], ww['stdAllel'],
                     lw=2, marker="o", ms=8)
        plt.annotate(str(var), xy=(ww['VARX'][-1], ww['meanAllel'][-1]),
                     size=annoSize)
    plt.xlabel(str(x_label), fontsize=FS)
    plt.ylabel("mean number of MHCs in population", fontsize=FS)
#    plt.xlim(limitz)
#    plt.ylim((0, 20))
    plt.ylim(bottom=0)
    plt.xscale(logsc)
    plt.tick_params(axis='both', labelsize=annoSize)
    plt.grid(True)
    # Second plot - unique MHC alleles in an individual
    plt.figure(2, figsize=figSize)
    for var in ll:
        ww = meanResult[meanResult['VAR'] == var]
        plt.errorbar(ww['VARX'], ww['indvMean'], ww['indvSTD'],
                     lw=2, marker="o", ms=8)
        plt.annotate(str(var), xy=(ww['VARX'][-1], ww['indvMean'][-1]),
                     size=annoSize)
    plt.xlabel(str(x_label), fontsize=FS)
    plt.ylabel("average number of MHCs copies in an indiv.",
               fontsize=FS)
#    plt.xlim(limitz)
#    plt.ylim((0, 10))
    plt.ylim(bottom=0)
    plt.xscale(logsc)
    plt.tick_params(axis='both', labelsize=annoSize)
    plt.grid(True)
    plt.figure(3, figsize=figSize)
    for var in ll:
        ww = meanResult[meanResult['VAR'] == var]
        plt.errorbar(ww['VARX'], ww['meanFitt'], ww['stdFitt'],
                     lw=2, marker="o", ms=8)
        plt.annotate(str(var), xy=(ww['VARX'][-1], ww['meanFitt'][-1]),
                     size=annoSize)
    plt.xlabel(str(x_label), fontsize=FS)
    plt.ylabel("hosts average fitness normalized per number\nof pathogen" +
               " spp. and pathogen generations", fontsize=FS)
#    plt.xlim(limitz)
    plt.ylim(bottom=0)
    plt.xscale(logsc)
    plt.tick_params(axis='both', labelsize=annoSize)
    plt.grid(True)
    plt.figure(4, figsize=figSize)
    for var in ll:
        ww = meanResult[meanResult['VAR'] == var]
        plt.errorbar(ww['VARX'], ww['meanPato'], ww['stdPato'],
                     lw=2, marker="o", ms=8)
        plt.annotate(str(var), xy=(ww['VARX'][-1], ww['meanPato'][-1]),
                     size=annoSize)
    plt.xlabel(str(x_label), fontsize=FS)
    plt.ylabel("number of presented pathogens normalized per\n number of " +
               "pathogen spp. and pathogen generations", fontsize=FS)
#    plt.xlim(limitz)
    plt.ylim(bottom=0)
    plt.xscale(logsc)
    plt.tick_params(axis='both', labelsize=annoSize)
    plt.grid(True)
#    plt.show()


def plotDotMeans(theData):
    """Plots number of MHC alleles in population vs average number of MHC types
    in an individual."""
#    clrs = ['bo', 'go', 'ro', 'co', 'mo']  # , 'yo'  , 'ko', 'wo']
    clrs = ['bo', 'go', 'ro', 'co', 'mo', 'yo']
    clrs += ['bv', 'gv', 'rv', 'cv', 'mv', 'yv', 'kv', 'wv']
    clrs += ['bo', 'go', 'ro', 'co', 'mo', 'yo', 'ko', 'wo']
    FS = 18
    annoSize = int(0.85*FS)
    ll = []
    for itm in theData:
        if (itm['VAR'], itm['VARX']) in ll:
            pass
        else:
            ll.append((itm['VAR'], itm['VARX']))
    plt.figure(5, figsize=(10, 7))
    k = 0
    for var in ll:
        ww = theData[theData['VAR'] == var[0]]
        ww = ww[ww['VARX'] == var[1]]
        lbl = str(var[0]) + " ; " + str(var[1])
        plt.plot(ww['meanAllel'], ww['indvMean'], clrs[k], ms=8, label=lbl)
        k += 1
    print("There are", k, "sets of values")
    plt.legend(loc='lower right', numpoints=1, ncol=2, fontsize=10)
    plt.xlabel("mean number of unique MHC alleles in population",
               fontsize=FS)
    plt.ylabel("average number of unique MHC\ntypes in an individual",
               fontsize=FS)
    plt.xlim(left=0)
    plt.ylim(bottom=0)
    plt.tick_params(axis='both', labelsize=annoSize)
    plt.grid(True)
#    plt.show()


def loadTheStuuff(dataSlice, specFile, dataType):
    """Loads the data from post-processed files. Useful when working in Ipython
    console.
     . dataSlice - path to *DataSlice.csv type of file
     . specFile - path to parameter file type of file"""
    try:
        dd = np.genfromtxt(dataSlice, dtype=dataType)
        for itm in dd:
            itm[-1] = itm[-1][2:-1]
        meanResult = buildStats(dd)
        x_Label = getVarxLabel(specFile)
        return dd, meanResult, x_Label
    except Exception:
        print("Bump... Nope...")
        return None


def main():
    """Main function - the script's main body."""
    if len(sys.argv) <= 4:
        print("Two arguments are needed:")
        print("  1. Give a starting date. It has to be in yyyy-mm-dd format.")
        print("  2. Give the path to template file.")
        print("  3. Give number of host generations after which calculate.",
              "the statistics.")
        print("  4. Give the output file name's prefix (e.g. the value",
              "of alpha.")
        sys.exit()
    startDate = None
    headerr = 'VAR VARX meanAllel stdAllel slope indvMean indvSTD meanFitt '\
        + 'stdFitt meanCvFitt cvFitSTD meanPatho stdPato sourceDir'
    try:
        startDate = readDate(sys.argv[1])
        workingDir = os.getcwd()
    except ValueError:
        print("Cannot convert argument #1 to a date format.")
        sys.exit()
    if startDate:
        try:
            template = loadParamSettings(sys.argv[2])
            if template is None:
                print("Failed to load the template file. Exiting.",
                      "Check if the path is correct - you may wish to provide",
                      "an absolute path.")
                sys.exit()
            x_Label = getVarxLabel(sys.argv[2])
        except Exception:
            print("Cannot load the template file. Exiting.")
            sys.exit()
        if True:
            theData = getTheData(startDate, template, workingDir)
            print(theData)
#        except Exception:
        else:
            print("Failed to process the data. Some serious issues arose.",
                  "Check if the cut-off host generation for calculating stats",
                  "is smaller than the total number of host generations.")
            sys.exit()
        if len(theData):
            FMT = '%.4e %.4e %.4e %.4e %.4e %.4e %.4e %.4e %.4e %.4e %.4e' \
                + ' %.4e %.4e %s'
            outFile = str(sys.argv[4]) + "DataSlice.csv"
            open(outFile, 'w').close()
            np.savetxt(outFile, theData, fmt=FMT, header=headerr,
                       comments='#')
            for itm in theData:
                for ii in range(len(itm) - 1):
                    print(itm[ii], "\t", end=" ")
                print()
            print("Check the output file:", str(os.getcwd()) + "/" +
                  outFile + " for details.")
            meanResult = buildStats(theData)
            plotAllAllesInPop(meanResult, x_Label)
            plotDotMeans(theData)
            plt.show()
        else:
            print("No data files matching the criterions were found.",
                  "Specify your template file.")
            sys.exit()
    else:
        print("Wrong date format.")
        sys.exit()


if __name__ == "__main__":
    main()
