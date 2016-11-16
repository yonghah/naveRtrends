ntrends <- function(topics, start_yyyymmdd, end_yyyymmdd) {

  # create queryText by concatenating keywords
  word_linked <- lapply(topics, function(topic) { paste(topic, topic, sep="__SZLIG__")})
  queryText <- do.call(paste, c(word_linked, sep="__OUML__"))

  url <- "http://datalab.naver.com/ca/step1/process.naver"
  pl <- list(qcType="N",
             queryGroups=queryText,
             startDate=start_yyyymmdd,
             endDate=end_yyyymmdd);
  r <- httr::POST(url, body = pl)
  res <- httr::content(r)

  # bind results from each topic
  df <- do.call(rbind, lapply(res$result, processSeries))
  return(df)
}

processSeries <- function(sdata) {
  # a function creates time series for a topic
  title <- sdata$title
  tdf <- do.call(rbind,
                 lapply(sdata$data,
                        data.frame,
                        stringsAsFactors=FALSE))
  tdf <- dplyr::mutate(tdf,
                       topic=title,
                       period=as.Date(period, "%Y%m%d"),
                       value=as.numeric(value))
  return(tdf)
}

