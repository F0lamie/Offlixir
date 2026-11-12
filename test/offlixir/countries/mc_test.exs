defmodule Offlixir.Countries.MCTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.
  #
  # The reference data of 2025 to 2027 holds calendar dates, so these tests compare
  # the calendar dates. The other tests compare the observed dates returned by dates!/2.

  defp calendar_dates(year) do
    :MC |> Offlixir.holidays!(year) |> Enum.map(& &1.date) |> Enum.uniq()
  end

  test "1967" do
    assert Offlixir.dates!(:MC, 1967) == [
             ~D[1967-01-02],
             ~D[1967-01-27],
             ~D[1967-03-27],
             ~D[1967-05-01],
             ~D[1967-05-04],
             ~D[1967-05-15],
             ~D[1967-05-25],
             ~D[1967-08-15],
             ~D[1967-11-01],
             ~D[1967-11-20],
             ~D[1967-12-08],
             ~D[1967-12-25]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:MC, 1985) == [
             ~D[1985-01-01],
             ~D[1985-01-27],
             ~D[1985-04-08],
             ~D[1985-05-01],
             ~D[1985-05-16],
             ~D[1985-05-27],
             ~D[1985-06-06],
             ~D[1985-08-15],
             ~D[1985-11-01],
             ~D[1985-11-19],
             ~D[1985-12-08],
             ~D[1985-12-25]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:MC, 1998) == [
             ~D[1998-01-01],
             ~D[1998-01-27],
             ~D[1998-04-13],
             ~D[1998-05-01],
             ~D[1998-05-21],
             ~D[1998-06-01],
             ~D[1998-06-11],
             ~D[1998-08-15],
             ~D[1998-11-02],
             ~D[1998-11-19],
             ~D[1998-12-08],
             ~D[1998-12-25]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:MC, 2012) == [
             ~D[2012-01-02],
             ~D[2012-01-27],
             ~D[2012-04-09],
             ~D[2012-05-01],
             ~D[2012-05-17],
             ~D[2012-05-28],
             ~D[2012-06-07],
             ~D[2012-08-15],
             ~D[2012-11-01],
             ~D[2012-11-19],
             ~D[2012-12-08],
             ~D[2012-12-25]
           ]
  end

  test "2025" do
    assert calendar_dates(2025) == [
             ~D[2025-01-01],
             ~D[2025-01-27],
             ~D[2025-04-21],
             ~D[2025-05-01],
             ~D[2025-05-29],
             ~D[2025-06-09],
             ~D[2025-06-19],
             ~D[2025-08-15],
             ~D[2025-11-01],
             ~D[2025-11-19],
             ~D[2025-12-08],
             ~D[2025-12-25]
           ]
  end

  test "2026" do
    assert calendar_dates(2026) == [
             ~D[2026-01-01],
             ~D[2026-01-27],
             ~D[2026-04-06],
             ~D[2026-05-01],
             ~D[2026-05-14],
             ~D[2026-05-25],
             ~D[2026-06-04],
             ~D[2026-08-15],
             ~D[2026-11-01],
             ~D[2026-11-19],
             ~D[2026-12-08],
             ~D[2026-12-25]
           ]
  end

  test "2027" do
    assert calendar_dates(2027) == [
             ~D[2027-01-01],
             ~D[2027-01-27],
             ~D[2027-03-29],
             ~D[2027-05-01],
             ~D[2027-05-06],
             ~D[2027-05-17],
             ~D[2027-05-27],
             ~D[2027-08-15],
             ~D[2027-11-01],
             ~D[2027-11-19],
             ~D[2027-12-08],
             ~D[2027-12-25]
           ]
  end

  describe "observed dates" do
    test "four holidays are observed on the Monday when they fall on a Sunday" do
      # The 1st of November 2026 is a Sunday.
      dates = Offlixir.dates!(:MC, 2026)

      assert ~D[2026-11-02] in dates
      refute ~D[2026-11-01] in dates
    end

    test "the other holidays are not moved" do
      # The 15th of August 2027 is a Sunday.
      assert ~D[2027-08-15] in Offlixir.dates!(:MC, 2027)
    end
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:MC, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-01-27], "Saint Devota's Day"},
             {~D[2026-04-06], "Easter Monday"},
             {~D[2026-05-01], "May Day"},
             {~D[2026-05-14], "Ascension Day"},
             {~D[2026-05-25], "Whit Monday"},
             {~D[2026-06-04], "Corpus Christi"},
             {~D[2026-08-15], "Assumption Day"},
             {~D[2026-11-01], "All Saints Day"},
             {~D[2026-11-19], "National Day"},
             {~D[2026-12-08], "The Immaculate Conception"},
             {~D[2026-12-25], "Christmas Day"}
           ]
  end
end
