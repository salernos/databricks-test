rm(list=ls())

#=======================================================================================================#
#                                                                                                       #
#  Program Name: 815_00_TEST.R                                                                          #
#                                                                                                       #
#  Author:       Stephen Salerno                                                                        #
#                                                                                                       #
#  Purpose:      Test code for 'quadsum815' package                                                     #
#                                                                                                       #
#  Input File:   quadsum815_1.0.tar.gz                                                                  #
#                                                                                                       #
#  Output File:  N/A                                                                                    #
#                                                                                                       #
#  Notes:        None                                                                                   #
#                                                                                                       #
#  Revisions:    2019.01.14 - First Script, No Revisions                                                #
#                                                                                                       #
#  Last Update:  2019.01.14                                                                             #
#                                                                                                       #
#=======================================================================================================#


#--- Install and Load Package --------------------------------------------------------------------------#

install.packages("quadsum815_1.0.tar.gz",repos=NULL)

library(quadsum815)


#--- Check Help Documentation --------------------------------------------------------------------------#

help(quadsum815)   # NEED

help(quadsumR)     # A loop-based R implementation for computing x'Ay
help(quadsumS)     # A loop-free R implementation for computing x'Ay
help(quadsumT)     # Matrix-based computation of x'Ay
help(quadsumC)     # A loop-based Rcpp implementation for computing x'Ay
help(quadsumB)     # A blockwise loop implementation for computing x'Ay using Rcpp


#--- Check Functionality -------------------------------------------------------------------------------#

quadsumR(rep(1,100),rep(1,100),matrix(1,100,100))          # [1] 10000
quadsumS(rep(1,100),rep(1,100),matrix(1,100,100))          # [1] 10000
quadsumT(rep(1,100),rep(1,100),matrix(1,100,100))          # [1] 10000
quadsumC(rep(1,100),rep(1,100),matrix(1,100,100))          # [1] 10000
quadsumB(rep(1,100),rep(1,100),matrix(1,100,100), 100)     # [1] 10000


#=== END OF 815_00_TEST.R ==============================================================================#
