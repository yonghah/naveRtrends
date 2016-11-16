# naveRtrends
R package for Naver trends

# Install
devtools::install_github("yonghah/naveRtrends")

## Prerequisites
httr
dplyr

# Usage
```
> library(naveRtrends)
> df <- ntrends(c("seoul", "tokyo"), "20150101", "20161116")
```

|      |period |value |topic|
|------|----------|---|-----|
|1 |2015-01-05    |79 |seoul|
|2 |2015-01-12    |74 |seoul|
|3 |2015-01-19    |72 |seoul|
|4 |2015-01-26    |73 |seoul|
|5 |2015-02-02    |68 |seoul|
|6 |2015-02-09    |72 |seoul|

