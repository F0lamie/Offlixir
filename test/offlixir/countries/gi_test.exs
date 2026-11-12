defmodule Offlixir.Countries.GITest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.
  #
  # The reference data of 2025 to 2027 holds calendar dates, so these tests compare
  # the calendar dates. The other tests compare the observed dates returned by dates!/2.
  #
  # The reference rules of Gibraltar changed on 2026-11-02 and
  # the reference data does not follow them yet: it still gives Commonwealth Day in March,
  # the Queen's Birthday on the second Monday of June and no observed date. Every
  # list below is therefore computed by hand from the rules.

  defp calendar_dates(year) do
    :GI |> Offlixir.holidays!(year) |> Enum.map(& &1.date) |> Enum.uniq()
  end

  test "1967" do
    assert Offlixir.dates!(:GI, 1967) == [
             ~D[1967-01-02],
             ~D[1967-03-13],
             ~D[1967-03-24],
             ~D[1967-03-27],
             ~D[1967-04-28],
             ~D[1967-05-01],
             ~D[1967-05-29],
             ~D[1967-06-19],
             ~D[1967-08-28],
             ~D[1967-09-11],
             ~D[1967-12-25],
             ~D[1967-12-26]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:GI, 1985) == [
             ~D[1985-01-01],
             ~D[1985-03-11],
             ~D[1985-04-05],
             ~D[1985-04-08],
             ~D[1985-04-29],
             ~D[1985-05-01],
             ~D[1985-05-27],
             ~D[1985-06-17],
             ~D[1985-08-26],
             ~D[1985-09-10],
             ~D[1985-12-25],
             ~D[1985-12-26]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:GI, 1998) == [
             ~D[1998-01-01],
             ~D[1998-03-09],
             ~D[1998-04-10],
             ~D[1998-04-13],
             ~D[1998-04-28],
             ~D[1998-05-01],
             ~D[1998-05-25],
             ~D[1998-06-15],
             ~D[1998-08-31],
             ~D[1998-09-10],
             ~D[1998-12-25],
             ~D[1998-12-28]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:GI, 2012) == [
             ~D[2012-01-02],
             ~D[2012-03-12],
             ~D[2012-04-06],
             ~D[2012-04-09],
             ~D[2012-04-30],
             ~D[2012-05-01],
             ~D[2012-05-28],
             ~D[2012-06-18],
             ~D[2012-08-27],
             ~D[2012-09-10],
             ~D[2012-12-25],
             ~D[2012-12-26]
           ]
  end

  test "2025" do
    assert calendar_dates(2025) == [
             ~D[2025-01-01],
             ~D[2025-02-17],
             ~D[2025-04-18],
             ~D[2025-04-21],
             ~D[2025-04-28],
             ~D[2025-05-01],
             ~D[2025-05-26],
             ~D[2025-06-16],
             ~D[2025-08-25],
             ~D[2025-09-10],
             ~D[2025-12-25],
             ~D[2025-12-26]
           ]
  end

  test "2026" do
    assert calendar_dates(2026) == [
             ~D[2026-01-01],
             ~D[2026-02-16],
             ~D[2026-04-03],
             ~D[2026-04-06],
             ~D[2026-04-28],
             ~D[2026-05-01],
             ~D[2026-05-25],
             ~D[2026-06-15],
             ~D[2026-08-31],
             ~D[2026-09-10],
             ~D[2026-12-25],
             ~D[2026-12-26]
           ]
  end

  test "2027" do
    assert calendar_dates(2027) == [
             ~D[2027-01-01],
             ~D[2027-02-15],
             ~D[2027-03-26],
             ~D[2027-03-29],
             ~D[2027-04-28],
             ~D[2027-05-01],
             ~D[2027-05-31],
             ~D[2027-06-21],
             ~D[2027-08-30],
             ~D[2027-09-10],
             ~D[2027-12-25],
             ~D[2027-12-26]
           ]
  end

  describe "observed dates" do
    test "Boxing Day moves to Tuesday when Christmas Day is observed on Monday" do
      # The 25th of December 2022 is a Sunday.
      dates = Offlixir.dates!(:GI, 2022)

      refute ~D[2022-12-25] in dates
      assert ~D[2022-12-26] in dates
      assert ~D[2022-12-27] in dates
    end
  end

  describe "year conditions" do
    test "Commonwealth Day is replaced by the Winter Midterm Bank Holiday in 2022" do
      assert ~D[2020-03-09] in Offlixir.dates!(:GI, 2020)
      assert ~D[2021-02-15] in Offlixir.dates!(:GI, 2021)
      assert ~D[2022-02-21] in Offlixir.dates!(:GI, 2022)
      refute ~D[2022-03-14] in Offlixir.dates!(:GI, 2022)
    end

    test "the Winter Midterm Bank Holiday is the second Monday of February in 2024" do
      assert ~D[2024-02-12] in Offlixir.dates!(:GI, 2024)
      refute ~D[2024-02-19] in Offlixir.dates!(:GI, 2024)
    end

    test "the birthday of the monarch is the second Monday of June in 2021 and 2022" do
      assert ~D[2020-06-15] in Offlixir.dates!(:GI, 2020)
      assert ~D[2021-06-14] in Offlixir.dates!(:GI, 2021)
      assert ~D[2022-06-13] in Offlixir.dates!(:GI, 2022)
      assert ~D[2023-06-19] in Offlixir.dates!(:GI, 2023)
    end

    test "one-off holidays of 2020, 2022 and 2023" do
      assert ~D[2020-05-08] in Offlixir.dates!(:GI, 2020)
      assert ~D[2022-06-02] in Offlixir.dates!(:GI, 2022)
      assert ~D[2022-06-03] in Offlixir.dates!(:GI, 2022)
      refute ~D[2022-05-30] in Offlixir.dates!(:GI, 2022)
      assert ~D[2023-05-08] in Offlixir.dates!(:GI, 2023)
    end
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:GI, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-02-16], "Winter Midterm Bank Holiday"},
             {~D[2026-04-03], "Good Friday"},
             {~D[2026-04-06], "Easter Monday"},
             {~D[2026-04-28], "Workers' Memorial Day"},
             {~D[2026-05-01], "May Day"},
             {~D[2026-05-25], "Spring Bank Holiday"},
             {~D[2026-06-15], "King's Birthday"},
             {~D[2026-08-31], "Late Summer Bank Holiday"},
             {~D[2026-09-10], "Gibraltar National Day"},
             {~D[2026-12-25], "Christmas Day"},
             {~D[2026-12-26], "Boxing Day"}
           ]
  end
end
