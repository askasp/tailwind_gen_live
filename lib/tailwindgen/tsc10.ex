defmodule Tailwindgen.Tsc10 do
  @moduledoc """
  The Tsc10 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tsc10.Ts10

  @doc """
  Returns the list of ts10s.

  ## Examples

      iex> list_ts10s()
      [%Ts10{}, ...]

  """
  def list_ts10s do
    Repo.all(Ts10)
  end

  @doc """
  Gets a single ts10.

  Raises `Ecto.NoResultsError` if the Ts10 does not exist.

  ## Examples

      iex> get_ts10!(123)
      %Ts10{}

      iex> get_ts10!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ts10!(id), do: Repo.get!(Ts10, id)

  @doc """
  Creates a ts10.

  ## Examples

      iex> create_ts10(%{field: value})
      {:ok, %Ts10{}}

      iex> create_ts10(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ts10(attrs \\ %{}) do
    %Ts10{}
    |> Ts10.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ts10.

  ## Examples

      iex> update_ts10(ts10, %{field: new_value})
      {:ok, %Ts10{}}

      iex> update_ts10(ts10, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ts10(%Ts10{} = ts10, attrs) do
    ts10
    |> Ts10.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ts10.

  ## Examples

      iex> delete_ts10(ts10)
      {:ok, %Ts10{}}

      iex> delete_ts10(ts10)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ts10(%Ts10{} = ts10) do
    Repo.delete(ts10)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ts10 changes.

  ## Examples

      iex> change_ts10(ts10)
      %Ecto.Changeset{data: %Ts10{}}

  """
  def change_ts10(%Ts10{} = ts10, attrs \\ %{}) do
    Ts10.changeset(ts10, attrs)
  end
end
