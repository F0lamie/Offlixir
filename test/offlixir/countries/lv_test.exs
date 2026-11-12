defmodule Offlixir.Countries.LVTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.
  #
  # The reference data of 2025 to 2027 holds calendar dates, so these tests compare
  # the calendar dates. The other tests compare the observed dates returned by dates!/2.
  #
  # The 1st of May carries two holidays and appears once.

  defp calendar_dates(year) do
    :LV |> Offlixir.holidays!(year) |> Enum.map(& &1.date) |> Enum.uniq()
  end

  test "1967, when Mother's Day falls on Pentecost" do
    assert Offlixir.dates!(:LV, 1967) == [
             ~D[1967-01-01],
             ~D[1967-03-24],
             ~D[1967-03-26],
             ~D[1967-03-27],
             ~D[1967-05-01],
             ~D[1967-05-04],
             ~D[1967-05-14],
             ~D[1967-06-23],
             ~D[1967-06-24],
             ~D[1967-11-20],
             ~D[1967-12-24],
             ~D[1967-12-25],
             ~D[1967-12-26],
             ~D[1967-12-31]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:LV, 1985) == [
             ~D[1985-01-01],
             ~D[1985-04-05],
             ~D[1985-04-07],
             ~D[1985-04-08],
             ~D[1985-05-01],
             ~D[1985-05-06],
             ~D[1985-05-12],
             ~D[1985-05-26],
             ~D[1985-06-23],
             ~D[1985-06-24],
             ~D[1985-11-18],
             ~D[1985-12-24],
             ~D[1985-12-25],
             ~D[1985-12-26],
             ~D[1985-12-31]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:LV, 1998) == [
             ~D[1998-01-01],
             ~D[1998-04-10],
             ~D[1998-04-12],
             ~D[1998-04-13],
             ~D[1998-05-01],
             ~D[1998-05-04],
             ~D[1998-05-10],
             ~D[1998-05-31],
             ~D[1998-06-23],
             ~D[1998-06-24],
             ~D[1998-11-18],
             ~D[1998-12-24],
             ~D[1998-12-25],
             ~D[1998-12-26],
             ~D[1998-12-31]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:LV, 2012) == [
             ~D[2012-01-01],
             ~D[2012-04-06],
             ~D[2012-04-08],
             ~D[2012-04-09],
             ~D[2012-05-01],
             ~D[2012-05-04],
             ~D[2012-05-13],
             ~D[2012-05-27],
             ~D[2012-06-23],
             ~D[2012-06-24],
             ~D[2012-11-19],
             ~D[2012-12-24],
             ~D[2012-12-25],
             ~D[2012-12-26],
             ~D[2012-12-31]
           ]
  end

  test "2025" do
    assert calendar_dates(2025) == [
             ~D[2025-01-01],
             ~D[2025-04-18],
             ~D[2025-04-20],
             ~D[2025-04-21],
             ~D[2025-05-01],
             ~D[2025-05-04],
             ~D[2025-05-11],
             ~D[2025-06-08],
             ~D[2025-06-23],
             ~D[2025-06-24],
             ~D[2025-11-18],
             ~D[2025-12-24],
             ~D[2025-12-25],
             ~D[2025-12-26],
             ~D[2025-12-31]
           ]
  end

  test "2026" do
    assert calendar_dates(2026) == [
             ~D[2026-01-01],
             ~D[2026-04-03],
             ~D[2026-04-05],
             ~D[2026-04-06],
             ~D[2026-05-01],
             ~D[2026-05-04],
             ~D[2026-05-10],
             ~D[2026-05-24],
             ~D[2026-06-23],
             ~D[2026-06-24],
             ~D[2026-11-18],
             ~D[2026-12-24],
             ~D[2026-12-25],
             ~D[2026-12-26],
             ~D[2026-12-31]
           ]
  end

  test "2027" do
    assert calendar_dates(2027) == [
             ~D[2027-01-01],
             ~D[2027-03-26],
             ~D[2027-03-28],
             ~D[2027-03-29],
             ~D[2027-05-01],
             ~D[2027-05-04],
             ~D[2027-05-09],
             ~D[2027-05-16],
             ~D[2027-06-23],
             ~D[2027-06-24],
             ~D[2027-11-18],
             ~D[2027-12-24],
             ~D[2027-12-25],
             ~D[2027-12-26],
             ~D[2027-12-31]
           ]
  end

  describe "observed dates" do
    test "the Restoration of Independence on a Sunday is observed on Monday" do
      # The 4th of May 2025 is a Sunday.
      dates = Offlixir.dates!(:LV, 2025)

      assert ~D[2025-05-05] in dates
      refute ~D[2025-05-04] in dates
    end
  end

  describe "year conditions" do
    test "the Song and Dance Celebration is a holiday in 2018, 2023 and 2028" do
      # Its final day is a Sunday each time, observed on the Monday.
      assert ~D[2018-07-09] in Offlixir.dates!(:LV, 2018)
      assert ~D[2023-07-10] in Offlixir.dates!(:LV, 2023)
      assert ~D[2028-07-10] in Offlixir.dates!(:LV, 2028)
      refute ~D[2019-07-08] in Offlixir.dates!(:LV, 2019)
    end

    test "the visit of Pope Francis is a holiday in 2018 only" do
      assert ~D[2018-09-24] in Offlixir.dates!(:LV, 2018)
      refute ~D[2019-09-24] in Offlixir.dates!(:LV, 2019)
    end

    test "the ice hockey bronze medal is a holiday in 2023 only" do
      assert ~D[2023-05-29] in Offlixir.dates!(:LV, 2023)
      refute ~D[2024-05-29] in Offlixir.dates!(:LV, 2024)
    end
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:LV, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-04-03], "Good Friday"},
             {~D[2026-04-05], "Easter Sunday"},
             {~D[2026-04-06], "Easter Monday"},
             {~D[2026-05-01], "Labour Day"},
             {~D[2026-05-01],
              "Day of the Convocation of the Constitutional Assembly of the Republic of Latvia"},
             {~D[2026-05-04], "Day of the Restoration of Independence of the Republic of Latvia"},
             {~D[2026-05-10], "Mother's Day"},
             {~D[2026-05-24], "Pentecost"},
             {~D[2026-06-23], "Līgo Day"},
             {~D[2026-06-24], "Jāņi Day"},
             {~D[2026-11-18], "Day of the Proclamation of the Republic of Latvia"},
             {~D[2026-12-24], "Christmas Eve"},
             {~D[2026-12-25], "Christmas Day"},
             {~D[2026-12-26], "Second day of Christmas"},
             {~D[2026-12-31], "New Year's Eve"}
           ]
  end
end
