defmodule Offlixir.Countries.DK do
  @moduledoc false
  # Denmark.

  import Offlixir.Rules

  alias Offlixir.Easter

  def holidays(year) do
    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Nytårsdag", "New Year's Day"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Juledag / 1. juledag", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "2. juledag", "St. Stephen's Day"),
      easter(year, :catholic, :maundy_thursday, "Skærtorsdag"),
      easter(year, :catholic, :good_friday, "Langfredag"),
      easter(year, :catholic, :easter_sunday, "Påskedag"),
      easter(year, :catholic, :easter_monday, "2. Påskedag"),
      easter(year, :catholic, :ascension_day, "Kristi Himmelfartsdag"),
      easter(year, :catholic, :pentecost, "Pinsedag"),
      easter(year, :catholic, :whit_monday, "2. Pinsedag"),
      general_prayer_day(year)
    ]
  end

  # The fourth Friday after Easter. Abolished from 2024.
  defp general_prayer_day(year) when year < 2024 do
    on(
      Date.add(Easter.gregorian(year), 26),
      "GENERALPRAYERDAY-01",
      "Store bededag",
      "General Prayer Day"
    )
  end

  defp general_prayer_day(_year), do: nil
end
