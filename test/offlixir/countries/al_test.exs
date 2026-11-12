defmodule Offlixir.Countries.ALTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.
  #
  # The reference data of 2025 to 2027 holds calendar dates, so these tests compare
  # the calendar dates. The other tests compare the observed dates returned by dates!/2.

  defp calendar_dates(year) do
    :AL |> Offlixir.holidays!(year) |> Enum.map(& &1.date) |> Enum.uniq()
  end

  test "1967" do
    assert Offlixir.dates!(:AL, 1967) == [
             ~D[1967-01-02],
             ~D[1967-03-14],
             ~D[1967-03-22],
             ~D[1967-03-26],
             ~D[1967-03-27],
             ~D[1967-04-30],
             ~D[1967-05-01],
             ~D[1967-09-05],
             ~D[1967-11-28],
             ~D[1967-11-29],
             ~D[1967-12-08],
             ~D[1967-12-25]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:AL, 1985) == [
             ~D[1985-01-01],
             ~D[1985-01-02],
             ~D[1985-03-14],
             ~D[1985-03-22],
             ~D[1985-04-07],
             ~D[1985-04-08],
             ~D[1985-04-14],
             ~D[1985-04-15],
             ~D[1985-05-01],
             ~D[1985-09-05],
             ~D[1985-11-28],
             ~D[1985-11-29],
             ~D[1985-12-09],
             ~D[1985-12-25]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:AL, 1998) == [
             ~D[1998-01-01],
             ~D[1998-01-02],
             ~D[1998-03-16],
             ~D[1998-03-23],
             ~D[1998-04-12],
             ~D[1998-04-13],
             ~D[1998-04-19],
             ~D[1998-04-20],
             ~D[1998-05-01],
             ~D[1998-09-07],
             ~D[1998-11-30],
             ~D[1998-12-08],
             ~D[1998-12-25]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:AL, 2012) == [
             ~D[2012-01-02],
             ~D[2012-03-14],
             ~D[2012-03-22],
             ~D[2012-04-08],
             ~D[2012-04-09],
             ~D[2012-04-15],
             ~D[2012-04-16],
             ~D[2012-05-01],
             ~D[2012-09-05],
             ~D[2012-11-28],
             ~D[2012-11-29],
             ~D[2012-12-10],
             ~D[2012-12-25]
           ]
  end

  test "2025" do
    assert calendar_dates(2025) == [
             ~D[2025-01-01],
             ~D[2025-01-02],
             ~D[2025-03-14],
             ~D[2025-03-22],
             ~D[2025-04-20],
             ~D[2025-04-21],
             ~D[2025-05-01],
             ~D[2025-09-05],
             ~D[2025-11-28],
             ~D[2025-11-29],
             ~D[2025-12-08],
             ~D[2025-12-25]
           ]
  end

  test "2026" do
    assert calendar_dates(2026) == [
             ~D[2026-01-01],
             ~D[2026-01-02],
             ~D[2026-03-14],
             ~D[2026-03-22],
             ~D[2026-04-05],
             ~D[2026-04-06],
             ~D[2026-04-12],
             ~D[2026-04-13],
             ~D[2026-05-01],
             ~D[2026-09-05],
             ~D[2026-11-28],
             ~D[2026-11-29],
             ~D[2026-12-08],
             ~D[2026-12-25]
           ]
  end

  test "2027" do
    assert calendar_dates(2027) == [
             ~D[2027-01-01],
             ~D[2027-01-02],
             ~D[2027-03-14],
             ~D[2027-03-22],
             ~D[2027-03-28],
             ~D[2027-03-29],
             ~D[2027-05-01],
             ~D[2027-05-02],
             ~D[2027-05-03],
             ~D[2027-09-05],
             ~D[2027-11-28],
             ~D[2027-11-29],
             ~D[2027-12-08],
             ~D[2027-12-25]
           ]
  end

  describe "observed dates" do
    test "a holiday on a week-end is observed the following Monday" do
      # The 14th of March and the 28th of November 2026 are Saturdays.
      dates = Offlixir.dates!(:AL, 2026)

      assert ~D[2026-03-16] in dates
      refute ~D[2026-03-14] in dates
      assert ~D[2026-03-23] in dates
      refute ~D[2026-03-22] in dates
      assert ~D[2026-11-30] in dates
      refute ~D[2026-11-28] in dates
      refute ~D[2026-11-29] in dates
    end
  end

  test "Catholic and Orthodox Easter are both kept when they fall on the same day" do
    on_easter_sunday = Enum.filter(Offlixir.holidays!(:AL, 2025), &(&1.date == ~D[2025-04-20]))

    assert Enum.map(on_easter_sunday, & &1.id) == ["AL-CEASTERSUNDAY-01", "AL-OEASTERSUNDAY-01"]
    assert Enum.count(Offlixir.dates!(:AL, 2025), &(&1 == ~D[2025-04-20])) == 1
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:AL, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-01-02], "New Year's Day"},
             {~D[2026-03-14], "Summer Day"},
             {~D[2026-03-22], "Nowruz"},
             {~D[2026-04-05], "Easter Sunday"},
             {~D[2026-04-06], "Easter Monday"},
             {~D[2026-04-12], "Easter Sunday"},
             {~D[2026-04-13], "Easter Monday"},
             {~D[2026-05-01], "May Day"},
             {~D[2026-09-05], "Mother Teresa Day"},
             {~D[2026-11-28], "Independence Day"},
             {~D[2026-11-29], "Liberation Day"},
             {~D[2026-12-08], "Youth Day"},
             {~D[2026-12-25], "Christmas Day"}
           ]
  end
end
