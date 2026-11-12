defmodule Offlixir.Countries.LV do
  @moduledoc false
  # Latvia.

  import Offlixir.Rules

  @sunday 7

  # A holiday on a Saturday or a Sunday is observed the following Monday.
  @to_monday %{6 => 2, 7 => 1}

  def holidays(year) do
    mothers_day = nth_weekday(year, 5, @sunday, 2)

    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Jaungada diena", "New Year's Day"),
      fixed(year, 5, 1, "LABOURDAY-01", "Darba svētki", "Labour Day"),
      fixed(
        year,
        5,
        1,
        "CONSTITUTIONALASSEMBLYDAY-01",
        "Latvijas Republikas Satversmes sapulces sasaukšanas diena",
        "Day of the Convocation of the Constitutional Assembly of the Republic of Latvia"
      ),
      fixed(
        year,
        5,
        4,
        "RESTORATIONOFINDEPENDENCE-01",
        "Latvijas Republikas Neatkarības atjaunošanas diena",
        "Day of the Restoration of Independence of the Republic of Latvia",
        @to_monday
      ),
      on(mothers_day, "MOTHERSDAY-01", "Mātes diena", "Mother's Day"),
      fixed(year, 6, 23, "MIDSUMMEREVE-01", "Līgo diena", "Līgo Day"),
      fixed(year, 6, 24, "MIDSUMMERDAY-01", "Jāņu diena", "Jāņi Day"),
      fixed(
        year,
        11,
        18,
        "PROCLAMATIONDAY-01",
        "Latvijas Republikas Proklamēšanas diena",
        "Day of the Proclamation of the Republic of Latvia",
        @to_monday
      ),
      fixed(year, 12, 24, "CHRISTMASEVE-01", "Ziemassvētku vakars", "Christmas Eve"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Pirmie Ziemassvētki", "Christmas Day"),
      fixed(year, 12, 26, "CHRISTMASDAY-02", "Otrie Ziemassvētki", "Second day of Christmas"),
      fixed(year, 12, 31, "NEWYEARSEVE-01", "Vecgada diena", "New Year's Eve"),
      easter(year, :catholic, :good_friday, "Lielā Piektdiena"),
      easter(year, :catholic, :easter_sunday, "Pirmās Lieldienas"),
      easter(year, :catholic, :easter_monday, "Otrās Lieldienas"),
      easter(year, :catholic, :pentecost, "Vasarsvētki"),
      song_and_dance_celebration(year),
      pope_francis_visit(year),
      ice_hockey_bronze_medal(year)
    ]
  end

  # Held every five years, on a date set for each edition.
  defp song_and_dance_celebration(year) do
    day =
      case year do
        2018 -> 8
        2023 -> 9
        2028 -> 9
        _other -> nil
      end

    if day do
      fixed(
        year,
        7,
        day,
        "SONGANDDANCECELEBRATION-01",
        "Vispārējo latviešu Dziesmu un deju svētku noslēguma diena",
        "Final Day of the Nationwide Latvian Song and Dance Celebration",
        @to_monday
      )
    end
  end

  defp pope_francis_visit(2018) do
    fixed(
      2018,
      9,
      24,
      "POPEFRANCISVISIT-01",
      "Viņa Svētības pāvesta Franciska pastorālās vizītes Latvijā diena",
      "Day of the Pastoral Visit of His Holiness Pope Francis to Latvia"
    )
  end

  defp pope_francis_visit(_year), do: nil

  defp ice_hockey_bronze_medal(2023) do
    fixed(
      2023,
      5,
      29,
      "ICEHOCKEYBRONZEMEDAL-01",
      "Diena, kad Latvijas hokeja komanda ieguva bronzas medaļu 2023. gada Pasaules hokeja čempionātā",
      "Day of the Latvian Ice Hockey Team's Bronze Medal Win at the 2023 IIHF World Championship"
    )
  end

  defp ice_hockey_bronze_medal(_year), do: nil
end
