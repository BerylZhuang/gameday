#' Is it Gameday? new2
#'
#' This function returns TRUE if your NHL team plays today
#' and FALSE otherwise
#'
#' You know then problem: You're in your office writing R code and
#' suddenly have the urge to check whether your NHL team has a game today.
#' Before you know it you just wasted 15 minutes browsing the lastest
#' news on your favorite hockey webpage.
#' Suffer no more! You can now ask R directly, without tempting yourself
#' by firing up your web browser.
#'
#' @param team The name of your team
#' @param date The date you want to check (in YYYY-MM-DD format),
#' default vaule is system date
#' @return Logical \code{TRUE} if \code{team} has a NHL game today,
#' \code{FALSE} otherwise
#' @note case in \code{team} is ignored
#' @export
#' @examples
#' gday("canucks")
#' gday("Blues", "2014-11-22")
#'


gday <- function(team = "canucks", date = Sys.Date()){
	# test if with internet connection
	if(internet_connection() == FALSE)
		stop("Error: No internect connection")
	# test if the input of team name is correct
	if(check_team_name(team) == FALSE)
		stop("Error: Input of the team name is not found.
				 please provide a valid team name. e.g. blues, case ignored.")
	# test if the input of date is yyy-mm-dd format
	if(check_date(date) == FALSE)
		 stop("Error: Input of date format should be YYYY-MM-DD
		 		 e.g. 2014-11-22")

	#
	#main function
	url  <- paste0('http://live.nhle.com/GameData/GCScoreboard/',
								 date, '.jsonp')
	grepl(team, RCurl::getURL(url), ignore.case = TRUE)
}
