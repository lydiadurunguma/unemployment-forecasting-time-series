U.S. Unemployment Rate: Time Series Analysis & Forecasting (1948–2024)

A Quantitative Economics Project | Time Series Modeling in R

Overview

This project performs a full exploratory time-series analysis of the U.S. unemployment rate using monthly data from 1948–2024 sourced from FRED (Federal Reserve Economic Data).

The goal is to examine long-run behavior, detect persistence and cyclical patterns, test for seasonality, and prepare the data for forecasting models such as ARIMA or structural time-series models.

This project demonstrates skills in:

Time-series preparation and diagnostics

Macro-economic interpretation

Autocorrelation & seasonality analysis

R programming and forecasting libraries

Data visualization for economic insights

1. Data Acquisition

The unemployment rate series (UNRATE) was downloaded directly from FRED and stored in /data.

R Code:
unrate <- read.csv("data/UNRATE.csv", header = TRUE)

2. Convert Data to Monthly Time-Series Format
unrate_ts <- ts(
  unrate$UNRATE,
  start = c(1948, 1),
  frequency = 12
)

3. Time-Series Plots
Unemployment Rate Over Time

Autocorrelation Function (ACF)

Seasonal Plot

4. Key Insights
A. Cyclical Patterns

The unemployment rate shows strong cyclical movement aligned with U.S. recessions:

Early 1980s recession

Dot-com bust (2001)

Great Recession (2008–2009)

COVID-19 shock (2020)

These spikes suggest the series contains business cycle–driven nonstationary behavior.

B. Autocorrelation Structure

High autocorrelation at early lags

Slow decay = evidence of persistence

Consistent with macro labor-market dynamics (slow recovery post-recession)

This implies strong AR components, making ARIMA modeling appropriate.

C. Seasonality

The seasonal plot and ACF reveal:

No strong seasonal pattern

Unemployment is shaped more by structural shocks than by month-to-month seasonality

This simplifies forecasting because seasonal differencing is likely unnecessary.

5. Next Steps (Forecast Modeling)

This exploratory analysis sets the stage for:

ARIMA / SARIMA modeling

Structural time-series models with cyclical component

Break-point analysis for COVID-19 shock

Forecast accuracy comparison (AIC, BIC, RMSE)

Full forecasting models will be added to this repository in future updates.

Technologies Used

R (forecast, ggplot2)

Time-series modeling

Exploratory data analysis (EDA)

Macroeconomic data interpretation

FRED economic datasets

Author

Lydia Durunguma
Economist & Quantitative Analyst
Interests: econometrics, forecasting, labor economics, quantitative research.