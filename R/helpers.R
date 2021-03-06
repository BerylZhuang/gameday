# test if internet connection is available since gday()
# needs to connect to NHL website

internet_connection <- function() {
	# returns TRUE (with connecton), FALSE(no connection)

	tryCatch({RCurl::getURL("www.google.com"); TRUE},
					 error = function(err) FALSE)
}


#--------------
# check if the input is a Date (YYY-MM-DD)

check_date <- function(date){
	#returns TRUE if input is a right date, FALSE otherwise
	is.na(as.POSIXct(date, format = "%Y-%m-%d")) == FALSE
}


#--------------
# check if the team name input is valid (city or team name)


check_team_name <- function(team){
	# returns TRUE is a exact match of word is found(case ignored)
	# input can be a team name or city name
	# otherwise reture false

	# list of team names and their cities
	data(arena.team)
	teams <- levels(arena.team$team)

	TRUE %in%
		grepl(pattern = paste0("\\b", team, "\\b"),
					teams, ignore.case = TRUE)
}
