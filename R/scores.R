#' What is the score?
#'
#' Takes date and returns a data.frame with
#' information about the games on the given date.
#'
#' Now you can check the scores of the NHL teams played/playing
#' on a given date, without the temptation to browse the web or
#' to watch the live stream...
#'
#' @param date The date you want to check the scores (in YYYY-MM-DD format),
#' default vaule is system date
#' @return A data.frame of listing home and away teams and their scores
#' @export
#' @examples
#' scores()
#' scores("2014-11-22")
#'


scores <- function(date = Sys.Date()){
	#validity checks

	# test if with internet connection
	if(internet_connection() == FALSE)
		stop("Error: No internect connection")

	# test if the input of date is yyyy-mm-dd format
	if(check_date(date) == FALSE)
		stop("Error: Input of date format should be YYYY-MM-DD
		 		 e.g. 2014-11-22")

	# the codes are provided in the homework description, with
	# minor modification
	url  <- paste0("http://live.nhle.com/GameData/GCScoreboard/",
								 date, ".jsonp")
	raw <- getURL(url)
	json <- gsub("([a-zA-Z_0-9\\.]*\\()|(\\);?$)", "", raw, perl = TRUE)
	data <- jsonlite::fromJSON(json)$games
	scores <-
		with(data,
			 data.frame(home = paste(htn, htcommon),
			 					 away = paste(atn, atcommon),
			 					 home_score = hts,
			 					 away_score = ats,
			 					 date = date))
	print(scores)
}
