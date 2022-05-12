library(tidyr)
library(dplyr)
library(readr)
library(readxl)
library(lubridate)
library(stringr)


# Read in the latest DIA deaths data --------------------------------------
data_directory <- "data/deaths_data/"
files <- file.info(list.files(data_directory, pattern = "*.xlsx", full.names = T))
deaths_data_fn <- rownames(files)[which.max(files$mtime)]

death_obs_raw <- 
  read_xlsx(deaths_data_fn, sheet = 1, skip = 0)

# Read in the population estimates data and donate for 2022 - this will be updated to run a pull from TSM (Infoshare) in next ver.

pop_est_ts_raw <-
  read_xlsx("data/pop_estimates_ts_mean_qtr.xlsx", sheet = 1) %>% 
  pivot_longer(cols = `0-4 Years`:`90 Years and Over`, names_to = "age_group", values_to = "counts")

pop_ests_raw_2022 <-
  read_csv("data/dec_2021_pop_estimate.csv") %>%  ## December 2021 estimates for 2022, update as new estimates are released
  pivot_longer(cols = `0-4 Years`:`90 Years and Over`, names_to = "age_group", values_to = "counts") %>% 
  mutate(year = 2022)

pop_ests_ts <-
  bind_rows(pop_est_ts_raw, 
            pop_ests_raw_2022 %>% 
              rename(year_quarter = year) %>% 
              mutate(year_quarter = "2022Q1"),
            pop_ests_raw_2022 %>% 
              rename(year_quarter = year) %>% 
              mutate(year_quarter = "2022Q2"))
  

# Deaths data latest reporting date ---------------------------------------

as_at_date <- max(death_obs_raw$`Week beginning`) + days(6)

