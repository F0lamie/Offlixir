defmodule Offlixir.Countries.VA do
  @moduledoc false
  # Vatican City.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(
        year,
        1,
        1,
        "SOLEMNITYMOTHERGOD-01",
        "Maria Santissima Madre di Dio",
        "Solemnity of Mary, Mother of God"
      ),
      fixed(year, 1, 6, "EPIPHANY-01", "Epifania del Signore", "Epiphany"),
      fixed(
        year,
        2,
        11,
        "ANNIVERSARYOFTHEFOUNDATION-01",
        "Anniversario della istituzione dello Stato della Città del Vaticano",
        "Anniversary of the foundation of Vatican City"
      ),
      anniversary_of_the_election_of_pope_francis(year),
      fixed(year, 3, 19, "SAINTJOSEPHSDAY-01", "San Giuseppe", "Saint Joseph's Day"),
      name_day_of_pope_francis(year),
      fixed(
        year,
        5,
        1,
        "SAINTJOSEPHWORKER-01",
        "San Giuseppe lavoratore",
        "Saint Joseph the Worker"
      ),
      fixed(
        year,
        6,
        29,
        "SAINTSPETERPAUL-01",
        "Santi Pietro e Paolo",
        "Saint Peter and Saint Paul"
      ),
      fixed(year, 8, 15, "ASSUMPTIONDAY-01", "Assunzione di Maria in Cielo", "Assumption Day"),
      fixed(
        year,
        9,
        8,
        "NATIVITYOFMARY-01",
        "Festa della natività della madonna",
        "Nativity of Mary"
      ),
      fixed(year, 11, 1, "ALLSAINTSDAY-01", "Tutti i Santi, Ognissanti", "All Saints Day"),
      fixed(
        year,
        12,
        8,
        "IMMACULATECONCEPTION-01",
        "Immacolata Concezione",
        "Immaculate Conception"
      ),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Natale", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Santo Stefano", "St. Stephen's Day"),
      easter(year, :catholic, :easter_monday, "Lunedì dell'Angelo")
    ]
  end

  # Correction of the reference rules, which give the two holidays below for every year.
  # They are tied to Pope Francis, elected on the 13th of March 2013 and who died in
  # April 2025. The matching holidays of the other popes are not known to
  # the reference rules and are not added. See DEVIATIONS.md.

  defp anniversary_of_the_election_of_pope_francis(year) when year in 2013..2025 do
    fixed(
      year,
      3,
      13,
      "ANNIVERSARYOFTHEELECTION-01",
      "Anniversario dell'Elezione del Santo Padre",
      "Anniversary of the election of Pope Francis"
    )
  end

  defp anniversary_of_the_election_of_pope_francis(_year), do: nil

  # Saint George, the name day of the pope, born Jorge Mario Bergoglio.
  defp name_day_of_pope_francis(year) when year in 2013..2024 do
    fixed(year, 4, 23, "SAINTGEORGE-01", "Onomastico del Santo Padre", "Saint George")
  end

  defp name_day_of_pope_francis(_year), do: nil
end
