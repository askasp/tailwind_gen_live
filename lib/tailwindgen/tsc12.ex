defmodule Tailwindgen.Tsc12 do
  @moduledoc """
  The Tsc12 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tsc12.Ts12

  @doc """
  Returns the list of ts12s.

  ## Examples

      iex> list_ts12s()
      [%Ts12{}, ...]

  """
  def list_ts12s do
    Repo.all(Ts12)
  end

  @doc """
  Gets a single ts12.

  Raises `Ecto.NoResultsError` if the Ts12 does not exist.

  ## Examples

      iex> get_ts12!(123)
      %Ts12{}

      iex> get_ts12!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ts12!(id), do: Repo.get!(Ts12, id)

  @doc """
  Creates a ts12.

  ## Examples

      iex> create_ts12(%{field: value})
      {:ok, %Ts12{}}

      iex> create_ts12(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ts12(attrs \\ %{}) do
    %Ts12{}
    |> Ts12.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ts12.

  ## Examples

      iex> update_ts12(ts12, %{field: new_value})
      {:ok, %Ts12{}}

      iex> update_ts12(ts12, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ts12(%Ts12{} = ts12, attrs) do
    ts12
    |> Ts12.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ts12.

  ## Examples

      iex> delete_ts12(ts12)
      {:ok, %Ts12{}}

      iex> delete_ts12(ts12)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ts12(%Ts12{} = ts12) do
    Repo.delete(ts12)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ts12 changes.

  ## Examples

      iex> change_ts12(ts12)
      %Ecto.Changeset{data: %Ts12{}}

  """
  def change_ts12(%Ts12{} = ts12, attrs \\ %{}) do
    Ts12.changeset(ts12, attrs)
  end
end
