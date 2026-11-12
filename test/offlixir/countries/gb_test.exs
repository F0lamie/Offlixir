defmodule Offlixir.Countries.GBTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.
  #
  # The reference data of 2025 to 2027 holds calendar dates, so these tests compare
  # the calendar dates. The other tests compare the observed dates returned by dates!/2.
  #
  # Only the holidays that the reference rules do not attach to a part of the United
  # Kingdom are expected. New Year's Day is attached to the four of them.

  defp calendar_dates(year) do
    :GB |> Offlixir.holidays!(year) |> Enum.map(& &1.date) |> Enum.uniq()
  end

  test "1967" do
    assert Offlixir.dates!(:GB, 1967) == [
             ~D[1967-03-24],
             ~D[1967-05-01],
             ~D[1967-05-29],
             ~D[1967-12-25],
             ~D[1967-12-26]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:GB, 1985) == [
             ~D[1985-04-05],
             ~D[1985-05-06],
             ~D[1985-05-27],
             ~D[1985-12-25],
             ~D[1985-12-26]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:GB, 1998) == [
             ~D[1998-04-10],
             ~D[1998-05-04],
             ~D[1998-05-25],
             ~D[1998-12-25],
             ~D[1998-12-28]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:GB, 2012) == [
             ~D[2012-04-06],
             ~D[2012-05-07],
             ~D[2012-05-28],
             ~D[2012-12-25],
             ~D[2012-12-26]
           ]
  end

  test "2025" do
    assert calendar_dates(2025) == [
             ~D[2025-04-18],
             ~D[2025-05-05],
             ~D[2025-05-26],
             ~D[2025-12-25],
             ~D[2025-12-26]
           ]
  end

  test "2026" do
    assert calendar_dates(2026) == [
             ~D[2026-04-03],
             ~D[2026-05-04],
             ~D[2026-05-25],
             ~D[2026-12-25],
             ~D[2026-12-26]
           ]
  end

  test "2027" do
    assert calendar_dates(2027) == [
             ~D[2027-03-26],
             ~D[2027-05-03],
             ~D[2027-05-31],
             ~D[2027-12-25],
             ~D[2027-12-26]
           ]
  end

  test "New Year's Day is attached to the four parts of the kingdom and is not kept" do
    refute ~D[2026-01-01] in Offlixir.dates!(:GB, 2026)
  end

  describe "observed dates" do
    test "Christmas Day and Boxing Day on a week-end are observed two days later" do
      # The 25th of December 2027 is a Saturday.
      dates = Offlixir.dates!(:GB, 2027)

      assert ~D[2027-12-27] in dates
      assert ~D[2027-12-28] in dates
      refute ~D[2027-12-25] in dates
      refute ~D[2027-12-26] in dates
    end
  end

  describe "year conditions" do
    test "the Early May Bank Holiday is moved to the 8th of May in 1995 and 2020" do
      assert ~D[1995-05-08] in Offlixir.dates!(:GB, 1995)
      refute ~D[1995-05-01] in Offlixir.dates!(:GB, 1995)
      assert ~D[2020-05-08] in Offlixir.dates!(:GB, 2020)
      refute ~D[2020-05-04] in Offlixir.dates!(:GB, 2020)
    end

    test "2022 has the Platinum Jubilee and the State Funeral of the Queen" do
      dates = Offlixir.dates!(:GB, 2022)

      assert ~D[2022-06-02] in dates
      assert ~D[2022-06-03] in dates
      assert ~D[2022-09-19] in dates
      refute ~D[2022-05-30] in dates
      assert length(dates) == 7
    end

    test "2023 has the Coronation Bank Holiday" do
      dates = Offlixir.dates!(:GB, 2023)

      assert ~D[2023-05-01] in dates
      assert ~D[2023-05-08] in dates
      assert length(dates) == 6
    end
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:GB, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-04-03], "Good Friday"},
             {~D[2026-05-04], "Early May Bank Holiday"},
             {~D[2026-05-25], "Spring Bank Holiday"},
             {~D[2026-12-25], "Christmas Day"},
             {~D[2026-12-26], "St. Stephen's Day"}
           ]
  end
end
