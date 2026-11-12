defmodule Offlixir.Countries.MDTest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.
  #
  # Deliberate deviation: the reference data gives Memorial Day on the last Monday of
  # August. Offlixir gives it on the Monday one week after Orthodox Easter, so every
  # list below carries that date where the reference data has the last Monday of August. See
  # DEVIATIONS.md.

  test "1967" do
    assert Offlixir.dates!(:MD, 1967) == [
             ~D[1967-01-01],
             ~D[1967-01-07],
             ~D[1967-01-08],
             ~D[1967-02-23],
             ~D[1967-03-08],
             ~D[1967-04-30],
             ~D[1967-05-01],
             ~D[1967-05-08],
             ~D[1967-05-09],
             ~D[1967-05-22],
             ~D[1967-08-27],
             ~D[1967-08-31],
             ~D[1967-09-03],
             ~D[1967-10-14],
             ~D[1967-11-21],
             ~D[1967-12-25]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:MD, 1985) == [
             ~D[1985-01-01],
             ~D[1985-01-07],
             ~D[1985-01-08],
             ~D[1985-02-23],
             ~D[1985-03-08],
             ~D[1985-04-14],
             ~D[1985-04-22],
             ~D[1985-05-01],
             ~D[1985-05-09],
             ~D[1985-05-22],
             ~D[1985-08-27],
             ~D[1985-08-31],
             ~D[1985-09-03],
             ~D[1985-10-14],
             ~D[1985-11-21],
             ~D[1985-12-25]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:MD, 1998) == [
             ~D[1998-01-01],
             ~D[1998-01-07],
             ~D[1998-01-08],
             ~D[1998-02-23],
             ~D[1998-03-08],
             ~D[1998-04-19],
             ~D[1998-04-27],
             ~D[1998-05-01],
             ~D[1998-05-09],
             ~D[1998-05-22],
             ~D[1998-08-27],
             ~D[1998-08-31],
             ~D[1998-09-03],
             ~D[1998-10-14],
             ~D[1998-11-21],
             ~D[1998-12-25]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:MD, 2012) == [
             ~D[2012-01-01],
             ~D[2012-01-07],
             ~D[2012-01-08],
             ~D[2012-02-23],
             ~D[2012-03-08],
             ~D[2012-04-15],
             ~D[2012-04-23],
             ~D[2012-05-01],
             ~D[2012-05-09],
             ~D[2012-05-22],
             ~D[2012-08-27],
             ~D[2012-08-31],
             ~D[2012-09-03],
             ~D[2012-10-14],
             ~D[2012-11-21],
             ~D[2012-12-25]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:MD, 2025) == [
             ~D[2025-01-01],
             ~D[2025-01-07],
             ~D[2025-01-08],
             ~D[2025-02-23],
             ~D[2025-03-08],
             ~D[2025-04-20],
             ~D[2025-04-28],
             ~D[2025-05-01],
             ~D[2025-05-09],
             ~D[2025-05-22],
             ~D[2025-08-27],
             ~D[2025-08-31],
             ~D[2025-09-03],
             ~D[2025-10-14],
             ~D[2025-11-21],
             ~D[2025-12-25]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:MD, 2026) == [
             ~D[2026-01-01],
             ~D[2026-01-07],
             ~D[2026-01-08],
             ~D[2026-02-23],
             ~D[2026-03-08],
             ~D[2026-04-12],
             ~D[2026-04-20],
             ~D[2026-05-01],
             ~D[2026-05-09],
             ~D[2026-05-22],
             ~D[2026-08-27],
             ~D[2026-08-31],
             ~D[2026-09-03],
             ~D[2026-10-14],
             ~D[2026-11-21],
             ~D[2026-12-25]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:MD, 2027) == [
             ~D[2027-01-01],
             ~D[2027-01-07],
             ~D[2027-01-08],
             ~D[2027-02-23],
             ~D[2027-03-08],
             ~D[2027-05-01],
             ~D[2027-05-02],
             ~D[2027-05-09],
             ~D[2027-05-10],
             ~D[2027-05-22],
             ~D[2027-08-27],
             ~D[2027-08-31],
             ~D[2027-09-03],
             ~D[2027-10-14],
             ~D[2027-11-21],
             ~D[2027-12-25]
           ]
  end

  test "Memorial Day is the Monday one week after Orthodox Easter" do
    memorial_day = fn year ->
      Enum.find(Offlixir.holidays!(:MD, year), &(&1.id == "MD-MEMORIALDAY-01")).date
    end

    assert memorial_day.(2025) == ~D[2025-04-28]
    assert memorial_day.(2026) == ~D[2026-04-20]
    assert memorial_day.(2027) == ~D[2027-05-10]
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:MD, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-01-07], "Christmas Day (Orthodox)"},
             {~D[2026-01-08], "Christmas Day (Orthodox)"},
             {~D[2026-02-23], "Day of Veterans of the Armed Forces and Law Enforcement Agencies"},
             {~D[2026-03-08], "International Women's Day"},
             {~D[2026-04-12], "Easter Sunday"},
             {~D[2026-04-20], "Memorial Day"},
             {~D[2026-05-01], "Labour Day (Moldova)"},
             {~D[2026-05-09], "Victory and Commemoration Day"},
             {~D[2026-05-22], "Bălţi Day"},
             {~D[2026-08-27], "Independence Day (Moldova)"},
             {~D[2026-08-31], "Limba Noastra (National Language Day)"},
             {~D[2026-09-03], "Day of the Moldovan National Army"},
             {~D[2026-10-14], "Capital's Day"},
             {~D[2026-11-21], "South Capital's Day Cahul"},
             {~D[2026-12-25], "Christmas Day"}
           ]
  end
end
