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

# ---- fail fast ----
files <- c(
  "data/raw/ahead-session-2-program-performance-data-debt-earnings-and-earnings-test-metrics-112908.xlsx",
  "data/raw/ahead-session-2-program-performance-data-institution-characteristics-and-completions-112906.xlsx",
  "data/raw/ahead-session-2-program-performance-data-enrollments-112909.xlsx",
  "data/raw/ahead-session-2-program-performance-data-financial-aid-part-1-112907.xlsx",
  "data/raw/ahead-session-2-program-performance-data-financial-aid-part-2-112910.xlsx",
  "data/raw/ahead-session-2-program-performance-data-financial-aid-part-3-112911.xlsx"
)

stopifnot(all(file.exists(files)))

# ---- importing raw data ----
import_xlsx <- function(path) {
  readxl::read_excel(path) |>
    janitor::clean_names()
}

debtearntest_raw <- import_xlsx("data/raw/ahead-session-2-program-performance-data-debt-earnings-and-earnings-test-metrics-112908.xlsx")
characteristics_raw <- import_xlsx("data/raw/ahead-session-2-program-performance-data-institution-characteristics-and-completions-112906.xlsx")
enrollments_raw <- import_xlsx("data/raw/ahead-session-2-program-performance-data-enrollments-112909.xlsx")
finaid1_raw <- import_xlsx("data/raw/ahead-session-2-program-performance-data-financial-aid-part-1-112907.xlsx")
finaid2_raw <- import_xlsx("data/raw/ahead-session-2-program-performance-data-financial-aid-part-2-112910.xlsx")
finaid3_raw <- import_xlsx("data/raw/ahead-session-2-program-performance-data-financial-aid-part-3-112911.xlsx")

# ---- save as RDS ---- 
saveRDS(debtearntest_raw, "data/interim/debtearntest_raw.rds")
saveRDS(characteristics_raw, "data/interim/characteristics_raw.rds")
saveRDS(enrollments_raw, "data/interim/enrollments_raw.rds")
saveRDS(finaid1_raw, "data/interim/finaid1_raw.rds")
saveRDS(finaid2_raw, "data/interim/finaid2_raw.rds")
saveRDS(finaid3_raw, "data/interim/finaid3_raw.rds")