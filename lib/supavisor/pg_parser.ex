defmodule Supavisor.PgParser do
  use Rustler, otp_app: :supavisor, crate: "pgparser"

  # When your NIF is loaded, it will override this function.
  @doc """
  Returns a list of all statements in the given sql string.

  ## Examples

      iex> Supavisor.PgParser.statement_types("select 1; insert into table1 values ('a', 'b')")
      {:ok, ["SelectStmt", "InsertStmt"]}

      iex> Supavisor.PgParser.statement_types("not a valid sql")
      {:error, "Error parsing query"}
  """
  @spec statement_types(String.t()) :: {:ok, [String.t()]} | {:error, String.t()}
  def statement_types(_query), do: :erlang.nif_error(:nif_not_loaded)
end
