test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("filtre_genre fonctionne", {
  res <- filter_gender(netflix, "Female")
  expect_true(all(res$gender == "Female"))
})

test_that("temps_moyen_abonnement retourne un dataframe", {
  res <- mean_watch_time_by_subscription(netflix)
  expect_s3_class(res, "data.frame")
})

test_that("plot retourne un ggplot", {
  res <- plot_watch_time_by_subscription(netflix)
  expect_s3_class(res, "ggplot")
})
