defmodule Offlixir.Countries.ROTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.

  test "1967, when Easter Monday falls on Labour Day" do
    assert Offlixir.dates!(:RO, 1967) == [
             ~D[1967-01-01],
             ~D[1967-01-02],
             ~D[1967-01-24],
             ~D[1967-04-30],
             ~D[1967-05-01],
             ~D[1967-06-01],
             ~D[1967-06-18],
             ~D[1967-06-19],
             ~D[1967-08-15],
             ~D[1967-11-30],
             ~D[1967-12-01],
             ~D[1967-12-25],
             ~D[1967-12-26]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:RO, 1985) == [
             ~D[1985-01-01],
             ~D[1985-01-02],
             ~D[1985-01-24],
             ~D[1985-04-14],
             ~D[1985-04-15],
             ~D[1985-05-01],
             ~D[1985-06-01],
             ~D[1985-06-02],
             ~D[1985-06-03],
             ~D[1985-08-15],
             ~D[1985-11-30],
             ~D[1985-12-01],
             ~D[1985-12-25],
             ~D[1985-12-26]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:RO, 1998) == [
             ~D[1998-01-01],
             ~D[1998-01-02],
             ~D[1998-01-24],
             ~D[1998-04-19],
             ~D[1998-04-20],
             ~D[1998-05-01],
             ~D[1998-06-01],
             ~D[1998-06-07],
             ~D[1998-06-08],
             ~D[1998-08-15],
             ~D[1998-11-30],
             ~D[1998-12-01],
             ~D[1998-12-25],
             ~D[1998-12-26]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:RO, 2012) == [
             ~D[2012-01-01],
             ~D[2012-01-02],
             ~D[2012-01-24],
             ~D[2012-04-15],
             ~D[2012-04-16],
             ~D[2012-05-01],
             ~D[2012-06-01],
             ~D[2012-06-03],
             ~D[2012-06-04],
             ~D[2012-08-15],
             ~D[2012-11-30],
             ~D[2012-12-01],
             ~D[2012-12-25],
             ~D[2012-12-26]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:RO, 2025) == [
             ~D[2025-01-01],
             ~D[2025-01-02],
             ~D[2025-01-06],
             ~D[2025-01-07],
             ~D[2025-01-24],
             ~D[2025-04-18],
             ~D[2025-04-20],
             ~D[2025-04-21],
             ~D[2025-05-01],
             ~D[2025-06-01],
             ~D[2025-06-08],
             ~D[2025-06-09],
             ~D[2025-08-15],
             ~D[2025-11-30],
             ~D[2025-12-01],
             ~D[2025-12-25],
             ~D[2025-12-26]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:RO, 2026) == [
             ~D[2026-01-01],
             ~D[2026-01-02],
             ~D[2026-01-06],
             ~D[2026-01-07],
             ~D[2026-01-24],
             ~D[2026-04-10],
             ~D[2026-04-12],
             ~D[2026-04-13],
             ~D[2026-05-01],
             ~D[2026-05-31],
             ~D[2026-06-01],
             ~D[2026-08-15],
             ~D[2026-11-30],
             ~D[2026-12-01],
             ~D[2026-12-25],
             ~D[2026-12-26]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:RO, 2027) == [
             ~D[2027-01-01],
             ~D[2027-01-02],
             ~D[2027-01-06],
             ~D[2027-01-07],
             ~D[2027-01-24],
             ~D[2027-04-30],
             ~D[2027-05-01],
             ~D[2027-05-02],
             ~D[2027-05-03],
             ~D[2027-06-01],
             ~D[2027-06-20],
             ~D[2027-06-21],
             ~D[2027-08-15],
             ~D[2027-11-30],
             ~D[2027-12-01],
             ~D[2027-12-25],
             ~D[2027-12-26]
           ]
  end

  describe "year conditions" do
    test "Good Friday starts in 2018" do
      refute ~D[2017-04-14] in Offlixir.dates!(:RO, 2017)
      assert ~D[2018-04-06] in Offlixir.dates!(:RO, 2018)
    end

    test "Epiphany and Saint John the Baptist start in 2024" do
      refute ~D[2023-01-06] in Offlixir.dates!(:RO, 2023)
      refute ~D[2023-01-07] in Offlixir.dates!(:RO, 2023)
      assert ~D[2024-01-06] in Offlixir.dates!(:RO, 2024)
      assert ~D[2024-01-07] in Offlixir.dates!(:RO, 2024)
    end
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:RO, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-01-02], "Day after New Year's Day"},
             {~D[2026-01-06], "Epiphany"},
             {~D[2026-01-07], "Saint John the Baptist"},
             {~D[2026-01-24], "Union Day/Small Union"},
             {~D[2026-04-10], "Good Friday"},
             {~D[2026-04-12], "Easter Sunday"},
             {~D[2026-04-13], "Easter Monday"},
             {~D[2026-05-01], "Labour Day"},
             {~D[2026-05-31], "Pentecost"},
             {~D[2026-06-01], "Children's Day"},
             {~D[2026-06-01], "Whit Monday"},
             {~D[2026-08-15], "Dormition of the Theotokos"},
             {~D[2026-11-30], "St. Andrew's Day"},
             {~D[2026-12-01], "National Day/Great Union"},
             {~D[2026-12-25], "Christmas Day"},
             {~D[2026-12-26], "St. Stephen's Day"}
           ]
  end
end
