defmodule Offlixir.Countries.BGTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.
  #
  # The reference data of 2025 to 2027 holds calendar dates, so these tests compare
  # the calendar dates. The other tests compare the observed dates returned by dates!/2.

  defp calendar_dates(year) do
    :BG |> Offlixir.holidays!(year) |> Enum.map(& &1.date) |> Enum.uniq()
  end

  test "1967" do
    assert Offlixir.dates!(:BG, 1967) == [
             ~D[1967-01-02],
             ~D[1967-03-03],
             ~D[1967-04-28],
             ~D[1967-04-29],
             ~D[1967-04-30],
             ~D[1967-05-01],
             ~D[1967-05-08],
             ~D[1967-05-24],
             ~D[1967-09-06],
             ~D[1967-09-22],
             ~D[1967-12-25],
             ~D[1967-12-26],
             ~D[1967-12-27]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:BG, 1985) == [
             ~D[1985-01-01],
             ~D[1985-03-04],
             ~D[1985-04-12],
             ~D[1985-04-13],
             ~D[1985-04-14],
             ~D[1985-04-15],
             ~D[1985-05-01],
             ~D[1985-05-06],
             ~D[1985-05-24],
             ~D[1985-09-06],
             ~D[1985-09-23],
             ~D[1985-12-24],
             ~D[1985-12-25],
             ~D[1985-12-26]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:BG, 1998) == [
             ~D[1998-01-01],
             ~D[1998-03-03],
             ~D[1998-04-17],
             ~D[1998-04-18],
             ~D[1998-04-19],
             ~D[1998-04-20],
             ~D[1998-05-01],
             ~D[1998-05-06],
             ~D[1998-05-25],
             ~D[1998-09-07],
             ~D[1998-09-22],
             ~D[1998-12-24],
             ~D[1998-12-25],
             ~D[1998-12-26]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:BG, 2012) == [
             ~D[2012-01-02],
             ~D[2012-03-05],
             ~D[2012-04-13],
             ~D[2012-04-14],
             ~D[2012-04-15],
             ~D[2012-04-16],
             ~D[2012-05-01],
             ~D[2012-05-07],
             ~D[2012-05-24],
             ~D[2012-09-06],
             ~D[2012-09-24],
             ~D[2012-12-24],
             ~D[2012-12-25],
             ~D[2012-12-26]
           ]
  end

  test "2025" do
    assert calendar_dates(2025) == [
             ~D[2025-01-01],
             ~D[2025-03-03],
             ~D[2025-04-18],
             ~D[2025-04-19],
             ~D[2025-04-20],
             ~D[2025-04-21],
             ~D[2025-05-01],
             ~D[2025-05-06],
             ~D[2025-05-24],
             ~D[2025-09-06],
             ~D[2025-09-22],
             ~D[2025-12-24],
             ~D[2025-12-25],
             ~D[2025-12-26],
             ~D[2025-12-31]
           ]
  end

  test "2026" do
    assert calendar_dates(2026) == [
             ~D[2026-01-01],
             ~D[2026-01-02],
             ~D[2026-03-03],
             ~D[2026-04-10],
             ~D[2026-04-11],
             ~D[2026-04-12],
             ~D[2026-04-13],
             ~D[2026-05-01],
             ~D[2026-05-06],
             ~D[2026-05-24],
             ~D[2026-09-06],
             ~D[2026-09-22],
             ~D[2026-12-24],
             ~D[2026-12-25],
             ~D[2026-12-26]
           ]
  end

  test "2027" do
    assert calendar_dates(2027) == [
             ~D[2027-01-01],
             ~D[2027-03-03],
             ~D[2027-04-30],
             ~D[2027-05-01],
             ~D[2027-05-02],
             ~D[2027-05-03],
             ~D[2027-05-06],
             ~D[2027-05-24],
             ~D[2027-09-06],
             ~D[2027-09-22],
             ~D[2027-12-24],
             ~D[2027-12-25],
             ~D[2027-12-26]
           ]
  end

  describe "observed dates" do
    test "a holiday on a week-end is observed the following Monday" do
      # The 24th of May and the 6th of September 2026 are Sundays.
      dates = Offlixir.dates!(:BG, 2026)

      assert ~D[2026-05-25] in dates
      refute ~D[2026-05-24] in dates
      assert ~D[2026-09-07] in dates
      refute ~D[2026-09-06] in dates
    end

    test "the days of Christmas are only moved when one is a Sunday" do
      # The 25th of December 2027 is a Saturday and the 26th a Sunday.
      dates = Offlixir.dates!(:BG, 2027)

      assert ~D[2027-12-24] in dates
      assert ~D[2027-12-25] in dates
      refute ~D[2027-12-26] in dates
      assert ~D[2027-12-27] in dates
    end

    test "Labour Day is never moved" do
      # The 1st of May 2027 is a Saturday.
      assert ~D[2027-05-01] in Offlixir.dates!(:BG, 2027)
    end
  end

  describe "year conditions" do
    test "the currency change days are holidays in 2025 and 2026 only" do
      refute ~D[2024-12-31] in Offlixir.dates!(:BG, 2024)
      assert ~D[2025-12-31] in Offlixir.dates!(:BG, 2025)
      refute ~D[2026-12-31] in Offlixir.dates!(:BG, 2026)

      refute ~D[2025-01-02] in Offlixir.dates!(:BG, 2025)
      assert ~D[2026-01-02] in Offlixir.dates!(:BG, 2026)
      refute ~D[2027-01-02] in Offlixir.dates!(:BG, 2027)
    end
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:BG, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-01-02], "Currency change day"},
             {~D[2026-03-03], "Liberation Day"},
             {~D[2026-04-10], "Good Friday"},
             {~D[2026-04-11], "Holy Saturday"},
             {~D[2026-04-12], "Easter Sunday"},
             {~D[2026-04-13], "Easter Monday"},
             {~D[2026-05-01], "International Workers' Day"},
             {~D[2026-05-06], "Saint George's Day"},
             {~D[2026-05-24], "Saints Cyril and Methodius Day"},
             {~D[2026-09-06], "Unification Day"},
             {~D[2026-09-22], "Independence Day"},
             {~D[2026-12-24], "Christmas Eve"},
             {~D[2026-12-25], "Christmas Day"},
             {~D[2026-12-26], "Second day of Christmas"}
           ]
  end
end
