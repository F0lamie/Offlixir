defmodule Offlixir.Countries.BATest do
  use ExUnit.Case, async: true

  # Expected values: reference data retrieved on 2026-11-10 for 1985, 1998, 2012
  # (observed dates) and 2025, 2026, 2027 (calendar dates), keeping the holidays
  # that are public and national. 1967 and the years of the "year conditions"
  # tests have no reference data and are computed by hand from the rules.

  test "1967" do
    assert Offlixir.dates!(:BA, 1967) == [
             ~D[1967-01-01],
             ~D[1967-01-02],
             ~D[1967-05-01],
             ~D[1967-05-02]
           ]
  end

  test "1985" do
    assert Offlixir.dates!(:BA, 1985) == [
             ~D[1985-01-01],
             ~D[1985-01-02],
             ~D[1985-05-01],
             ~D[1985-05-02]
           ]
  end

  test "1998" do
    assert Offlixir.dates!(:BA, 1998) == [
             ~D[1998-01-01],
             ~D[1998-01-02],
             ~D[1998-05-01],
             ~D[1998-05-02]
           ]
  end

  test "2012" do
    assert Offlixir.dates!(:BA, 2012) == [
             ~D[2012-01-01],
             ~D[2012-01-02],
             ~D[2012-05-01],
             ~D[2012-05-02]
           ]
  end

  test "2025" do
    assert Offlixir.dates!(:BA, 2025) == [
             ~D[2025-01-01],
             ~D[2025-01-02],
             ~D[2025-05-01],
             ~D[2025-05-02]
           ]
  end

  test "2026" do
    assert Offlixir.dates!(:BA, 2026) == [
             ~D[2026-01-01],
             ~D[2026-01-02],
             ~D[2026-05-01],
             ~D[2026-05-02]
           ]
  end

  test "2027" do
    assert Offlixir.dates!(:BA, 2027) == [
             ~D[2027-01-01],
             ~D[2027-01-02],
             ~D[2027-05-01],
             ~D[2027-05-02]
           ]
  end

  test "English names in 2026" do
    assert Enum.map(Offlixir.holidays!(:BA, 2026), &{&1.date, &1.english_name}) == [
             {~D[2026-01-01], "New Year's Day"},
             {~D[2026-01-02], "New Year's Day"},
             {~D[2026-05-01], "May Day / International Workers' Day"},
             {~D[2026-05-02], "May Day / International Workers' Day"}
           ]
  end
end
