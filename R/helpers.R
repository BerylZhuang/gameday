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
# check if the team name input is valid

check_team_name <- function(team){
	# returns TRUE is a exact match of team is found(case ignored)
	# otherwise reture false

	# list of team names(last update nov 2014)
	teams <- c('Ducks', 'Blackhawks', 'Wild', 'Senators',
						 'Coyotes', 'Avalanche', 'Canadiens', 'Sharks',
						 'Bruins', 'Blue Jackets', 'Predators', 'Blues',
						 'Sabres', 'Stars', 'Devils', 'Lightning',
						 'Flames', 'Red Wings', 'Islanders', 'Maple Leafs',
						 'Hurricanes', 'Oilers', 'Rangers', 'Canucks',
						 'Kings', 'Panthers', 'Flyers', 'Capitals',
						 'Penguins', 'Jets')

	TRUE %in%
		grepl(pattern = paste0("^", team, "$"),
					teams, ignore.case = TRUE)
}
