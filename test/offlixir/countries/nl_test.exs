defmodule Offlixir.Countries.NLTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.
  #
  # The reference data of 2025 to 2027 holds calendar dates, so these tests compare
  # the calendar dates. The other tests compare the observed dates returned by dates!/2.
  #
  # Deliberate deviation: the reference data gives King's Day on the 27th of April for
  # every year. Offlixir gives Queen's Day on the 30th of April from 1949 to 2013,
  # so the 1985, 1998 and 2012 lists carry the 30th where the reference data has the 27th.
  # See DEVIATIONS.md.

  defp calendar_dates(year) do
    :NL |> Offlixir.holidays!(year) |> Enum.map(& &1.date) |> Enum.uniq()
  end

  test "1967, when Queen's Day falls on a Sunday and is held on Monday" do
    assert Offlixir.dates!(:NL, 1967) == [
             ~D[1967-01-01],
             ~D[1967-03-26],
             ~D[1967-03-27],
             ~D[1967-05-01],
             ~D[1967-05-04],
             ~D[1967-05-14],
             ~D[1967-05-15],
             ~D[1967-12-25],
             ~D[1967-12-26]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:NL, 1985) == [
             ~D[1985-01-01],
             ~D[1985-04-07],
             ~D[1985-04-08],
             ~D[1985-04-30],
             ~D[1985-05-05],
             ~D[1985-05-16],
             ~D[1985-05-26],
             ~D[1985-05-27],
             ~D[1985-12-25],
             ~D[1985-12-26]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:NL, 1998) == [
             ~D[1998-01-01],
             ~D[1998-04-12],
             ~D[1998-04-13],
             ~D[1998-04-30],
             ~D[1998-05-21],
             ~D[1998-05-31],
             ~D[1998-06-01],
             ~D[1998-12-25],
             ~D[1998-12-26]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:NL, 2012) == [
             ~D[2012-01-01],
             ~D[2012-04-08],
             ~D[2012-04-09],
             ~D[2012-04-30],
             ~D[2012-05-17],
             ~D[2012-05-27],
             ~D[2012-05-28],
             ~D[2012-12-25],
             ~D[2012-12-26]
           ]
  end

  test "2025" do
    assert calendar_dates(2025) == [
             ~D[2025-01-01],
             ~D[2025-04-20],
             ~D[2025-04-21],
             ~D[2025-04-27],
             ~D[2025-05-29],
             ~D[2025-06-08],
             ~D[2025-06-09],
             ~D[2025-12-25],
             ~D[2025-12-26]
           ]
  end

  test "2026" do
    assert calendar_dates(2026) == [
             ~D[2026-01-01],
             ~D[2026-04-05],
             ~D[2026-04-06],
             ~D[2026-04-27],
             ~D[2026-05-14],
             ~D[2026-05-24],
             ~D[2026-05-25],
             ~D[2026-12-25],
             ~D[2026-12-26]
           ]
  end

  test "2027" do
    assert calendar_dates(2027) == [
             ~D[2027-01-01],
             ~D[2027-03-28],
             ~D[2027-03-29],
             ~D[2027-04-27],
             ~D[2027-05-06],
             ~D[2027-05-16],
             ~D[2027-05-17],
             ~D[2027-12-25],
             ~D[2027-12-26]
           ]
  end

  describe "Queen's Day and King's Day" do
    test "Queen's Day on a Sunday is held on the Saturday from 1980" do
      # The 30th of April 2006 is a Sunday.
      assert ~D[2006-04-29] in Offlixir.dates!(:NL, 2006)
      refute ~D[2006-04-30] in Offlixir.dates!(:NL, 2006)
    end

    test "King's Day replaces Queen's Day in 2014" do
      assert ~D[2013-04-30] in Offlixir.dates!(:NL, 2013)
      refute ~D[2014-04-30] in Offlixir.dates!(:NL, 2014)
      assert ~D[2015-04-27] in Offlixir.dates!(:NL, 2015)
    end

    test "King's Day on a Sunday is held on the Saturday" do
      # The 27th of April 2014 and 2025 are Sundays.
      assert ~D[2014-04-26] in Offlixir.dates!(:NL, 2014)
      assert ~D[2025-04-26] in Offlixir.dates!(:NL, 2025)
      refute ~D[2025-04-27] in Offlixir.dates!(:NL, 2025)
    end

    test "the holiday carries the name of its time" do
      name = fn year ->
        Enum.find(
          Offlixir.holidays!(:NL, year),
          &(&1.date.month == 4 and &1.date.day in [27, 30])
        ).local_name
      end

      assert name.(2012) == "Koninginnedag"
      assert name.(2026) == "Koningsdag"
    end
  end

  describe "year conditions" do
    test "Liberation Day is a public holiday every five years from 1945 to 1985" do
      assert ~D[1980-05-05] in Offlixir.dates!(:NL, 1980)
      assert ~D[1985-05-05] in Offlixir.dates!(:NL, 1985)
      refute ~D[1986-05-05] in Offlixir.dates!(:NL, 1986)
      refute ~D[1990-05-05] in Offlixir.dates!(:NL, 1990)
      refute ~D[2025-05-05] in Offlixir.dates!(:NL, 2025)
    end
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:NL, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-04-05], "Easter Sunday"},
             {~D[2026-04-06], "Easter Monday"},
             {~D[2026-04-27], "King's Day"},
             {~D[2026-05-14], "Ascension Day"},
             {~D[2026-05-24], "Pentecost"},
             {~D[2026-05-25], "Whit Monday"},
             {~D[2026-12-25], "Christmas Day"},
             {~D[2026-12-26], "St. Stephen's Day"}
           ]
  end
end
