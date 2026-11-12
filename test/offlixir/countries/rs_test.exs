defmodule Offlixir.Countries.RSTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.
  #
  # The reference data of 2025 to 2027 holds calendar dates, so these tests compare
  # the calendar dates. The other tests compare the observed dates returned by dates!/2.

  defp calendar_dates(year) do
    :RS |> Offlixir.holidays!(year) |> Enum.map(& &1.date) |> Enum.uniq()
  end

  test "1967" do
    assert Offlixir.dates!(:RS, 1967) == [
             ~D[1967-01-02],
             ~D[1967-01-03],
             ~D[1967-01-07],
             ~D[1967-02-15],
             ~D[1967-02-16],
             ~D[1967-04-28],
             ~D[1967-04-30],
             ~D[1967-05-01],
             ~D[1967-05-02],
             ~D[1967-11-11]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:RS, 1985) == [
             ~D[1985-01-01],
             ~D[1985-01-02],
             ~D[1985-01-07],
             ~D[1985-02-15],
             ~D[1985-02-16],
             ~D[1985-04-12],
             ~D[1985-04-14],
             ~D[1985-04-15],
             ~D[1985-05-01],
             ~D[1985-05-02],
             ~D[1985-11-11]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:RS, 1998) == [
             ~D[1998-01-01],
             ~D[1998-01-02],
             ~D[1998-01-07],
             ~D[1998-02-16],
             ~D[1998-02-17],
             ~D[1998-04-17],
             ~D[1998-04-19],
             ~D[1998-04-20],
             ~D[1998-05-01],
             ~D[1998-05-02],
             ~D[1998-11-11]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:RS, 2012) == [
             ~D[2012-01-02],
             ~D[2012-01-03],
             ~D[2012-01-07],
             ~D[2012-02-15],
             ~D[2012-02-16],
             ~D[2012-04-13],
             ~D[2012-04-15],
             ~D[2012-04-16],
             ~D[2012-05-01],
             ~D[2012-05-02],
             ~D[2012-11-11]
           ]
  end

  test "2025" do
    assert calendar_dates(2025) == [
             ~D[2025-01-01],
             ~D[2025-01-02],
             ~D[2025-01-07],
             ~D[2025-02-15],
             ~D[2025-02-16],
             ~D[2025-04-18],
             ~D[2025-04-20],
             ~D[2025-04-21],
             ~D[2025-05-01],
             ~D[2025-05-02],
             ~D[2025-11-11]
           ]
  end

  test "2026" do
    assert calendar_dates(2026) == [
             ~D[2026-01-01],
             ~D[2026-01-02],
             ~D[2026-01-07],
             ~D[2026-02-15],
             ~D[2026-02-16],
             ~D[2026-04-10],
             ~D[2026-04-12],
             ~D[2026-04-13],
             ~D[2026-05-01],
             ~D[2026-05-02],
             ~D[2026-11-11]
           ]
  end

  test "2027" do
    assert calendar_dates(2027) == [
             ~D[2027-01-01],
             ~D[2027-01-02],
             ~D[2027-01-07],
             ~D[2027-02-15],
             ~D[2027-02-16],
             ~D[2027-04-30],
             ~D[2027-05-01],
             ~D[2027-05-02],
             ~D[2027-05-03],
             ~D[2027-11-11]
           ]
  end

  describe "observed dates" do
    test "a two day holiday that starts on a Sunday is observed on Monday and Tuesday" do
      # The 15th of February 2026 is a Sunday.
      observed = Map.new(Offlixir.holidays!(:RS, 2026), &{&1.id, &1.observed_date})

      assert observed["RS-STATEHOODDAY-01"] == ~D[2026-02-16]
      assert observed["RS-STATEHOODDAY-02"] == ~D[2026-02-17]
      refute ~D[2026-02-15] in Offlixir.dates!(:RS, 2026)
    end

    test "a holiday on a Saturday is not moved" do
      # The 2nd of May 2026 is a Saturday.
      assert ~D[2026-05-02] in Offlixir.dates!(:RS, 2026)
    end
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:RS, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-01-02], "New Year's Day"},
             {~D[2026-01-07], "Christmas Day"},
             {~D[2026-02-15], "Statehood Day"},
             {~D[2026-02-16], "Statehood Day"},
             {~D[2026-04-10], "Good Friday"},
             {~D[2026-04-12], "Easter Sunday"},
             {~D[2026-04-13], "Easter Monday"},
             {~D[2026-05-01], "Labour Day"},
             {~D[2026-05-02], "Labour Day"},
             {~D[2026-11-11], "Armistice Day"}
           ]
  end
end
