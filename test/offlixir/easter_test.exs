defmodule Offlixir.EasterTest do
  use ExUnit.Case, async: true

  alias Offlixir.Easter

  doctest Offlixir.Easter

  # Known dates of Easter Sunday, Western then Orthodox, both in the Gregorian calendar.
  # Source: https://en.wikipedia.org/wiki/List_of_dates_for_Easter
  @known [
    {1967, ~D[1967-03-26], ~D[1967-04-30]},
    {1985, ~D[1985-04-07], ~D[1985-04-14]},
    {1998, ~D[1998-04-12], ~D[1998-04-19]},
    {2008, ~D[2008-03-23], ~D[2008-04-27]},
    {2011, ~D[2011-04-24], ~D[2011-04-24]},
    {2012, ~D[2012-04-08], ~D[2012-04-15]},
    {2016, ~D[2016-03-27], ~D[2016-05-01]},
    {2019, ~D[2019-04-21], ~D[2019-04-28]},
    {2024, ~D[2024-03-31], ~D[2024-05-05]},
    {2025, ~D[2025-04-20], ~D[2025-04-20]},
    {2026, ~D[2026-04-05], ~D[2026-04-12]},
    {2027, ~D[2027-03-28], ~D[2027-05-02]},
    {2038, ~D[2038-04-25], ~D[2038-04-25]}
  ]

  test "gregorian/1 returns the known dates of Western Easter" do
    for {year, western, _orthodox} <- @known do
      assert Easter.gregorian(year) == western
    end
  end

  test "orthodox/1 returns the known dates of Orthodox Easter" do
    for {year, _western, orthodox} <- @known do
      assert Easter.orthodox(year) == orthodox
    end
  end

  test "both are always a Sunday, between the 22nd of March and the 25th of April for the Western one" do
    for year <- 1..9999 do
      western = Easter.gregorian(year)

      assert Date.day_of_week(western) == 7
      assert Date.day_of_week(Easter.orthodox(year)) == 7
      assert {western.month, western.day} >= {3, 22} and {western.month, western.day} <= {4, 25}
    end
  end

  test "Orthodox Easter is never before Western Easter from 1583" do
    for year <- 1583..9999 do
      assert Date.compare(Easter.orthodox(year), Easter.gregorian(year)) != :lt
    end
  end

  # The gap between the Julian and Gregorian calendars, per range of years.
  @shifts [
    {1583..1699, 10},
    {1700..1799, 11},
    {1800..1899, 12},
    {1900..2099, 13},
    {2100..2199, 14},
    {2200..2299, 15},
    {2300..2499, 16},
    {2500..2599, 17},
    {2600..2699, 18},
    {2700..2899, 19},
    {2900..2999, 20},
    {3000..3099, 21},
    {3100..3299, 22},
    {3300..3399, 23}
  ]

  test "gregorian_shift/1 gives the gap between the two calendars" do
    for {years, shift} <- @shifts, year <- years do
      assert Easter.gregorian_shift(year) == shift
    end

    assert Easter.gregorian_shift(99) == -2
    assert Easter.gregorian_shift(100) == -1
    assert Easter.gregorian_shift(200) == 0
    assert Easter.gregorian_shift(1582) == 10
    assert Easter.gregorian_shift(3400) == 24
    assert Easter.gregorian_shift(9999) == 73
  end
end
