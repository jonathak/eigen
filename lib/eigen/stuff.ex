# stuff.ex

defmodule Eigen.Stuff do
  alias Eigen.Matrix, as: M

  @doc """
    iex> Eigen.Stuff.get_prices("EFO") |> hd()
    44.193333
  """
  def get_prices(filename) do
    fname = "lib/#{filename}.csv"
    {:ok, file} = File.read(fname)

    file
    |> String.split("\n")
    |> Enum.map(&String.split(&1, ","))
    |> Enum.map(&pluck(&1))
    |> tl()
    |> Enum.map(&Float.parse(&1))
    |> Enum.map(&M.bip(&1))
  end

  @doc """
      iex> Eigen.Stuff.pluck([:a, :b, :c, :d, :e, :f, :g])
      :e
  """
  def pluck(l) do
    l
    |> tl()
    |> tl()
    |> tl()
    |> tl()
    |> hd()
  end

  def tickers(), do: ["EFO", "SSO", "UBT", "UCO", "ULE"]

  def functions() do
    tickers()
    |> Enum.map(&get_prices(&1))
    |> Enum.map(&M.normalize(&1))
  end

  def rates() do
    functions()
    |> Enum.map(&M.rate(&1))
  end

  def func_les_avg(m) do
    avg = M.average(m)
    m
    |> Enum.map(&M.llsub(&1, avg))
  end

end
