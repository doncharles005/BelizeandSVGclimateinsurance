This is the code to run the wavelet coherence for the climate insurance for Belize and SVG.


The file Belizetransformation.m transforms the rainfall and SITC0 exports for Belize. This file must be run before running the coherence model. Note, the data is in this file.
The file SVGtransformation.m transforms the rainfall and SITC0 exports for SVG. This file must be run before running the coherence model. Note, the data is in this file.

The file Belizecoherence.m runs the wavelet coherence model to get the graph for Belize. This must be run after running the Belizetransformation.m file. 
The file SVGcoherence.m runs the wavelet coherence model to get the graph for SVG. This must be run after running the SVGtransformation.m file. 

The file Belizecomparison.m compares the original data to the transformed data for Belize. It generates 3 graphs. Note, the data is in this file.
The file SVGcomparison.m compares the original data to the transformed data for SVG. It generates 3 graphs. Note, the data is in this file.


The file Belizefloodpayout.m computes the excess rain policy payout for Belize.
The file SVGfloodpayout.m computes the excess rain policy payout for SVG.

The file Belizedroughtpayout.m computes the deficit rain policy payout for Belize.
The file SVGdroughtpayout.m computes the deficit rain policy payout for SVG.


This code was run in Matlab 2021a.

