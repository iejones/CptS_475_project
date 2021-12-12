# CptS_475_project
CptS 475 (Data Science) at WSU Fall 2021 term project on visualization of COVID-19 sequence mutation over time.

## Required Packages
### Python Packages
* Pandas
* Plotly
* Jupyter
* kaleido
* bokeh
* panel
* matplotlib
* numpy

### R Packages
* Tidyverse
* Plotly

## File Structure
### data 
Has origonal data files, staged files during cleaning, and final files. The file that contains all 11 timespans with a timespan column is too large for github, but can be created by running the `src/data_preparation/Add_Clade.ipynb` (Uses the staged files). Also has the population data and a file for the dates of the timespans.
### src 
Has a folder for data preparation and a folder for the notebooks that created our visualizations. 
### visualizations
The produced visualizations, both static and interactive, are saved here.
