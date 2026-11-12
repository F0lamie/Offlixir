defmodule Offlixir.Countries.FO do
  @moduledoc false
  # Faroe Islands.

  import Offlixir.Rules

  alias Offlixir.Easter

  def holidays(year) do
    # The fourth Friday after Easter.
    general_prayer_day = Date.add(Easter.gregorian(year), 26)

    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Nýggjársdagur", "New Year's Day"),
      fixed(year, 4, 25, "FLAGDAY-01", "Flaggdagur", "National Flag Day"),
      on(general_prayer_day, "GENERALPRAYERDAY-01", "Dýri biðidagur", "General Prayer Day"),
      fixed(year, 6, 5, "CONSTITUTIONDAY-01", "Grundlógardagur Danmarkar", "Constitution Day"),
      fixed(year, 7, 28, "SAINTOLAVSEVE-01", "Ólavsøkuaftan", "Saint Olav's Eve"),
      fixed(year, 7, 29, "SAINTOLAVSDAY-01", "Ólavsøkudagur", "Saint Olav's Day"),
      fixed(year, 12, 24, "CHRISTMASEVE-01", "Jólaaftanskvøld", "Christmas Eve"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Jóladagur", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "2. Jóladagur", "St. Stephen's Day"),
      fixed(year, 12, 31, "NEWYEARSEVE-01", "Nýggjársaftan", "New Year's Eve"),
      easter(year, :catholic, :maundy_thursday, "Skírhósdagur"),
      easter(year, :catholic, :good_friday, "Langifríggjadagur"),
      easter(year, :catholic, :easter_sunday, "Páskadagur"),
      easter(year, :catholic, :easter_monday, "2. Páskadagur"),
      easter(year, :catholic, :ascension_day, "Kristi himmalsferðar dagur"),
      easter(year, :catholic, :pentecost, "Hvítasunnudagur"),
      easter(year, :catholic, :whit_monday, "2. Hvítasunnudagur")
    ]
  end
end
