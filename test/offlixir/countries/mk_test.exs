defmodule Offlixir.Countries.MKTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.

  test "1967, when Easter Monday falls on Labour Day" do
    assert Offlixir.dates!(:MK, 1967) == [
             ~D[1967-01-01],
             ~D[1967-01-07],
             ~D[1967-04-28],
             ~D[1967-04-30],
             ~D[1967-05-01],
             ~D[1967-05-24],
             ~D[1967-08-02],
             ~D[1967-09-08],
             ~D[1967-10-11],
             ~D[1967-10-23],
             ~D[1967-12-08]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:MK, 1985) == [
             ~D[1985-01-01],
             ~D[1985-01-07],
             ~D[1985-04-12],
             ~D[1985-04-14],
             ~D[1985-04-15],
             ~D[1985-05-01],
             ~D[1985-05-24],
             ~D[1985-08-02],
             ~D[1985-09-08],
             ~D[1985-10-11],
             ~D[1985-10-23],
             ~D[1985-12-08]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:MK, 1998) == [
             ~D[1998-01-01],
             ~D[1998-01-07],
             ~D[1998-04-17],
             ~D[1998-04-19],
             ~D[1998-04-20],
             ~D[1998-05-01],
             ~D[1998-05-24],
             ~D[1998-08-02],
             ~D[1998-09-08],
             ~D[1998-10-11],
             ~D[1998-10-23],
             ~D[1998-12-08]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:MK, 2012) == [
             ~D[2012-01-01],
             ~D[2012-01-07],
             ~D[2012-04-13],
             ~D[2012-04-15],
             ~D[2012-04-16],
             ~D[2012-05-01],
             ~D[2012-05-24],
             ~D[2012-08-02],
             ~D[2012-09-08],
             ~D[2012-10-11],
             ~D[2012-10-23],
             ~D[2012-12-08]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:MK, 2025) == [
             ~D[2025-01-01],
             ~D[2025-01-07],
             ~D[2025-04-18],
             ~D[2025-04-20],
             ~D[2025-04-21],
             ~D[2025-05-01],
             ~D[2025-05-24],
             ~D[2025-08-02],
             ~D[2025-09-08],
             ~D[2025-10-11],
             ~D[2025-10-23],
             ~D[2025-12-08]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:MK, 2026) == [
             ~D[2026-01-01],
             ~D[2026-01-07],
             ~D[2026-04-10],
             ~D[2026-04-12],
             ~D[2026-04-13],
             ~D[2026-05-01],
             ~D[2026-05-24],
             ~D[2026-08-02],
             ~D[2026-09-08],
             ~D[2026-10-11],
             ~D[2026-10-23],
             ~D[2026-12-08]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:MK, 2027) == [
             ~D[2027-01-01],
             ~D[2027-01-07],
             ~D[2027-04-30],
             ~D[2027-05-01],
             ~D[2027-05-02],
             ~D[2027-05-03],
             ~D[2027-05-24],
             ~D[2027-08-02],
             ~D[2027-09-08],
             ~D[2027-10-11],
             ~D[2027-10-23],
             ~D[2027-12-08]
           ]
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:MK, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-01-07], "Christmas Day (Orthodox)"},
             {~D[2026-04-10], "Good Friday"},
             {~D[2026-04-12], "Easter Sunday"},
             {~D[2026-04-13], "Easter Monday"},
             {~D[2026-05-01], "Labour Day"},
             {~D[2026-05-24], "Saints Cyril and Methodius Day"},
             {~D[2026-08-02], "Day of the Republic"},
             {~D[2026-09-08], "Independence Day"},
             {~D[2026-10-11], "Revolution Day"},
             {~D[2026-10-23], "Day of the Macedonian Revolutionary Struggle"},
             {~D[2026-12-08], "Saint Clement of Ohrid Day"}
           ]
  end
end
