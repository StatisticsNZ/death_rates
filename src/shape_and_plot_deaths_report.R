## Shape and plot data

deaths_obs <- 
  death_obs_raw %>% 
  pivot_longer(cols = `00-04`:`95+`, names_to = "age_group", values_to = "counts") %>% 
  mutate(age_group = case_when(
    age_group >= "90-94" ~ "90+",
    TRUE ~ age_group
  )) %>% 
  rename(week_start = `Week beginning`) %>% 
  mutate(week_end = week_start + days(7),
         week_num = week(week_end),
         month = month(week_end),
         year = year(week_end),
         qtr = quarter(week_end),
         year_quarter = str_c(year, qtr, sep = "Q")) %>% 
  count(year, year_quarter, month, week_num, age_group, wt = counts, name = "deaths")

pop_ests <-
  pop_ests_ts %>% 
  mutate(age_group = case_when(
    age_group == "0-4 Years" ~ "00-04 Years",
    age_group == "5-9 Years" ~ "05-09 Years",
    age_group == "90 Years and Over" ~ "90+",
    TRUE ~ age_group
  )) %>% 
  mutate(
    age_groups_high = case_when(
      age_group == "00-04 Years" ~ "00-04",
      age_group < "30-34 Years" & age_group > "00-04" ~ "05-29",
      age_group >= "30-34 Years" & age_group < "60-64 Years" ~ "30-59",
      TRUE ~ age_group),
    age_groups_high = substring(age_groups_high,1,5)) %>% 
  count(year_quarter, age_group = age_groups_high, wt = counts, name = "pop")

crude_rates <-
  deaths_obs %>% 
  filter(year > 2011) %>% 
  count(year, year_quarter, week_num, age_group, wt = deaths, name = "deaths") %>% 
  left_join(pop_ests_qtr, by = c("year_quarter", "age_group")) %>% 
  mutate(covid_ind = ifelse(year < 2020, "Pre-COVID", sprintf("Y %s",year))) %>% 
  mutate(rate = 100000*(deaths/pop))

crude_rate_mean <-
  crude_rates_qtr %>%
  filter(week_num < 53) %>% 
  group_by(age_group, week_num, covid_ind) %>%
  summarise(average_rate = mean(rate),
            uncert = sd(rate)) %>% ## The rates for a given week in 2020 - 2022 are single observations, therefore the mean rate is simply *the* rate
  ungroup() 

# Save relevant data frames for report to access --------------------------

save(as_at_date, deaths_obs, pop_ests, crude_rates, file = "report_data.RData")



