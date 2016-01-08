#!/usr/bin/env python2.7
# -*- coding: utf-8 -*-
"""
Plots generic statistics referring to time evolution of MHCs in hosts. These
are the number of MHC types, diversity of MHC types, host fitness etc.

Created on Mon May 18 17:03:31 2015
for Evolutionary Biology Group, Faculty of Biology
    Adam Mickiewicz University, Poznan, Poland
@author: Piotr Bentkowski - bentkowski.piotr@gmail.com
"""

import os
import re
import sys
import pylab as p
import linecache as ln


def LoadTheData(arg, dirname, files):
    for file in files:
        filepath = os.path.join(dirname, file)
        if filepath == os.path.join(dirname, 'HostsGeneDivers.csv'):
            genes = p.genfromtxt(filepath)
            paramsFile = os.path.join(dirname, 'InputParameters.csv')
            l = re.split(" ", ln.getline(paramsFile, 9))   # change here
            InterestigThing = float(l[2])
            l = re.split(" ", ln.getline(paramsFile, 11))
            geneNumb = float(l[2])
            l = re.split(" ", ln.getline(paramsFile, 16))
            hh = l[2].split()[0]
            print "antigens:", geneNumb, "| thing:", InterestigThing, " | ",
            print hh, "| dir:", dirname.split("/")[-1]
            arg.append((InterestigThing, geneNumb, hh, genes[:, 0],
                        genes[:, 3], genes[:, 4], genes[:, 5],
                        genes[:, 2], genes[:, 6]))


def main():
    TheData = []
    os.path.walk(os.getcwd(), LoadTheData, TheData)

    AxLabelFontSize = 22
    AxisTickFontSize = 22
    AnnotateFontSize = 19

    annotScale = 10
    annotShift = 200

    Xmax = 2500
    Ymax = 100
    textXlocal = 1500

    pathoGenSize = 1  # change to select a different set of data
    pathoNumSpec = int(sys.argv[1])  # change to select a different set of data
    saveFiggs = False  # True to save figures to disk, False to not save

    nnn = "antigens: " + str(pathoGenSize) + "   species: " + str(pathoNumSpec)

    dec_places = '%1.0f'

    p.figure(1, figsize=(16, 14))
    i = 1
    for item in TheData:
        if (item[1] == pathoGenSize and item[0] == pathoNumSpec):
            XX = float(item[3][annotShift + i*annotScale])
            YY = float(item[4][annotShift + i*annotScale])
            p.subplot(211)
            p.plot(item[3], item[7], 'b-')
            p.ylabel("total number of genes", fontsize=AxLabelFontSize)
            p.xticks(size=AxisTickFontSize)
            p.yticks(size=AxisTickFontSize)
            p.grid()
            p.subplot(212)
            p.plot(item[3], item[4], 'r-')
#            ax = p.annotate(dec_places % (item[0],), xy=(XX, YY),
#                            xycoords='data', fontsize=AnnotateFontSize)
            i = i + 1
            p.ylabel('number of  MHCs alles', fontsize=AxLabelFontSize)
            p.xlabel('time [host generations]', fontsize=AxLabelFontSize)
            p.axis([0, Xmax, 0, Ymax])
            p.xticks(size=AxisTickFontSize)
            p.yticks(size=AxisTickFontSize)
            p.grid()
    ax = p.annotate(nnn, xy=(textXlocal, 180), xycoords='data',
                    fontsize=AnnotateFontSize)
    if saveFiggs:
        p.savefig("g_" + str(pathoGenSize) + ".s_" +
                  str(pathoNumSpec) + "_allel_num.png")

    p.figure(2, figsize=(14, 7))
    i = 1
    for item in TheData:
        if (item[1] == pathoGenSize and item[0] == pathoNumSpec):
            XX = float(item[3][annotShift + i*annotScale])
            YY = float(item[5][annotShift + i*annotScale])
    #        print XX, YY
            if item[2] == "NO":
                ax = p.plot(item[3], item[5], 'r-')
            else:
                ax = p.plot(item[3], item[5], 'b-')
            ax = p.annotate(dec_places % (item[0],), xy=(XX, YY),
                            xycoords='data', fontsize=AnnotateFontSize)
            i = i + 1
            p.ylabel('Shannon\'s index', fontsize=AxLabelFontSize)
            p.xlabel('time [host generations]', fontsize=AxLabelFontSize)
            p.axis([0, Xmax, 0, 6])
            p.xticks(size=AxisTickFontSize)
            p.yticks(size=AxisTickFontSize)
    ax = p.annotate(nnn, xy=(textXlocal, 3.5), xycoords='data',
                    fontsize=AnnotateFontSize)
    p.grid()
    if saveFiggs:
        p.savefig("g_" + str(pathoGenSize) + ".s_" +
                  str(pathoNumSpec) + "_Shann.png")

    p.figure(3, figsize=(14, 7))
    i = 1
    for item in TheData:
        if (item[1] == pathoGenSize and item[0] == pathoNumSpec):
    #        print XX, YY
            if item[2] == "NO":
                ax = p.plot(item[3], item[8]/item[6], 'r-')
            else:
                ax = p.plot(item[3], item[8]/item[6], 'b-')
#            ax = p.annotate(dec_places % (item[0],), xy=(XX, YY),
#                            xycoords='data', fontsize=AnnotateFontSize)
            i = i + 1
            p.ylabel("CV fitness", fontsize=AxLabelFontSize)
            p.xlabel('time [host generations]', fontsize=AxLabelFontSize)
            p.axis([0, Xmax, 0, 2.5])
            p.xticks(size=AxisTickFontSize)
            p.yticks(size=AxisTickFontSize)
    ax = p.annotate(nnn, xy=(textXlocal, 2.0), xycoords='data',
                    fontsize=AnnotateFontSize)
    p.grid()
    if saveFiggs:
        p.savefig("g_" + str(pathoGenSize) + ".s_" +
                  str(pathoNumSpec) + "_H_CV_fitt.png")

    p.figure(4, figsize=(14, 7))
    i = 1
    for item in TheData:
        if (item[1] == pathoGenSize and item[0] == pathoNumSpec):
            XX = float(item[3][annotShift + i*annotScale])
            YY = float(item[6][annotShift + i*annotScale])
    #        print XX, YY
            if item[2] == "NO":
                ax = p.plot(item[3], item[8], 'r-')
            else:
                ax = p.plot(item[3], item[8], 'b-')
#            ax = p.annotate(dec_places % (item[0],), xy=(XX, YY),
#                            xycoords='data', fontsize=AnnotateFontSize)
            i = i + 1
            p.ylabel("hosts fitness", fontsize=AxLabelFontSize)
            p.xlabel('time [host generations]', fontsize=AxLabelFontSize)
            p.axis([0, Xmax, 0, 30.0])
            p.xticks(size=AxisTickFontSize)
            p.yticks(size=AxisTickFontSize)
#    ax = p.annotate(nnn, xy=(textXlocal, 25), xycoords='data',
#                    fontsize=AnnotateFontSize)
    p.grid()
    if saveFiggs:
        p.savefig("g_" + str(pathoGenSize) + ".s_" +
                  str(pathoNumSpec) + "_H_fitt.png")

    p.show()


if __name__ == "__main__":
    main()
