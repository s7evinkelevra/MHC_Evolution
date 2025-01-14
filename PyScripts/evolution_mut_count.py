#!/usr/bin/env python3.5
# -*- coding: utf-8 -*-
"""
Loads the file HostGenomesFile.XXXX.csv (final snapshot of the host
population) and calculates how many mutation got fixated during the MHCs'
evolution. Plots the histogram.

Created on Thu Nov  5 14:30:59 2015
for Evolutionary Biology Group, Faculty of Biology
    Adam Mickiewicz University, Poznan, Poland
@author: Piotr Bentkowski - bentkowski.piotr@gmail.com
"""
import re
import sys
import json
# import linecache as ln
import numpy as np
import matplotlib.pyplot as plt
import bitstring as bts


def loadHostPopulation(FILE):
    '''Takes the file with all the hosts data and loads it to a list. Each
    individual is loaded as a list of bit strings. And the population is a list
    of individuals.'''
    B_list = []
    Mut_list = []
    try:
        with open(FILE) as infile:
            for line in infile:
                if re.search(r"#", line):
                    continue
                elif re.search(r"===", line):
                    continue
                else:
                    LL = line.split()
#                    bb = int(LL[3])
                    bb = bts.BitString(bin=LL[0]).int
                    if bb in B_list:
                        pass
                    else:
                        B_list.append(bb)
                        Mut_list.append((len(LL) - 4) // 2)
        return np.array(Mut_list)
    except IOError as e:
        print("I/O error({0}) in".format(e.errno) +
              " loadTheHostPopulation(): {0}".format(e.strerror))


def main():
    if len(sys.argv) <= 1:
        print("Give the name of the file with data at the end of simulation.")
        sys.exit()
    try:
        with open('InputParameters.json') as f:
            prms = json.load(f)
#        l = re.split(" ", ln.getline("InputParameters.csv", 9))
        try:
            pathoSpp = int(prms['number_of_pathogen_species'])
#            pathoSpp = int(l[2])
        except Exception:
            pathoSpp = str(prms['number_of_pathogen_species'])
#            pathoSpp = str(l[2])
        print("No. of pathogen species =", pathoSpp)
    except Exception:
        print("Can't find parameter file! You may be in a wrong directory.")
        sys.exit()
    try:
        L_endd = loadHostPopulation(sys.argv[1])
        print("File loaded!")
    except Exception:
        print("Can't load file named" + str(sys.argv[1]) +
              ". Check if it exists.")
        sys.exit()
    print("Mean mutation number per gene: " + str(L_endd.mean()) +
          " +/- " + str(L_endd.std()))
    # === More generic plot ===
    ax_label = 20
    T_label = 24
    TicksFS = 18
    transs = 0.8
    plt.figure(1, figsize=(12, 7))
    plt.hist(L_endd, color=(0.3, 0.3, 0.7, transs), edgecolor="none")
    plt.title("End of simulation", fontsize=T_label)
    plt.xlabel("Number of accumulated mutation in MHCs", fontsize=ax_label)
    plt.xticks(fontsize=TicksFS)
    plt.yticks(fontsize=TicksFS)
    plt.grid(True)
#    plt.xlim(0., 20.)
    plt.savefig("HOST_muts_end.png")

    plt.show()

    print("DONE!")


if __name__ == "__main__":
    main()
