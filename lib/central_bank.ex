defmodule Currencies.CentralBank do
  @moduledoc """
  A struct that keeps information about the central bank governing a given currency.

  It contains the following fields:
   * `:name` - the name of the central bank
   * `:url` - the url of the central bank
  """

  defstruct [:name, :url]

  @type t :: %__MODULE__{
          name: binary(),
          url: binary()
        }
end
