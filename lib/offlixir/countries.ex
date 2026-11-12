defmodule Offlixir.Countries do
  @moduledoc false
  # Registry of the supported countries and evaluation of their rules for a year.

  alias Offlixir.Holiday

  @modules %{
    AD: Offlixir.Countries.AD,
    AL: Offlixir.Countries.AL,
    AT: Offlixir.Countries.AT,
    AX: Offlixir.Countries.AX,
    BA: Offlixir.Countries.BA,
    BE: Offlixir.Countries.BE,
    BG: Offlixir.Countries.BG,
    CH: Offlixir.Countries.CH,
    CY: Offlixir.Countries.CY,
    CZ: Offlixir.Countries.CZ,
    DE: Offlixir.Countries.DE,
    DK: Offlixir.Countries.DK,
    EE: Offlixir.Countries.EE,
    ES: Offlixir.Countries.ES,
    FI: Offlixir.Countries.FI,
    FO: Offlixir.Countries.FO,
    FR: Offlixir.Countries.FR,
    GB: Offlixir.Countries.GB,
    GG: Offlixir.Countries.GG,
    GI: Offlixir.Countries.GI,
    GR: Offlixir.Countries.GR,
    HR: Offlixir.Countries.HR,
    HU: Offlixir.Countries.HU,
    IE: Offlixir.Countries.IE,
    IM: Offlixir.Countries.IM,
    IS: Offlixir.Countries.IS,
    IT: Offlixir.Countries.IT,
    JE: Offlixir.Countries.JE,
    LI: Offlixir.Countries.LI,
    LT: Offlixir.Countries.LT,
    LU: Offlixir.Countries.LU,
    LV: Offlixir.Countries.LV,
    MC: Offlixir.Countries.MC,
    MD: Offlixir.Countries.MD,
    ME: Offlixir.Countries.ME,
    MK: Offlixir.Countries.MK,
    MT: Offlixir.Countries.MT,
    NL: Offlixir.Countries.NL,
    NO: Offlixir.Countries.NO,
    PL: Offlixir.Countries.PL,
    PT: Offlixir.Countries.PT,
    RO: Offlixir.Countries.RO,
    RS: Offlixir.Countries.RS,
    SE: Offlixir.Countries.SE,
    SI: Offlixir.Countries.SI,
    SJ: Offlixir.Countries.SJ,
    SK: Offlixir.Countries.SK,
    SM: Offlixir.Countries.SM,
    UA: Offlixir.Countries.UA,
    VA: Offlixir.Countries.VA
  }

  @codes @modules |> Map.keys() |> Enum.sort()
  @codes_by_string Map.new(@codes, &{Atom.to_string(&1), &1})

  @spec codes() :: [atom]
  def codes, do: @codes

  @spec fetch(term) :: {:ok, atom} | {:error, {:unknown_country, term}}
  def fetch(code) when is_map_key(@modules, code), do: {:ok, code}
  def fetch(code) when is_map_key(@codes_by_string, code), do: Map.fetch(@codes_by_string, code)
  def fetch(code), do: {:error, {:unknown_country, code}}

  @spec holidays(atom, integer) :: [Holiday.t()]
  def holidays(code, year) do
    module = Map.fetch!(@modules, code)

    year
    |> module.holidays()
    |> Enum.reject(&is_nil/1)
    |> Enum.map(fn holiday ->
      struct!(Holiday, %{holiday | id: "#{code}-#{holiday.id}"} |> Map.put(:country, code))
    end)
    |> Enum.sort_by(& &1.date, Date)
  end
end
