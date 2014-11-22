# tests for gday()

#test for ignored case for team names
test_that("case is ignored", {
  expect_equal(gday("canucks"), gday("CANUCKS"))
})

# test if the input team is not a team name
test_that("Seattle does not have a NHL team", {
  expect_false(gday("seattle"))
})

test_that("Blues has a game against Senators on 2014-11-22", {
	expect_true(gday(team = "blues",   date = "2014-11-22"))
	expect_true(gday(team = "senators", date = "2014-11-22"))
})
