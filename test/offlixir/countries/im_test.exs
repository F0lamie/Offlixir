defmodule Offlixir.Countries.IMTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.
  #
  # The reference data of 2025 to 2027 holds calendar dates, so these tests compare
  # the calendar dates. The other tests compare the observed dates returned by dates!/2.

  defp calendar_dates(year) do
    :IM |> Offlixir.holidays!(year) |> Enum.map(& &1.date) |> Enum.uniq()
  end

  test "1967" do
    assert Offlixir.dates!(:IM, 1967) == [
             ~D[1967-01-02],
             ~D[1967-03-24],
             ~D[1967-03-27],
             ~D[1967-05-01],
             ~D[1967-05-29],
             ~D[1967-06-09],
             ~D[1967-07-05],
             ~D[1967-08-28],
             ~D[1967-12-25],
             ~D[1967-12-26]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:IM, 1985) == [
             ~D[1985-01-01],
             ~D[1985-04-05],
             ~D[1985-04-08],
             ~D[1985-05-06],
             ~D[1985-05-27],
             ~D[1985-06-07],
             ~D[1985-07-05],
             ~D[1985-08-26],
             ~D[1985-12-25],
             ~D[1985-12-26]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:IM, 1998) == [
             ~D[1998-01-01],
             ~D[1998-04-10],
             ~D[1998-04-13],
             ~D[1998-05-04],
             ~D[1998-05-25],
             ~D[1998-06-12],
             ~D[1998-07-06],
             ~D[1998-08-31],
             ~D[1998-12-25],
             ~D[1998-12-28]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:IM, 2012) == [
             ~D[2012-01-02],
             ~D[2012-04-06],
             ~D[2012-04-09],
             ~D[2012-05-07],
             ~D[2012-05-28],
             ~D[2012-06-08],
             ~D[2012-07-05],
             ~D[2012-08-27],
             ~D[2012-12-25],
             ~D[2012-12-26]
           ]
  end

  test "2025" do
    assert calendar_dates(2025) == [
             ~D[2025-01-01],
             ~D[2025-04-18],
             ~D[2025-04-21],
             ~D[2025-05-05],
             ~D[2025-05-26],
             ~D[2025-06-13],
             ~D[2025-07-05],
             ~D[2025-08-25],
             ~D[2025-12-25],
             ~D[2025-12-26]
           ]
  end

  test "2026" do
    assert calendar_dates(2026) == [
             ~D[2026-01-01],
             ~D[2026-04-03],
             ~D[2026-04-06],
             ~D[2026-05-04],
             ~D[2026-05-25],
             ~D[2026-06-12],
             ~D[2026-07-05],
             ~D[2026-08-31],
             ~D[2026-12-25],
             ~D[2026-12-26]
           ]
  end

  test "2027" do
    assert calendar_dates(2027) == [
             ~D[2027-01-01],
             ~D[2027-03-26],
             ~D[2027-03-29],
             ~D[2027-05-03],
             ~D[2027-05-31],
             ~D[2027-06-11],
             ~D[2027-07-05],
             ~D[2027-08-30],
             ~D[2027-12-25],
             ~D[2027-12-26]
           ]
  end

  describe "observed dates" do
    test "Tynwald Day on a Sunday is observed on Monday" do
      # The 5th of July 2026 is a Sunday.
      assert ~D[2026-07-06] in Offlixir.dates!(:IM, 2026)
      refute ~D[2026-07-05] in Offlixir.dates!(:IM, 2026)
    end

    test "Christmas Day and Boxing Day on a week-end are observed two days later" do
      # The 25th of December 2027 is a Saturday.
      assert ~D[2027-12-27] in Offlixir.dates!(:IM, 2027)
      assert ~D[2027-12-28] in Offlixir.dates!(:IM, 2027)
    end
  end

  describe "year conditions" do
    test "Senior Race Day is the Friday after the first Saturday of June" do
      assert ~D[2026-06-12] in Offlixir.dates!(:IM, 2026)
    end

    test "2020 moves the Early May Bank Holiday and Senior Race Day" do
      dates = Offlixir.dates!(:IM, 2020)

      assert ~D[2020-05-08] in dates
      refute ~D[2020-05-04] in dates
      assert ~D[2020-08-28] in dates
      refute ~D[2020-06-12] in dates
    end

    test "one-off holidays of 2022 and 2023" do
      assert ~D[2022-06-02] in Offlixir.dates!(:IM, 2022)
      assert ~D[2022-06-03] in Offlixir.dates!(:IM, 2022)
      assert ~D[2022-09-19] in Offlixir.dates!(:IM, 2022)
      assert ~D[2023-05-08] in Offlixir.dates!(:IM, 2023)
    end
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:IM, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-04-03], "Good Friday"},
             {~D[2026-04-06], "Easter Monday"},
             {~D[2026-05-04], "Early May Bank Holiday"},
             {~D[2026-05-25], "Spring Bank Holiday"},
             {~D[2026-06-12], "Senior Race Day"},
             {~D[2026-07-05], "Tynwald Day"},
             {~D[2026-08-31], "Late Summer Bank Holiday"},
             {~D[2026-12-25], "Christmas Day"},
             {~D[2026-12-26], "Boxing Day"}
           ]
  end
end
