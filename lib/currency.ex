defmodule Currencies.Currency do
  @moduledoc """
  A struct that keeps information about the currency.

  It contains the following fields:
   * `:code` - the currency code
   * `:name` - the name of the curency
   * `:description` - the description of the currency
   * `:symbol` - the displayable currency symbol
   * `:iso_numeric` - the iso numeric value of the currency
   * `:disambiguate_symbol` - the value used to distinguish currency between other currencies having the same
   *                          common name. This returns A$ and S$ to distinguish between AUD and SGD.
   * `:alternate_symbols` - the other symbols used to represent the currency. This returns lev", "leva", "лев" and
   *                          "лева" for BGN.
   * `:representations` - contains html and unicode decimal representations for the currency symbol
   * `:minor_unit` - contains sub-init or minor unit information about the currency
   * `:central_bank` - contains information about the central bank governing the currency
   * `:nicknames` - contains nicknames for the currency
   * `:users` - contains places or countries using the currency
  """

  defstruct [
    :code,
    :name,
    :description,
    :symbol,
    :iso_numeric,
    :disambiguate_symbol,
    :alternate_symbols,
    :representations,
    :minor_unit,
    :central_bank,
    :nicknames,
    :users
  ]

  @type t :: %__MODULE__{
          code: binary(),
          name: binary(),
          description: binary(),
          symbol: binary(),
          iso_numeric: binary(),
          disambiguate_symbol: binary(),
          alternate_symbols: [binary()],
          representations: Currencies.Representations.t(),
          minor_unit: Currencies.MinorUnit.t(),
          central_bank: Currencies.CentralBank.t(),
          nicknames: [binary()],
          users: [binary()]
        }
end
