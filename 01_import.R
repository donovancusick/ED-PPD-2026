# ======================================================
# Project: ED-PPD-2026
# Script:  01_import.R
# Purpose: Import raw data and save interim datasets
# Author:  Donovan Cusick
# Date:    2026-01-28
# ======================================================

# ---- setup ----
rm(list = ls())
options(stringsAsFactors = FALSE)

# ---- packages ----
library(readr)
library(readxl)
library(dplyr)
library(janitor)

# ---- paths ----
dir.create("data/raw", showWarnings = FALSE, recursive = TRUE)
dir.create("data/interim", showWarnings = FALSE, recursive = TRUE)