defmodule Offlixir.Countries.NO do
  @moduledoc false
  # Norway.

  import Offlixir.Rules

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Første nyttårsdag", "New Year's Day"),
      fixed(year, 5, 1, "LABOURDAY-01", "Første mai", "Labour Day"),
      fixed(year, 5, 17, "CONSTITUTIONDAY-01", "Syttende mai", "Constitution Day"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Første juledag", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Andre juledag", "St. Stephen's Day"),
      easter(year, :catholic, :maundy_thursday, "Skjærtorsdag"),
      easter(year, :catholic, :good_friday, "Langfredag"),
      easter(year, :catholic, :easter_sunday, "Første påskedag"),
      easter(year, :catholic, :easter_monday, "Andre påskedag"),
      easter(year, :catholic, :ascension_day, "Kristi himmelfartsdag"),
      easter(year, :catholic, :pentecost, "Første pinsedag"),
      easter(year, :catholic, :whit_monday, "Andre pinsedag")
    ]
  end
end
