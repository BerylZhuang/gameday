# write the help file
#' Is it Gameday?
#'
#'This function returns TRUE if you NHL team plays today
#'and FALSE otherwise
#'
#'
#' You know then problem: You're in your office writing R code and
#' suddenly have the urge to check whether your NHL team has a game today.
#' Before you know it you just wasted 15 minutes browsing the lastest
#' news on your favorite hockey webpage.
#' Suffer no more! You can now ask R directly, without tempting yourself
#' by firing up your web browser.
#' 
#' @param team.name Defaults to "canucks", \code{date} desults to system date
#' @return Logical \code{TRUE} if \code{team.name} has an NHL game on \code{date},
#' \code{FALSE} otherwise
#' @keywords misc
#' @note case in \code{team.name} is ignored
#' @export
#' @examples
#' gday()
#' gday("canadiens", 2014-10-10)
#' gday("Bruins")
#' 


# library(RCurl) # list in dependency

# find the team name in the URL (ignore cases)
gday <- function(team.name = "canucks", date = Sys.Date()) {
# 	expect_that(,
# 							shows_message("date should be in yyyy-mm-dd format"))
	url <- paste0("http://live.nhle.com/GameData/GCScoreboard/", date, ".jsonp")
	grepl(team.name, getURL(url), ignore.case=TRUE)
}


