#### tests for gday()

#test for ignored case for team names
test_that("case is ignored", {
  expect_equal(gday("canucks"), gday("CANUCKS"))
})

# test if the input team is not a team name, expect error message
test_that("Seattle does not have a NHL team", {
  expect_error(gday("seattle"))
})

# test expect_true
test_that("Blues has a game against Senators on 2014-11-22", {
	expect_true(gday(team = "blues",   date = "2014-11-22"))
	expect_true(gday(team = "senators", date = "2014-11-22"))
})


# test expect_false
test_that("Blues did not have game against Senators on 2014-11-19", {
	expect_false(gday(team = "blues",   date = "2014-11-19"))
	expect_false(gday(team = "senators", date = "2014-11-19"))
})

# test expect_error
test_that("expect error message if date format is not correct", {
	expect_error(gday(team = "blues",   date = "Nov 22 2014"))
})


#### tests for scores()
test_that("Nov 23, 2014 is not the correct date format", {
	expect_error(scores("Nov 23, 2014"))
})



#----------
# tests for helper function check_date

test_that("2014-11-19 is a date format", {
	expect_true(check_date("2014-11-19"))
	expect_false(gday(team = "senators", date = "2014-11-19"))
})

test_that("Nov 23, 2014 is not the correct date format", {
	expect_false(check_date("Nov 23, 2014"))
})

test_that("Nov 23, 2014 is not the correct date format", {
	expect_equal(check_date("Nov 23, 2014"), FALSE)
})

#-------
# tests for helper function check_team_name

test_that("case is ignored", {
	expect_equal(check_team_name("canucks"), check_team_name("CANUCKS"))
})

test_that("team name must be exact match, but case ignored", {
	expect_true(check_team_name("canucks"))
	expect_false(check_team_name("canuc"))
})


test_that("return false if the provided team name if not in the list", {
	expect_false(check_team_name("seattle"))
})
