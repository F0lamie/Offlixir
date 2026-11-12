defmodule Offlixir.Countries.LTTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.

  test "1967" do
    assert Offlixir.dates!(:LT, 1967) == [
             ~D[1967-01-01],
             ~D[1967-02-16],
             ~D[1967-03-11],
             ~D[1967-03-26],
             ~D[1967-03-27],
             ~D[1967-05-01],
             ~D[1967-06-24],
             ~D[1967-07-06],
             ~D[1967-08-15],
             ~D[1967-11-01],
             ~D[1967-11-02],
             ~D[1967-12-24],
             ~D[1967-12-25],
             ~D[1967-12-26]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:LT, 1985) == [
             ~D[1985-01-01],
             ~D[1985-02-16],
             ~D[1985-03-11],
             ~D[1985-04-07],
             ~D[1985-04-08],
             ~D[1985-05-01],
             ~D[1985-06-24],
             ~D[1985-07-06],
             ~D[1985-08-15],
             ~D[1985-11-01],
             ~D[1985-11-02],
             ~D[1985-12-24],
             ~D[1985-12-25],
             ~D[1985-12-26]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:LT, 1998) == [
             ~D[1998-01-01],
             ~D[1998-02-16],
             ~D[1998-03-11],
             ~D[1998-04-12],
             ~D[1998-04-13],
             ~D[1998-05-01],
             ~D[1998-06-24],
             ~D[1998-07-06],
             ~D[1998-08-15],
             ~D[1998-11-01],
             ~D[1998-11-02],
             ~D[1998-12-24],
             ~D[1998-12-25],
             ~D[1998-12-26]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:LT, 2012) == [
             ~D[2012-01-01],
             ~D[2012-02-16],
             ~D[2012-03-11],
             ~D[2012-04-08],
             ~D[2012-04-09],
             ~D[2012-05-01],
             ~D[2012-06-24],
             ~D[2012-07-06],
             ~D[2012-08-15],
             ~D[2012-11-01],
             ~D[2012-11-02],
             ~D[2012-12-24],
             ~D[2012-12-25],
             ~D[2012-12-26]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:LT, 2025) == [
             ~D[2025-01-01],
             ~D[2025-02-16],
             ~D[2025-03-11],
             ~D[2025-04-20],
             ~D[2025-04-21],
             ~D[2025-05-01],
             ~D[2025-06-24],
             ~D[2025-07-06],
             ~D[2025-08-15],
             ~D[2025-11-01],
             ~D[2025-11-02],
             ~D[2025-12-24],
             ~D[2025-12-25],
             ~D[2025-12-26]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:LT, 2026) == [
             ~D[2026-01-01],
             ~D[2026-02-16],
             ~D[2026-03-11],
             ~D[2026-04-05],
             ~D[2026-04-06],
             ~D[2026-05-01],
             ~D[2026-06-24],
             ~D[2026-07-06],
             ~D[2026-08-15],
             ~D[2026-11-01],
             ~D[2026-11-02],
             ~D[2026-12-24],
             ~D[2026-12-25],
             ~D[2026-12-26]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:LT, 2027) == [
             ~D[2027-01-01],
             ~D[2027-02-16],
             ~D[2027-03-11],
             ~D[2027-03-28],
             ~D[2027-03-29],
             ~D[2027-05-01],
             ~D[2027-06-24],
             ~D[2027-07-06],
             ~D[2027-08-15],
             ~D[2027-11-01],
             ~D[2027-11-02],
             ~D[2027-12-24],
             ~D[2027-12-25],
             ~D[2027-12-26]
           ]
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:LT, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-02-16], "The Day of Restoration of the State of Lithuania"},
             {~D[2026-03-11], "Day of Restoration of Independence of Lithuania"},
             {~D[2026-04-05], "Easter Sunday"},
             {~D[2026-04-06], "Easter Monday"},
             {~D[2026-05-01], "International Working Day"},
             {~D[2026-06-24], "St. John's Day"},
             {~D[2026-07-06], "Statehood Day"},
             {~D[2026-08-15], "Assumption Day"},
             {~D[2026-11-01], "All Saints' Day"},
             {~D[2026-11-02], "All Souls' Day"},
             {~D[2026-12-24], "Christmas Eve"},
             {~D[2026-12-25], "Christmas Day"},
             {~D[2026-12-26], "St. Stephen's Day"}
           ]
  end
end
