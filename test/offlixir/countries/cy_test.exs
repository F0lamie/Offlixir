defmodule Offlixir.Countries.CYTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.

  test "1967, when Easter Monday falls on Labour Day" do
    assert Offlixir.dates!(:CY, 1967) == [
             ~D[1967-01-01],
             ~D[1967-01-06],
             ~D[1967-03-13],
             ~D[1967-03-25],
             ~D[1967-04-01],
             ~D[1967-04-28],
             ~D[1967-05-01],
             ~D[1967-06-18],
             ~D[1967-06-19],
             ~D[1967-08-15],
             ~D[1967-10-01],
             ~D[1967-10-28],
             ~D[1967-12-24],
             ~D[1967-12-25],
             ~D[1967-12-26]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:CY, 1985) == [
             ~D[1985-01-01],
             ~D[1985-01-06],
             ~D[1985-02-25],
             ~D[1985-03-25],
             ~D[1985-04-01],
             ~D[1985-04-12],
             ~D[1985-04-15],
             ~D[1985-05-01],
             ~D[1985-06-02],
             ~D[1985-06-03],
             ~D[1985-08-15],
             ~D[1985-10-01],
             ~D[1985-10-28],
             ~D[1985-12-24],
             ~D[1985-12-25],
             ~D[1985-12-26]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:CY, 1998) == [
             ~D[1998-01-01],
             ~D[1998-01-06],
             ~D[1998-03-02],
             ~D[1998-03-25],
             ~D[1998-04-01],
             ~D[1998-04-17],
             ~D[1998-04-20],
             ~D[1998-05-01],
             ~D[1998-06-07],
             ~D[1998-06-08],
             ~D[1998-08-15],
             ~D[1998-10-01],
             ~D[1998-10-28],
             ~D[1998-12-24],
             ~D[1998-12-25],
             ~D[1998-12-26]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:CY, 2012) == [
             ~D[2012-01-01],
             ~D[2012-01-06],
             ~D[2012-02-27],
             ~D[2012-03-25],
             ~D[2012-04-01],
             ~D[2012-04-13],
             ~D[2012-04-16],
             ~D[2012-05-01],
             ~D[2012-06-03],
             ~D[2012-06-04],
             ~D[2012-08-15],
             ~D[2012-10-01],
             ~D[2012-10-28],
             ~D[2012-12-24],
             ~D[2012-12-25],
             ~D[2012-12-26]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:CY, 2025) == [
             ~D[2025-01-01],
             ~D[2025-01-06],
             ~D[2025-03-03],
             ~D[2025-03-25],
             ~D[2025-04-01],
             ~D[2025-04-18],
             ~D[2025-04-21],
             ~D[2025-05-01],
             ~D[2025-06-08],
             ~D[2025-06-09],
             ~D[2025-08-15],
             ~D[2025-10-01],
             ~D[2025-10-28],
             ~D[2025-12-24],
             ~D[2025-12-25],
             ~D[2025-12-26]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:CY, 2026) == [
             ~D[2026-01-01],
             ~D[2026-01-06],
             ~D[2026-02-23],
             ~D[2026-03-25],
             ~D[2026-04-01],
             ~D[2026-04-10],
             ~D[2026-04-13],
             ~D[2026-05-01],
             ~D[2026-05-31],
             ~D[2026-06-01],
             ~D[2026-08-15],
             ~D[2026-10-01],
             ~D[2026-10-28],
             ~D[2026-12-24],
             ~D[2026-12-25],
             ~D[2026-12-26]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:CY, 2027) == [
             ~D[2027-01-01],
             ~D[2027-01-06],
             ~D[2027-03-15],
             ~D[2027-03-25],
             ~D[2027-04-01],
             ~D[2027-04-30],
             ~D[2027-05-01],
             ~D[2027-05-03],
             ~D[2027-06-20],
             ~D[2027-06-21],
             ~D[2027-08-15],
             ~D[2027-10-01],
             ~D[2027-10-28],
             ~D[2027-12-24],
             ~D[2027-12-25],
             ~D[2027-12-26]
           ]
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:CY, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-01-06], "Epiphany"},
             {~D[2026-02-23], "Green Monday"},
             {~D[2026-03-25], "Greek Independence Day"},
             {~D[2026-04-01], "Cyprus National Day"},
             {~D[2026-04-10], "Good Friday"},
             {~D[2026-04-13], "Easter Monday"},
             {~D[2026-05-01], "Labour Day"},
             {~D[2026-05-31], "Pentecost"},
             {~D[2026-06-01], "Whit Monday"},
             {~D[2026-08-15], "Assumption of the Virgin Mary"},
             {~D[2026-10-01], "Cyprus Independence Day"},
             {~D[2026-10-28], "Ohi Day"},
             {~D[2026-12-24], "Christmas Eve"},
             {~D[2026-12-25], "Christmas Day"},
             {~D[2026-12-26], "St. Stephen's Day"}
           ]
  end
end
