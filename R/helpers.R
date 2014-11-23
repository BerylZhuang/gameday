# test if internet connection is available since gday()
# needs to connect to NHL website

internet_connection <- function() {
	# returns TRUE (with connecton), FALSE(no connection)

	tryCatch({RCurl::getURL("www.google.com"); TRUE},
					 error = function(err) FALSE)
}


# check if the input is a Date (YYY-MM-DD)

check_date <- function(date){
	#returns TRUE if input is a right date, FALSE otherwise
	is.na(as.POSIXct(date, format = "%Y-%m-%d")) == FALSE
}
