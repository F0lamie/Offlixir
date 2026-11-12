defmodule Offlixir.RulesTest do
  use ExUnit.Case, async: true

  alias Offlixir.Rules

  describe "observed date" do
    test "is the date itself without a rule" do
      # The 25th of December 2027 is a Saturday.
      holiday = Rules.fixed(2027, 12, 25, "CHRISTMASDAY-01", "Christmas Day", "Christmas Day")

      assert holiday.date == ~D[2027-12-25]
      assert holiday.observed_date == ~D[2027-12-25]
    end

    test "is moved by the number of days given for the day of the week" do
      saturday_and_sunday_to_monday = %{6 => 2, 7 => 1}

      # Saturday, Sunday and Monday.
      for {day, observed} <- [{25, ~D[2027-12-27]}, {26, ~D[2027-12-27]}, {27, ~D[2027-12-27]}] do
        holiday =
          Rules.fixed(2027, 12, day, "ID-01", "Nom", "Name", saturday_and_sunday_to_monday)

        assert holiday.date == Date.new!(2027, 12, day)
        assert holiday.observed_date == observed
      end
    end

    test "can be moved backwards" do
      # The 27th of April 2025 is a Sunday.
      holiday = Rules.fixed(2025, 4, 27, "ID-01", "Nom", "Name", %{7 => -1})

      assert holiday.observed_date == ~D[2025-04-26]
    end
  end

  describe "easter/5" do
    test "builds the id and English name of a Catholic feast" do
      assert Rules.easter(2026, :catholic, :easter_monday, "Lundi de Pâques") == %{
               id: "CEASTERMONDAY-01",
               date: ~D[2026-04-06],
               observed_date: ~D[2026-04-06],
               local_name: "Lundi de Pâques",
               english_name: "Easter Monday"
             }
    end

    test "builds the id and English name of an Orthodox feast" do
      assert %{id: "OGOODFRIDAY-01", date: ~D[2026-04-10], english_name: "Good Friday"} =
               Rules.easter(2026, :orthodox, :good_friday, "Μεγάλη Παρασκευή")
    end
  end
end
