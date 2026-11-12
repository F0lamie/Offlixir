defmodule Offlixir.Holiday do
  @moduledoc """
  A public holiday of a country.

    * `:country` - the ISO 3166-1 alpha-2 code as an upper case atom, for example `:FR`
    * `:id` - a stable identifier, for example `"FR-NEWYEARSDAY-01"`. Two holidays
      of a country can share a date but never an id within a year
    * `:date` - the calendar date of the holiday
    * `:observed_date` - the day actually taken off when the country moves a holiday that
      falls on a week-end. Equal to `:date` when there is no such rule
    * `:local_name` - the name in the language of the country
    * `:english_name` - the name in English
  """

  @enforce_keys [:country, :id, :date, :observed_date, :local_name, :english_name]
  defstruct [:country, :id, :date, :observed_date, :local_name, :english_name]

  @type t :: %__MODULE__{
          country: atom(),
          id: String.t(),
          date: Date.t(),
          observed_date: Date.t(),
          local_name: String.t(),
          english_name: String.t()
        }
end
