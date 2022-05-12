# Examining New Zealand's all cause mortality
This is an **experimental** measure of how New Zealand's deaths are tracking across the pandemic compared to expectations established through pre-COVID death rates. The methodology and code is yet to be peer-reviewed, and these are **not official statistics**.

The details of the methods employed are described in [Measuring deaths in New Zealand](measuring_deaths_in_NZ.pdf)

## Measures that are currently available

Currently we provide weekly observed death rates by age groups compared with the average rates (and can be thought of as the "typical death rates") for the same groups prior to the pandemic (2012 -- 2019). The range of typically observed death rates are provided by measuring the standard deviation across the period.

To do this we compare the observations to the expectations on a week by week basis. For example, week 1 of the year 2022 is compared to the "average" week 1 across the years 2012 -- 2019. This is done for all weeks of the year for the years 2020 and 2021. For 2022, we report the same measure as the deaths data becomes available. Typically this data has a two-week lag.

## Data used in this measure 

Not all the data used in this project is currently available via this repository. These will be made available in time, assuming approval is granted by the source agencies.

**Deaths data**

Weekly deaths data, by age groups going all the way back to 2011 is provided by the Department Of Internal Affairs (DIA), New Zealand. This data typically has a two week lag, and is usually supplied on Mondays (e.g., data received on Monday 25th of April would contain deaths up to Sunday 10th of April).

**Population data**

The population estimates used to calculate rates are from the published estimated resident population (ERP) data. We use the quarterly mean estimated population where available. (E.g., for week 1 of 2021, we would use the mean Q1 2021 estimate of population).

Where the latest quarter is not yet available we use the population as at the last available date. (E.g., for Q1 2022 we are using the year-end population estimates for 2021. Once Q1 2022 population esimates are released, these will be used).

***Explanation of person-time*** 
For more details refer to the technical note. As the population over the period of interest (in our case weeks) is not closed (people can be born, die or migrate), the population denominator is generally measured in terms of _person-time_ instead of person counts. _Person-time_ is the actual time a person is exposed to risk. For a given age group and a given time period, this is computed by summing how much time each person in the population lives in that period and age group. Because we are using mean populations, each "average person" in the population contributes 1 person week to the week. Hence, the unit of our denominator is person weeks lived (rather than a person count).

## Revisions and changes

The estimates and data are subject to revision without notice. While the ERP is a published figure, the deaths data is provisional, and revises regularly, particularly in the latest weeks, as more death information comes in to DIA. 

When more up-to-date population estimates are available these will be used, and again may be done so without notice.

In addition, given this is an experimental series methodology changes may be made without prior notification, although we will detail the changes both here, and the detailed technical paper linked above.

## Questions, feedback or assistance

For any questions, feedback or assistance with what is available here please contact [Pubudu Senanayake](mailto:pubudu.senanayake@stats.govt.nz)

__Copyright and Licensing__

The package is Crown copyright (c) 2021, Statistics New Zealand on behalf of the New Zealand Government, and is licensed under the MIT License (see LICENSE file).

<br /><a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This document is Crown copyright (c) 2021, Statistics New Zealand on behalf of the New Zealand Government, and is licensed under the Creative Commons Attribution 4.0 International License. To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/ or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.