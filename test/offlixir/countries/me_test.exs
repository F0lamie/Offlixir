defmodule Offlixir.Countries.METest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.

  test "1967" do
    assert Offlixir.dates!(:ME, 1967) == [
             ~D[1967-01-01],
             ~D[1967-01-02],
             ~D[1967-05-01],
             ~D[1967-05-02],
             ~D[1967-05-21],
             ~D[1967-05-22],
             ~D[1967-07-13],
             ~D[1967-07-14]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:ME, 1985) == [
             ~D[1985-01-01],
             ~D[1985-01-02],
             ~D[1985-05-01],
             ~D[1985-05-02],
             ~D[1985-05-21],
             ~D[1985-05-22],
             ~D[1985-07-13],
             ~D[1985-07-14]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:ME, 1998) == [
             ~D[1998-01-01],
             ~D[1998-01-02],
             ~D[1998-05-01],
             ~D[1998-05-02],
             ~D[1998-05-21],
             ~D[1998-05-22],
             ~D[1998-07-13],
             ~D[1998-07-14]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:ME, 2012) == [
             ~D[2012-01-01],
             ~D[2012-01-02],
             ~D[2012-05-01],
             ~D[2012-05-02],
             ~D[2012-05-21],
             ~D[2012-05-22],
             ~D[2012-07-13],
             ~D[2012-07-14]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:ME, 2025) == [
             ~D[2025-01-01],
             ~D[2025-01-02],
             ~D[2025-05-01],
             ~D[2025-05-02],
             ~D[2025-05-21],
             ~D[2025-05-22],
             ~D[2025-07-13],
             ~D[2025-07-14]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:ME, 2026) == [
             ~D[2026-01-01],
             ~D[2026-01-02],
             ~D[2026-05-01],
             ~D[2026-05-02],
             ~D[2026-05-21],
             ~D[2026-05-22],
             ~D[2026-07-13],
             ~D[2026-07-14]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:ME, 2027) == [
             ~D[2027-01-01],
             ~D[2027-01-02],
             ~D[2027-05-01],
             ~D[2027-05-02],
             ~D[2027-05-21],
             ~D[2027-05-22],
             ~D[2027-07-13],
             ~D[2027-07-14]
           ]
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:ME, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-01-02], "New Year's Day"},
             {~D[2026-05-01], "Labour Day"},
             {~D[2026-05-02], "Labour Day"},
             {~D[2026-05-21], "Independence Day"},
             {~D[2026-05-22], "Independence Day"},
             {~D[2026-07-13], "Statehood Day"},
             {~D[2026-07-14], "Statehood Day"}
           ]
  end
end
