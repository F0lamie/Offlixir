defmodule Offlixir.Countries.IETest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.

  test "1967" do
    assert Offlixir.dates!(:IE, 1967) == [
             ~D[1967-01-01],
             ~D[1967-03-17],
             ~D[1967-03-27],
             ~D[1967-05-01],
             ~D[1967-06-05],
             ~D[1967-08-07],
             ~D[1967-10-30],
             ~D[1967-12-25],
             ~D[1967-12-26]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:IE, 1985) == [
             ~D[1985-01-01],
             ~D[1985-03-17],
             ~D[1985-04-08],
             ~D[1985-05-06],
             ~D[1985-06-03],
             ~D[1985-08-05],
             ~D[1985-10-28],
             ~D[1985-12-25],
             ~D[1985-12-26]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:IE, 1998) == [
             ~D[1998-01-01],
             ~D[1998-03-17],
             ~D[1998-04-13],
             ~D[1998-05-04],
             ~D[1998-06-01],
             ~D[1998-08-03],
             ~D[1998-10-26],
             ~D[1998-12-25],
             ~D[1998-12-26]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:IE, 2012) == [
             ~D[2012-01-01],
             ~D[2012-03-17],
             ~D[2012-04-09],
             ~D[2012-05-07],
             ~D[2012-06-04],
             ~D[2012-08-06],
             ~D[2012-10-29],
             ~D[2012-12-25],
             ~D[2012-12-26]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:IE, 2025) == [
             ~D[2025-01-01],
             ~D[2025-02-03],
             ~D[2025-03-17],
             ~D[2025-04-21],
             ~D[2025-05-05],
             ~D[2025-06-02],
             ~D[2025-08-04],
             ~D[2025-10-27],
             ~D[2025-12-25],
             ~D[2025-12-26]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:IE, 2026) == [
             ~D[2026-01-01],
             ~D[2026-02-02],
             ~D[2026-03-17],
             ~D[2026-04-06],
             ~D[2026-05-04],
             ~D[2026-06-01],
             ~D[2026-08-03],
             ~D[2026-10-26],
             ~D[2026-12-25],
             ~D[2026-12-26]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:IE, 2027) == [
             ~D[2027-01-01],
             ~D[2027-02-01],
             ~D[2027-03-17],
             ~D[2027-03-29],
             ~D[2027-05-03],
             ~D[2027-06-07],
             ~D[2027-08-02],
             ~D[2027-10-25],
             ~D[2027-12-25],
             ~D[2027-12-26]
           ]
  end

  describe "year conditions" do
    test "Saint Brigid's Day starts in 2023, on the first Monday of February" do
      refute ~D[2022-02-07] in Offlixir.dates!(:IE, 2022)
      assert ~D[2023-02-06] in Offlixir.dates!(:IE, 2023)
    end

    test "Saint Brigid's Day is the 1st of February when it is a Friday" do
      assert ~D[2030-02-01] in Offlixir.dates!(:IE, 2030)
      refute ~D[2030-02-04] in Offlixir.dates!(:IE, 2030)
    end
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:IE, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-02-02], "Saint Brigid's Day"},
             {~D[2026-03-17], "Saint Patrick's Day"},
             {~D[2026-04-06], "Easter Monday"},
             {~D[2026-05-04], "May Day"},
             {~D[2026-06-01], "June Holiday"},
             {~D[2026-08-03], "August Holiday"},
             {~D[2026-10-26], "October Holiday"},
             {~D[2026-12-25], "Christmas Day"},
             {~D[2026-12-26], "St. Stephen's Day"}
           ]
  end
end
