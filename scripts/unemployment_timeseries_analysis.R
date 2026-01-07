############################################################
# U.S. Unemployment Rate: Time Series Analysis (1948–2024)
# Author: Lydia Durunguma
# Description: Loads FRED unemployment data, converts to 
#              time series, generates key diagnostics 
#              (trend, ACF, seasonality), and prepares 
#              data for forecasting models.
############################################################

# Clear the working space
rm(list = ls())

# Set working directory

setwd("/Users/lydiaolukade/Documents/unemployment-forecasting-time-series")

# -----------------------------
# 1. Load Libraries
# -----------------------------

install.packages("fpp")
install.packages("fpp2")
install.packages("fpp3")
install.packages("tsibble")
library(fpp)
library(fpp2)
library(fpp3)
library(tsibble)
install.packages("dplyr")
library(dplyr)
library(tidyverse)

# turn off scientific notation except for big numbers
options(scipen = 9)

# -----------------------------
# 2. Load Data
# -----------------------------
unrate = read.csv("data/UNRATE.csv", header = TRUE, sep = ",")
View(unrate)

# -----------------------------
# 3. Convert to Time Series
# -----------------------------
unrate_ts <- ts(unrate$UNRATE,
                start = c(1948, 1), 
                frequency = 12)

# -----------------------------
# 4. Plot: Time Series
# -----------------------------
library(ggplot2)
library(forecast)

autoplot(unrate_ts) +
  ggtitle("Unemployment Rate Over Time") +
  ylab("Unemployment Rate") +
  xlab("Year")

ggsave("figs/unemployment_autoplot.png", width = 8, height = 4)

# -----------------------------
# 5. Plot: Autocorrelation (ACF)
# -----------------------------
ggAcf(unrate_ts) +
  ggtitle("Autocorrelation of Unemployment Rate")

ggsave("figs/unemployment_acf.png", width = 8, height = 4)

# -----------------------------
# 6. Plot: Seasonality
# -----------------------------
ggseasonplot(unrate_ts) +
  ggtitle("Seasonal Plot of Unemployment Rate Over Time") +
  ylab("Unemployment Rate") +
  xlab("Year")

ggsave("figs/unemployment_seasonal.png", width = 8, height = 4)

# -----------------------------
# 7. Interpretation Notes
# -----------------------------
# - Strong cyclical patterns observed around recessions.
# - High persistence (slow-decaying ACF).
# - No meaningful seasonality.
# - Suitable foundation for ARIMA or structural models.

