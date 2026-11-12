defmodule Offlixir.Countries.AX do
  @moduledoc false
  # Åland Islands.

  import Offlixir.Rules

  @saturday 6

  def holidays(year) do
    midsummer_day = on_or_after(Date.new!(year, 6, 20), @saturday)
    midsummer_eve = Date.add(midsummer_day, -1)
    all_saints_day = on_or_after(Date.new!(year, 10, 31), @saturday)

    [
      fixed(year, 1, 1, "NEWYEARSDAY-01", "Nyårsdagen", "New Year's Day"),
      fixed(year, 1, 6, "EPIPHANY-01", "Trettondagen", "Epiphany"),
      fixed(year, 5, 1, "MAYDAY-01", "Första maj", "May Day"),
      fixed(year, 6, 9, "AUTONOMYDAY-01", "Självstyrelsedagen", "Autonomy Day"),
      on(midsummer_eve, "MIDSUMMEREVE-01", "Midsommarafton", "Midsummer Eve"),
      on(midsummer_day, "MIDSUMMERDAY-01", "Midsommardagen", "Midsummer Day"),
      on(all_saints_day, "ALLSAINTSDAY-01", "Alla helgons dag", "All Saints Day"),
      fixed(year, 12, 6, "INDEPENDENCEDAY-01", "Självständighetsdagen", "Independence Day"),
      fixed(year, 12, 24, "CHRISTMASEVE-01", "Julafton", "Christmas Eve"),
      fixed(year, 12, 25, "CHRISTMASDAY-01", "Juldagen", "Christmas Day"),
      fixed(year, 12, 26, "STSTEPHENSDAY-01", "Annandag jul", "St. Stephen's Day"),
      easter(year, :catholic, :good_friday, "Långfredag"),
      easter(year, :catholic, :easter_sunday, "Påskdagen"),
      easter(year, :catholic, :easter_monday, "Annandag påsk"),
      easter(year, :catholic, :ascension_day, "Kristi himmelsfärdsdagn"),
      easter(year, :catholic, :pentecost, "Pingstdagen")
    ]
  end
end
