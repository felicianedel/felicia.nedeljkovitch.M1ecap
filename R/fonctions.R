#' @importFrom rlang .data
NULL

#' Filtrer les données Netflix par genre
#'
#' Filtre le jeu de données selon le genre.
#'
#' @param data Un data frame.
#' @param gender Le genre à conserver.
#'
#' @return Un data frame filtré.
#' @export
filtre_genre <- function(data, gender) {
  data[data$gender == gender, ]
}


#' Calculer le temps moyen de visionnage par abonnement
#'
#' @param data Un data frame.
#'
#' @return Un data frame.
#' @export
temps_moyen_abonnement <- function(data) {
  stats::aggregate(
    avg_watch_time_minutes ~ subscription_type,
    data = data,
    FUN = mean
  )
}
#' Représenter le temps moyen de visionnage par abonnement
#'
#' @param data Un data frame.
#'
#' @return Un graphique ggplot2.
#' @export
temps_moyen_abonnement_graph <- function(data) {
  df_summary <- temps_moyen_abonnement(data)

  ggplot2::ggplot(
    df_summary,
    ggplot2::aes(
      x = .data$subscription_type,
      y = .data$avg_watch_time_minutes
    )
  ) +
    ggplot2::geom_col() +
    ggplot2::labs(
      title = "Temps moyen de visionnage par abonnement",
      x = "Type d'abonnement",
      y = "Temps moyen (minutes)"
    )
}
#' Calculer un temps de visionnage moyen après filtrage
#'
#' Filtre les données selon un pays et un âge minimal, puis calcule
#' le temps de visionnage moyen.
#'
#' @param data Un data frame.
#' @param country Le pays à conserver.
#' @param min_age L'âge minimal à conserver.
#'
#' @return Une valeur numérique.
#' @export
temps_moyen_age_pays <- function(data, country, min_age) {
  subset_data <- data[data$country == country & data$age >= min_age, ]

  mean(subset_data$avg_watch_time_minutes)
}

