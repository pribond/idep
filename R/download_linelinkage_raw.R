#' function that downloads ready made info from the database

download_linelinkage_raw <- function(con, saveToFile=F){
  '%.%' <- function(a,b) paste0(a,b)
  # getting data
  message("downloading data ... ")
  report_time( 
    ll_raw <- suppressWarnings(dbReadTable(con, "data_linelinkage"))
  )
  
  # getting version and last update date
  version    <- max(dbReadTable(con, "version")$versionnumber, na.rm=T)
  lastupdate <- suppressWarnings(dbGetQuery(con, "SELECT max(int_dupdate) FROM view_last_update"))
  
  ll_raw$db_version    <- as.numeric(version)
  ll_raw$db_lastupdate <- as.character(lastupdate)
  
  if ( saveToFile == T ) {
    # generating filenames for STATA and R 
    message("\nsaving data ...")
    r_name      <- paste0("raw_linelinkage_db_version_pre_correct_",version,".Rdata")
    stata_name  <- paste0("raw_linelinkage_db_version_pre_correct_",version,".dta")
    readme_name <- paste0("raw_linelinkage_db_version_README_pre_correct_",version,".txt")
    
    # saving to RData
    report_time(save(ll_raw, file=r_name))
    
    # saving to STATA
    tmp <- ll_raw
    #dev# for(i in 1:length(tmp[1,])){ print(class(tmp[,i]))  }
    # remove some variables for STATA
    tmp <- 
      tmp[,-match(c("ll_minmaj_memo"), names(tmp))
          ] 
    for ( i in seq_along(tmp[1,]) ) {
      if( any(class(tmp[,i])=="character") & any(nchar(tmp[,i])>200) ){
        tmp[,i] <- paste( substring(tmp[,i],0,200), " ...") 
      }
      tmp[,i] <- ifelse(tmp[,i]==""," ", tmp[,i])
    }
    report_time(write.dta(tmp, version=10, file=stata_name,convert.dates=F))
    message("done, info wirtten to:")
    message(getwd() %.% "/" %.% r_name)
    message(getwd() %.% "/" %.% stata_name)
  }
    
  # return
  ll_raw <- set_enc_utf8( ll_raw )
  invisible(ll_raw)
 }


