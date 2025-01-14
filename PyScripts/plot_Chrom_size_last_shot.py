#!/usr/bin/env python3.5
# -*- coding: utf-8 -*-
"""
Plots histogram of number of MHC alleles and all MHC genes in one chromosome
at the end of simulation.

Created on Tue Mar 15 10:17:01 2016
@author: Piotr Bentkowski - bentkowski.piotr@gmail.com
"""
import json
import numpy as np
import matplotlib.pyplot as plt


def main():
    """ """
    MAXX = 10
    XX_tikz = 1.0
    MAYY = 3500
#    MHC_all = 200
#    scale = 10**5

    FontSize = 20
    TickSize = 17
#    Y_max = 1.0
    Hpad = 0.05
    plt.rc('xtick', labelsize=TickSize)
    plt.rc('ytick', labelsize=TickSize)

    genMeans = np.genfromtxt("HostGeneNumbTotal_ChrOne.csv")
    mhcMeans = np.genfromtxt("HostMHCsNumbUniq_ChrOne.csv")
#    GenerData = np.genfromtxt("HostsGeneDivers.csv")
    print("Done loading data files!")

    with open('InputParameters.json') as f:
        prms = json.load(f)
    print("Number of pathogen species:", prms['number_of_pathogen_species'])

    binz = np.arange(0.5, MAXX+0.5, 1.0)
    tick_binz = np.arange(0, MAXX+1, XX_tikz)

    plt.figure(1, figsize=(14, 7))
    plt.hist(genMeans[-1, 1::], bins=binz, color=(0.3, 0.3, 0.3, 1.0),
             edgecolor="none")
    plt.hist(mhcMeans[-1, 1::], bins=binz, color=(0.8, 0.0, 0.0, 1.0),
             edgecolor="none")
    plt.vlines(100, 0, MAYY, color="b", lw=2)
    plt.xlabel("number of MHC alleles (red) and all MHC genes (gray) in" +
               " one chromosome", fontsize=FontSize)
    plt.ylabel("number of individuals", fontsize=FontSize)
    plt.ylim(ymax=MAYY, ymin=0)
    plt.xlim(xmax=MAXX)
    plt.xticks(tick_binz)
    plt.grid(True)
    plt.tight_layout(h_pad=Hpad)
    plt.savefig("genome_size_hist.png")
    plt.show()


if __name__ == "__main__":
    main()
