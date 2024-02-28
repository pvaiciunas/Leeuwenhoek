# Leeuwenhoek

Repository to organize equity valuation framework.

Framework outline
As of 2024-02-27

Data Retrieval Functions
- Write a file of functions to retrieve fundamental data. Currently sourced from EODHD. This might change in the future, so this script of functions is specific to now.
- Will also have a script of functions that retrieves external data. This might be industry averages, bond and default data, or economic data. 

Valuation Functions
- A script of functions that implements damodaran processes. Master function that does simple valution, and helper functions that normalize things. Also company specific ones for the mag 7 he has public.

Analysis Functions
- A suite of functions that takes in the valuation output and inputs, and summarizes. Graphics, tables, etc. Maybe even a shiny app?

Implementation Functions / Scripts
- Apply the valuation data to some universe. Will want output to compare valaution metrics to industry averages. Will want to compare output to current prices. And will want logic that implements correct applciations of things like normalization of earnings or negative growth etc.

Bayesian overlay
- Is it possible to create range of valaution givne priors on input distributions. similar concept to uvalue app.