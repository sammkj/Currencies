defmodule Currencies.Loader do
  @moduledoc false

  alias Currencies.CentralBank
  alias Currencies.Currency
  alias Currencies.MinorUnit
  alias Currencies.Representations

  def load() do
    data_path("currencies.json")
    |> File.read!()
    |> Jason.decode!(keys: :atoms)
    |> Enum.map(&load_currency(&1.code))
  end

  defp data_path(path) do
    Path.join([:code.priv_dir(:currencies), "data", path])
  end

  defp load_currency(currency_code) do
    currency =
      data_path("/currencies/#{String.downcase(currency_code)}.json")
      |> File.read!()
      |> Jason.decode!(keys: :atoms)

    struct!(Currency, currency)
    |> struct_central_bank()
    |> struct_minor_unit()
    |> struct_representations()
  end

  defp struct_central_bank(%Currency{} = currency) do
    if is_map(currency.central_bank) do
      Map.put(currency, :central_bank, struct!(CentralBank, currency.central_bank))
    else
      currency
    end
  end

  defp struct_minor_unit(%Currency{} = currency) do
    if is_map(currency.minor_unit) do
      Map.put(currency, :minor_unit, struct!(MinorUnit, currency.minor_unit))
    else
      currency
    end
  end

  defp struct_representations(%Currency{} = currency) do
    if is_map(currency.representations) do
      Map.put(currency, :representations, struct!(Representations, currency.representations))
    else
      currency
    end
  end
end
