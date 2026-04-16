test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("filtre_genre fonctionne", {
  res <- filtre_genre(netflix, "Female")
  expect_true(all(res$gender == "Female"))
})

test_that("temps_moyen_abonnement retourne un dataframe", {
  res <- temps_moyen_abonnement(netflix)
  expect_s3_class(res, "data.frame")
})

test_that("plot retourne un ggplot", {
  res <- temps_moyen_abonnement_graph(netflix)
  expect_s3_class(res, "ggplot")
})
