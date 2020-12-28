# 
# ------------- Chapter 3: Getting Started with R --------------
 c(43, 42, 12, 8, 5)

 myFamilyAges <- c(43, 42, 12, 8, 5)
 sum(myFamilyAges)
 myRange <- range(myFamilyAges)
 
# ---------------- Chapter 5: Rows and Columns -----------------
 myFamilyNames <- c("Dad","Mom","Sis","Bro","Dog")
 myFamilyNames
 
 myFamilyAges <- c(43, 42, 12, 8, 5)
 myFamilyAges

 myFamilyAges[2]
 
 myFamilyGenders <- c("Male","Female","Female","Male","Female")
 myFamilyWeights <- c(188,136,83,61,44)
 
 myFamily <- data.frame(myFamilyNames, myFamilyAges, myFamilyGenders, myFamilyWeights)
 myFamily

 str(myFamily)

 summary(myFamily)

 myFamily$myFamilyAges

 myFamilyAges <- c(myFamilyAges, 11)
 myFamilyAges

head(myFamilyAges, 2)
tail(myFamilyAges, 2)

myFamily$myFamilyAges

# ------------------ Chapter 6: Data Munging ------------------
 urlToRead <- "http://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/nst-est2011-01.csv"
 testFrame <- read.csv(url(urlToRead))
 str(testFrame)
 
 # clean the dataset
 testFrame <-testFrame[-1:-8,]
 
 summary(testFrame[,6:10]) 
 
 testFrame <-testFrame[,1:5]

 tail(testFrame,5)
 testFrame <-testFrame[-52:-58,]

 #define a new column
 testFrame$stateName <- testFrame[,1]

 #rename a column 
 colnames(testFrame)
 cnames <- colnames(testFrame)
 cnames[1] <- "newName"
 cnames
 colnames(testFrame) <- cnames
 colnames(testFrame)

 #remove a column
 testFrame <- testFrame[,-1]

 # remove dots and commas
 testFrame$stateName <- gsub("\\.","", testFrame$stateName)
 testFrame$april10census <-gsub(",", "", testFrame$X)
 testFrame$april10base <-gsub(",", "", testFrame$X.1)
 testFrame$july10pop <-gsub(",", "", testFrame$X.2)
 testFrame$july11pop <-gsub(",", "", testFrame$X.3)

 # remove spaces and convert to numeric type
 testFrame$april10census <-as.numeric(gsub(" ", "", testFrame$april10census))
 testFrame$april10base <-as.numeric(gsub(" ", "", testFrame$april10base))
 testFrame$july10pop <-as.numeric(gsub(" ", "", testFrame$july10pop))
 testFrame$july11pop <-as.numeric(gsub(" ", "", testFrame$july11pop))
 
 testFrame <- testFrame[,-1:-4]
 
 str(testFrame)
 head(testFrame, 5)
 
 rownames(testFrame) <- NULL
 head(testFrame,5)
 
 sortedStates <-testFrame[order(testFrame$july11pop),]
 head(sortedStates,5)
 
 sortedStates <- testFrame[order(-testFrame$july11pop), ]
 head(sortedStates,5)
 

# -------------- Chapter 7: Onward with R-Studio --------------
 tinyData <- c(1,2,1,2,3,3,3,4,5,4,5)
 mean(tinyData)
 
 tinyData <- c(1,2,1,2,3,3,3,4,5,4,5)
 min(tinyData)
 mean(tinyData)
 sum(tinyData)
 
 biggerData <- tinyData + 5

 df <- data.frame(tinyData, biggerData)
 colnames(df) <- c("small", "big")




# -------------- Chapter 8: What’s My Function? --------------
 MyMode <- function(myVector)
 {
   return(myVector)
 }
 tinyData <- c(1,2,1,2,3,3,3,4,5,4,5)
 tinyData
 MyMode(tinyData)
 
 # add new command into function
 MyMode <- function(myVector)
 {
   uniqueValues <- unique(myVector)
   return(uniqueValues)
 }
 MyMode(tinyData)
 
 # add new command into function
 MyMode <- function(myVector)
 {
   uniqueValues <- unique(myVector)
   uniqueCounts <- tabulate(myVector)
   return(uniqueCounts)
 }
 MyMode(tinyData)
 
 uniqueValues <- unique(tinyData)
 uniqueCounts <- tabulate(tinyData)
 uniqueValues[which.max(uniqueCounts)]
 
 MyMode <- function(myVector)
 {
   uniqueValues <- unique(myVector)
   uniqueCounts <- tabulate(myVector)
   return(uniqueValues[which.max(uniqueCounts)])
 }
 tinyData
 MyMode(tinyData)
 
 # add new elements to test the function
 tinyData <- c(tinyData,5,5,5)
 tinyData
 MyMode(tinyData)
 
 tinyData <- c(tinyData, 1, 1, 1)
 tinyData
 MyMode(tinyData)
 
 tinyData <- c(tinyData,9,9,9,9,9,9,9)
 MyMode(tinyData)
 tabulate(tinyData)
 
 unique(tinyData)
 
 # adjust the function
 MyMode <- function(myVector)
 {
   uniqueValues <- unique(myVector)
   uniqueCounts <- tabulate(match(myVector, uniqueValues))
   return(uniqueValues[which.max(uniqueCounts)])
 }
 MyMode(tinyData)
 
 install.packages("modeest")
 library(modeest)
 mfv(tinyData)
 
 # check the detail of the mfv function
 mfv
 
 multiData <- c(1,5,7,7,9,9,10)
 mfv(multiData)
 MyMode(multiData)
 
 
 
# ------------- Chapter 9: Beer, Farms, and Peas -------------
 var(myFamily$myFamilyAges)
 sd(myFamily$myFamilyAges)
 
 var(c(43,42,12,8,5))
 sd(c(43,42,12,8,5))
 
 #read in the census data set
 readCensus <- function() {
   urlToRead <-"http://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/nst-est2011-01.csv"
   
   #read the data from the web
   testFrame <- read.csv(url(urlToRead))
   
   #remove the first 8 rows (‘header information’)
   testFrame<-testFrame[-1:-8,]
   
   #only keep the first 5 columns
   testFrame<-testFrame[,1:5]
   
   #rename the first column
   testFrame$stateName <- testFrame[,1]
   testFrame<-testFrame[,-1]
   
   #remove the last rows (tail info)
   testFrame<-testFrame[-52:-58,]
   
   #remove the ‘dot’ from the state name
   testFrame$stateName <- gsub("\\.","", testFrame$stateName)
   
   #convert the columns to actual numbers and rename columns
   testFrame$april10census <-Numberize(testFrame$X)
   testFrame$april10base <-Numberize(testFrame$X.1)
   testFrame$july10pop <-Numberize(testFrame$X.2)
   testFrame$july11pop <-Numberize(testFrame$X.3)
   testFrame <- testFrame[,-1:-4]
   
   #remove the old rownames, which are now confusing
   rownames(testFrame) <- NULL
   
   return(testFrame)
 }
 
 Numberize <- function(inputVector)
 {
   # Get rid of commas
   inputVector<-gsub(",","", inputVector)
   # Get rid of spaces
   inputVector<-gsub(" ","", inputVector)
   
   return(as.numeric(inputVector))
 }
 
 USstatePops <- readCensus()
 USstatePops$april10census[1:3]
 
 mean(USstatePops$april10census)
 median(USstatePops$april10census)
 mode(USstatePops$april10census)
 var(USstatePops$april10census)
 sd(USstatePops$april10census)
 
 
 
 hist(USstatePops$april10census)
 hist(USstatePops$april10census, breaks=20)
 hist(rnorm(51, 6043834, 6823984))
 
 hist(rnorm(51, 6043834, 6823984), main="Example of a Normal Distribution", 
      xlab="Distribution with a Mean of 6,043,834 and standard deviation of 6,823,984")
 
 
# --------------- Chapter 10: Sample in a Jar ----------------
 sample(USstatePops$april10census, size=8, replace=TRUE)
 mean(sample(USstatePops$april10census,size=8, replace=TRUE))
 
 replicate(4, mean(sample(USstatePops$april10census, size=8, replace=TRUE)),simplify=TRUE)
 
 mean(replicate(400,mean(sample(USstatePops$april10census,size=8,replace=TRUE)), simplify=TRUE))
 mean(replicate(4000,  mean(sample(USstatePops$april10census,size=8,replace=TRUE)), simplify=TRUE))
 
  
 hist(replicate(4000, mean(sample(USstatePops$april10census,size=8,replace=TRUE)), simplify=TRUE))
 mean(replicate(100, mean(sample(USstatePops$april10census,size=51,replace=TRUE)), simplify=TRUE))
 mean(replicate(100, mean(sample(USstatePops$april10census,size=120,replace=TRUE)), simplify=TRUE))
 
 SampleMeans <- replicate(10000, mean(sample(USstatePops$april10census,size=5, replace=TRUE)), simplify=TRUE)
 length(SampleMeans)
 mean(SampleMeans)
 summary(SampleMeans)
 quantile(SampleMeans, probs=c(0.25,0.50,0.75))
 quantile(SampleMeans, probs=c(0.025,0.975))
 
 MysterySample <- c(3706690, 159358, 106405, 55519, 53883)
 mean(MysterySample)
 
 quantile(SampleMeans, probs=c(0.005,0.995))
 sd(SampleMeans)
 sd(USstatePops$april10census)/sqrt(5)
 
 StdError <- sd(USstatePops$april10census)/sqrt(5)
 CutPoint975 <- mean(USstatePops$april10census) + (2 * StdError)
 CutPoint975
 
# ----------------- Chapter 11: Storage War ------------------
 # install.packages("gdata")
 library("gdata")
 
 testFrame<-read.xls("http://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/nst-est2011-01.xls")
 str(testFrame)
 
 testFrame <- testFrame[-1:-8,]
 testFrame <- testFrame[,1:5]
 testFrame <- testFrame[-52:-62,]
 
 testFrame$stateName <- testFrame[,1]
 testFrame <- testFrame[,-1]
 
 library(stringr)
 testFrame$stateName <- str_replace(testFrame$stateName,"\\.","")
 
 Numberize <- function(inputVector)
 {
   inputVector<-gsub(",","", inputVector)
   inputVector<-gsub(" ","", inputVector)
   
   return(as.numeric(inputVector))
 }
 
 testFrame$april10census <- Numberize(testFrame$X)
 testFrame$april10base <- Numberize(testFrame$X.1)
 testFrame$july10pop <- Numberize(testFrame$X.2)
 testFrame$july11pop <- Numberize(testFrame$X.3)
 testFrame <- testFrame[,-1:-4]

 
 sqldf("select avg(april10base) From testFrame")
 mean(testFrame$april10base)
 
 sqldf("select stateName From testFrame Where july11pop<1000000")
 testFrame[testFrame$july11pop<1000000,which(colnames(testFrame) == "stateName")]
 
 #remove washington dc, because it is not an actual state
 testFrame <- testFrame[testFrame$stateName != "District of Columbia", ]
 testFrame$region <- state.region
 
 sqldf("select AVG(july11pop) From testFrame Group by region")
  
 tapply(testFrame$april10base, testFrame$region, mean)
 
 #more with tapply
 regionMean <- tapply(testFrame$april10base, testFrame$region, mean)
 regionMean
 
 regionNames <- names(regionMean)
 regionNames
       
 
 which(regionNames[1] == testFrame$region)

 which(regionNames[regionNames=="Northeast"] == testFrame$region)
 
 testFrame$regionMean <- 0
 
 testFrame$regionMean[which(regionNames[1] == testFrame$region)] <- regionMean[1]
 testFrame$regionMean[which(regionNames[2] == testFrame$region)] <- regionMean[2]
 testFrame$regionMean[which(regionNames[3] == testFrame$region)] <- regionMean[3]
 testFrame$regionMean[which(regionNames[4] == testFrame$region)] <- regionMean[4]
 
 
 for (x in 1:4) {testFrame$regionMean[which(regionNames[x] == testFrame$region)] <- regionMean[x] }
 
 for (x in 1:4) {
   indexes <-  which(regionNames[x] == testFrame$region)
   testFrame$regionMean[indexes] <- regionMean[x] 
   }
 
 
 a <- c(10:19)
 b <- c(20:29)
 c <- a + b
 c
 
 for(x in 1:10) {
   d[x] <- a[x] + b[x]
 }
 d
 
 
 #average difference, but need to take absolute value
 testFrame$diffFromRegionMean <- abs(testFrame$regionMean - testFrame$april10base)
 tapply(testFrame$diffFromRegionMean, testFrame$region, mean)
 
 sortedFrame <- testFrame[order(testFrame$diffFromRegionMean),]
 head(sortedFrame)
 
 # Accessing JSON data
 library(RCurl)
 library(RJSONIO)

 bikeURL <- "https://feeds.citibikenyc.com/stations/stations.json"
 apiResult <- getURL(bikeURL)
 results <- fromJSON(apiResult)
 length(results)
 
 when <- results[[1]]
 when
 stations <- results[[2]]
 length(stations)
 str(stations[[1]])
 
 numRows <- length(stations)
 nameList <- names(stations[[1]])
 
 dfStations <- data.frame(matrix(unlist(stations), nrow=numRows, byrow=T), stringsAsFactors=FALSE)
 names(dfStations) <- nameList
 str(dfStations)

 dfStations$availableDocks <- as.numeric(dfStations$availableDocks)
 dfStations$availableBikes <- as.numeric(dfStations$availableBikes)
 dfStations$totalDocks <- as.numeric(dfStations$totalDocks)
 
 mean(dfStations$availableDocks)
 mean(dfStations$availableBikes)
 bikesAvailDF <- dfStations[dfStations$availableBikes>0,]
 nrow(bikesAvailDF)
 
 MakeGeoURL <- function(address) 
 {
   root <- "http://maps.google.com/maps/api/geocode/" 
   url <- paste(root, "json?address=",  address, 
                "&sensor=false", sep = "")
   return(URLencode(url))
 }
 
 MakeGeoURL("1600 Pennsylvania Avenue, Washington, DC")
 
 Addr2latlng <- function(address) 
 {
   url <- MakeGeoURL(address)
   apiResult <- getURL(url)
   geoStruct <- fromJSON(apiResult, simplify = FALSE)
   lat <- NA
   lng <- NA  
   try(lat <- 
         geoStruct$results[[1]]$geometry$location$lat)
   try(lng <- 
         geoStruct$results[[1]]$geometry$location$lng)
   return(c(lat, lng))
 }
 
 testData <- Addr2latlng("1600 Pennsylvania Avenue, Washington, DC")
 str(testData)
 
 # install.packages("RMySQL")
 library(RMySQL)
 con <- dbConnect(dbDriver("MySQL"), dbname = "test")
 dbListTables(con)
 dbWriteTable(con, "census", testFrame, overwrite = TRUE)
 dbListTables(con)
 dbGetQuery(con, "SELECT stateName, july11pop FROM census WHERE july11pop<1000000")
 

# -------------- Chapter 12: Pictures vs Numbers ---------------
 dfStates <- readCensus()
 
 
 hist(dfStates$july11pop)
 barplot(dfStates$july11pop, names.arg = dfStates$stateName, las=2)
 
 EnsurePackage<-function(x) {
   x <- as.character(x)
   
   if (!require(x,character.only=TRUE)) {
     install.packages(pkgs=x,repos="http://cran.r-project.org")
     require(x,character.only=TRUE)
   }
 }
 EnsurePackage("ggplot2")
 
 g <- ggplot(dfStates, aes(x=july11pop)) 
 g <- g + geom_histogram(binwidth=5000000, color="black", fill="white")
 g <- g + ggtitle("states population histogram")
 g
 
 
 
 ggplot(dfStates,aes(x=factor(0),july11pop)) + geom_boxplot()
 
 dfStates$popChange <- dfStates$july11pop - dfStates$july10pop
 dfStates$increasePop <- ifelse(dfStates$popChange > 0, "positive", "negative")
 
 g <- ggplot(dfStates,aes(x=factor(increasePop), july11pop))
 g <- g +geom_boxplot() + coord_flip() 
 g <- g + ggtitle('Population grouped by positive or negative change')
 g
 
 
 
 g <- ggplot(dfStates,aes(x=reorder(stateName, july11pop), y=july11pop, group=1))  
 g <- g + geom_line()
 g <- g + theme(axis.text.x = element_text(angle = 90, hjust = 1))
 g
 
 g <- ggplot(dfStates,aes(x=reorder(stateName, july11pop), y=july11pop, group=1))  
 g <- g + geom_col()
 g <- g + theme(axis.text.x = element_text(angle = 90, hjust = 1))
 g
 
  
 dfStates$percentChange <- dfStates$popChange/dfStates$july10pop * 100
 g <- ggplot(dfStates,aes(x=reorder(stateName, july11pop), y=july11pop,fill=percentChange)) 
 g <- g + geom_col() 
 g <- g + theme(axis.text.x = element_text(angle = 90, hjust = 1))
 g
 
 g <- ggplot(dfStates, aes(x=popChange, y=percentChange))  
 g <- g + geom_point(aes(size=july11pop, color=july11pop))
 g
 
  
 g  + geom_text(aes(label=stateName), size=4)
 
 
 g + geom_text(aes(label=stateName),size=4, hjust=1, vjust=-1)
 
 
 minPerChange <- 1
 minPopChange <- 100000
 dfStates$keystate <- dfStates$popChange > minPopChange & dfStates$percentChange> minPerChange

 minLabel <- format(min(dfStates$july11pop), big.mark=",", trim=TRUE)
 maxLabel <- format(max(dfStates$july11pop), big.mark=",", trim=TRUE)
 medianLabel <- format(median(dfStates$july11pop), big.mark=",", trim=TRUE)
 
 g <- ggplot(dfStates, aes(x=popChange, y=percentChange))  
 g <- g + geom_point(aes(size=july11pop, color=july11pop, shape=keystate))
 g <- g + geom_text(data=dfStates[dfStates$popChange > minPopChange & dfStates$percentChange> minPerChange,], aes(label=stateName, hjust=1, vjust=-1))
 g + scale_color_continuous(name="Pop",                                    
                          breaks = with(dfStates, c(min(july11pop), median(july11pop), max(july11pop))), 
                          labels = c(minLabel, medianLabel, maxLabel),         
                          low = "white",                                    
                          high = "black")    
  
 
# ------------------ Chapter 13: Map Mash-Up -------------------
 us <- map_data("state")
 dummyDF <- data.frame(state.name, stringsAsFactors=FALSE)
 dummyDF$state <- tolower(dummyDF$state.name)
 
 map.simple <- ggplot(dummyDF, aes(map_id = state))  
 map.simple <- map.simple+  geom_map(map = us, fill="white", color="black") 
 map.simple <- map.simple + expand_limits(x = us$long, y = us$lat)
 map.simple <- map.simple + coord_map() +  ggtitle("basic map of continental USA")
 map.simple

 
  
 dfStates <- readCensus()
 # make sure everything is lowercase
 dfStates$state <- tolower(dfStates$stateName)
 
 map.popColor <- ggplot(dfStates, aes(map_id = state))  
 map.popColor <- map.popColor + geom_map(map = us, aes(fill=july11pop)) 
 map.popColor <- map.popColor + expand_limits(x = us$long, y = us$lat)
 map.popColor <- map.popColor+ coord_map() + ggtitle("state population")
 map.popColor
 
 map.simple + geom_point(aes(x = -100, y = 30))
 
 library(ggmap)
 latlon <- geocode("syracuse, ny")
 latlon
 map.popColor + geom_point(aes(x = latlon$lon, y = latlon$lat), color="darkred", size = 3)
 
  
 df.latlon <- data.frame(latlon)
 latlon <- geocode("colorado")
 df.latlon[2,] <- latlon
 df.latlon[3,] <- geocode("denver, colorado")
 map.simple + geom_point(data=df.latlon,aes(x = lon, y = lat))
  
 df.latlon$state <- "?"
 map.popColor + geom_point(data=df.latlon,aes(x = lon, y = lat),  alpha = .5, color="darkred", size = 3)
  

 urlFile <- "http://www.opendata500.com/us/download/us_companies.csv"
 od.companies <- read.csv(url(urlFile))
 str(od.companies)
 od.companies <- od.companies[od.companies$city != "",] 
 od.companies$state <- as.character(od.companies$state)
 od.companies <- od.companies[od.companies$state != "DC",]
 od.companies$state <- ifelse(od.companies$state == "KA", "KS", od.companies$state)
 
 od.companies$cityState <- paste(od.companies$city, od.companies$state)
 od.companies$geoCode <- geocode(od.companies$cityState)
 
 map.simple + geom_point(data=od.companies,aes(x = geoCode$lon, y = geoCode$lat), shape=1)
 
 bad <- od.companies[od.companies$geoCode$lon > 0, ]
 bad$cityState
 
 od.companies <- od.companies[od.companies$geoCode$lon < 0, ]
 map.simple + geom_point(data=od.companies, aes(x = geoCode$lon, y = geoCode$lat), shape=1)
 
 
 library(RColorBrewer)
 od.companies$sizes <- factor(od.companies$full_time_employees,levels = 
                                     c("1-10", "11-50", "51-200", "201-500", "501-1,000", 
                                       "1,001-5,000", "5,001-10,000", "10,001+"))
 numSizes <- length(levels(od.companies$sizes))
 myColors <- brewer.pal(numSizes,"Reds")
 names(myColors) <- levels(od.companies$sizes)
 myColors[1:3]
 
 map.popColor + 
   geom_point(data=od.companies, aes(x = geoCode$lon, y = geoCode$lat, color=sizes)) + 
   scale_colour_manual(name =  "sizeOfCompany", values = myColors) +
   ggtitle("Open Data Company Analysis")
 
 
# ----------- Chapter 14:  Chapter 14: Word Perfect -----------
 
 library(XML)
 library(tm)
 
 #read the speech - the actual file location will need to be updated
 sbaFile <- "/Users/jsaltz/Google Drive/Courses/IST 687/2U/Week 8 - Text Mining/data/sba-speech.txt"

 #use scan
 sba <- scan(sbaFile, character(0),sep = "\n")
 sba <- scan(sbaFile, character(0))
 head(sba, 3)
 
 #use readLines
 sba <- readLines(sbaFile)
 head(sba, 3)
 
 #Use a web file: Note the web location for the speech
 sbaLocation <- URLencode("http://www.historyplace.com/speeches/anthony.htm")
 
 # Read and parse HTML file
 doc.html = htmlTreeParse(sbaLocation, useInternal = TRUE)
 
 # Extract all the paragraphs (HTML tag is p, starting at
 # the root of the document). Unlist flattens the list to
 # create a character vector.
 sba = unlist(xpathApply(doc.html, '//p', xmlValue))
 head(sba, 3)
 
 words.vec <- VectorSource(sba)
 words.corpus <- Corpus(words.vec)
 words.corpus
 words.corpus <- tm_map(words.corpus, content_transformer(tolower))
 words.corpus <- tm_map(words.corpus, removePunctuation)
 words.corpus <- tm_map(words.corpus, removeNumbers)
 words.corpus <- tm_map(words.corpus, removeWords, stopwords("english"))
 tdm <- TermDocumentMatrix(words.corpus)
 tdm
 
 m <- as.matrix(tdm)
 wordCounts <- rowSums(m)
 wordCounts <- sort(wordCounts, decreasing=TRUE)
 head(wordCounts)
 
 library(wordcloud)
 cloudFrame <- data.frame(word = names(wordCounts), freq=wordCounts)
 
 wordcloud(cloudFrame$word, cloudFrame$freq)
 
 wordcloud(names(wordCounts), wordCounts, min.freq=2, max.words=50, rot.per=0.35, 
           colors=brewer.pal(8, "Dark2"))
 
 
# ------------------ Chapter 15: Happy Words? ------------------
 pos <- "positive-words.txt"
 neg <- "negative-words.txt"
 p <- scan(pos, character(0),sep = "\n")
 n <- scan(neg, character(0),sep = "\n")
 head(p, 10)
 p <- p[-1:-34]
 n <- n[-1:-34]
 head(p, 10)
 head(n,10)
 
 totalWords <- sum(wordCounts)
 words <- names(wordCounts)
 matched <- match(words, p, nomatch = 0) 
 head(matched,10)
 matched[9]
 p[1083]
 words[9]
 
 mCounts <- wordCounts[which(matched != 0)]
 length(mCounts)
 mWords <- names(mCounts)
 nPos <- sum(mCounts)
 nPos
 
 matched <- match(words, n, nomatch = 0)
 nCounts <- wordCounts[which(matched != 0)]
 nNeg <- sum(nCounts)
 nWords <- names(nCounts)
 nNeg
 length(nCounts)
 
 totalWords <- length(words)
 ratioPos <- nPos/totalWords
 ratioPos
 ratioNeg <- nNeg/totalWords
 ratioNeg
 
 
# -------------- Chapter 16:  Lining Up Our Models -------------
 #type <- c("truck","truck","van","van","van","van","car","truck","van","van","van","car","truck","car")
 oilChanges <- c(3,5,2,3,1,4,6,4,3,2,0,10,7,8)
 repairs <- c(300, 300, 500, 400, 700, 420, 100, 290, 475, 620, 600, 0, 200, 50)
 miles <- c(20100, 23200, 19200, 22100, 18400, 23400, 17900, 19900, 20100, 24100, 18200, 19600, 20800, 19700)
 oil <- data.frame(oilChanges, repairs, miles)
 View(oil)
 
 plot(oil$oilChanges, oil$repairs)
 
 plot(oil$miles, oil$repairs)
  
 model1 <- lm(formula=repairs ~ oilChanges, data=oil)
 summary(model1)
 
 plot(oil$oilChanges, oil$repairs)
 abline(model1)
 
 m <- lm(formula=repairs ~ oilChanges + miles, data=oil)
 summary(m)
 
 
 oil$oilChangeCost <- oil$oilChanges * 350
 oil$totalCost <- oil$oilChangeCost + oil$repairs
 m <- lm(formula=totalCost ~ oilChanges, data=oil)
 
 
 plot(oil$oilChanges, oil$totalCost)
 abline(m)
 
 test = data.frame(oilChanges=0)
 predict(m,test, type="response")
 test = data.frame(oilChanges=5)
 predict(m,test, type="response")
 test = data.frame(oilChanges=10)
 predict(m,test, type="response")
 
 library(ggplot2)
 
 ggplot(oil, aes(x = oilChanges, y = totalCost)) +
   geom_point() +
   stat_smooth(method = "lm", col = "red")
 
 
# -------- Chapter 17: Hi Ho, Hi Ho - Data Mining We Go --------
 install.packages("arules")
 library("arules")
 
 data(Groceries)
 summary(Groceries)
 
 itemFrequencyPlot(Groceries,support=0.1)
 itemFrequencyPlot(Groceries,support=0.05,cex.names=0.5)
 
 data(AdultUCI)
 str(AdultUCI)
 AdultUCI.t <- AdultUCI
 AdultUCI.t$age <- as.factor(AdultUCI.t$age)
 AdultUCI.t$fnlwgt <- as.factor(AdultUCI.t$fnlwgt)
 AdultUCI.t$'education-num' <- as.factor(AdultUCI.t$'education-num')
 AdultUCI.t$'capital-gain' <- as.factor(AdultUCI.t$'capital-gain')
 AdultUCI.t$'capital-loss' <- as.factor(AdultUCI.t$'capital-loss')
 AdultUCI.t$'hours-per-week' <- as.factor(AdultUCI.t$'hours-per-week')

 AdultUCI.trans <- as(AdultUCI.t, "transactions")
  
 itemFrequencyPlot(AdultUCI.trans,support=0.2, cex.names=1.1)
 
 apriori(Groceries,parameter=list(support=0.005, confidence=0.5))
 
 ruleset <- apriori(Groceries,parameter=list(support=0.01,confidence=0.5))
 summary(ruleset)
 inspect(ruleset)
 
 install.packages("arulesViz")
 library(arulesViz)
 
 ruleset <- apriori(Groceries, parameter=list(support=0.005,confidence=0.35))
 plot(ruleset)
 
 goodrules <- ruleset[quality(ruleset)$lift > 3.5]
 inspect(goodrules)
 
 
# -------- Chapter 18: What’s Your Vector, Victor? --------
 # install.packages("kernlab")
 library(kernlab)
 
 data(spam)
 str(spam)
 dim(spam)
 table(spam$type)
 
 randIndex <- sample(1:dim(spam)[1])
 summary(randIndex)
 length(randIndex)
 head(randIndex)
 
 cutPoint2_3 <- floor(2 * dim(spam)[1]/3)
 cutPoint2_3
 
 trainData <- spam[randIndex[1:cutPoint2_3],]
 testData <- spam[randIndex[(cutPoint2_3+1):dim(spam)[1]],]
 
 svmOutput <- ksvm(type ~ ., data=trainData, kernel="rbfdot", kpar="automatic",C=5,cross=3, prob.model=TRUE)
 svmOutput
 
 hist(alpha(svmOutput)[[1]])
 
 svmOutput <- ksvm(type ~ ., data=trainData, kernel = "rbfdot", kpar="automatic",C=50,cross=3,prob.model=TRUE)
 svmOutput
 hist(alpha(svmOutput)[[1]], main="Support Vector Histogram with C=50", xlab="Support Vector Values")
 
 alphaindex(svmOutput)[[1]][alpha(svmOutput)[[1]] < 0.05]
 
 trainData[90,]
 alphaindex(svmOutput)[[1]][alpha(svmOutput)[[1]]==50]
 trainData[11,]
 
 svmPred <- predict(svmOutput, testData, type = "votes")
 compTable <- data.frame(testData[,58],svmPred[1,])
 table(compTable)
 


 
 spam1 <- spam
 spam1$type <- NULL
 test = kmeans(spam1,4)
 spam1$clusterId <- test$cluster
 spam1$type <- as.integer(spam$type=="spam")
 spam1$type <- spam$type
 table(spam1$type, spam1$clusterId)
 
 # -------------- Chapter 19: Big Data? Big Deal! --------------
 small.ints <- 1:10
 small.ints
 out <- lapply(small.ints, function(x) x^2)
 out
 
 small.ints <- to.dfs(1:10)
 out <- mapreduce(input = small.ints,  map = function(k,v) keyval(v, v^2))
 val <- mapreduce(input = "iris/car2.csv", input.format = make.input.format("csv", sep = ","), map = 
                  cyl.map, reduce = cyl.reduce)
 from.dfs(val)
                  
 cyl.map = function (k, v){
   # Check first row, if having header name as "model", delete it
   if (v[1,1] == "model") {
     v <- v[-1,]
   }
   k <- v[[3]]     # Take variable V3 as key
   V5 <- v[[5]]	   # alternative: k <- v$V3    
   (Take variable V3 as value)
   V5 <- as.integer(V5) # Convert value variable 
   into integer
   keyval(k, V5)
 }
 
 cyl.reduce = function (k, v) {
   keyval(k, mean(v))
 }
 