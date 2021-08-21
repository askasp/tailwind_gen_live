defmodule Tailwindgen.Tsc13 do
  @moduledoc """
  The Tsc13 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tsc13.Ts13

  @doc """
  Returns the list of ts13s.

  ## Examples

      iex> list_ts13s()
      [%Ts13{}, ...]

  """
  def list_ts13s do
    Repo.all(Ts13)
  end

  @doc """
  Gets a single ts13.

  Raises `Ecto.NoResultsError` if the Ts13 does not exist.

  ## Examples

      iex> get_ts13!(123)
      %Ts13{}

      iex> get_ts13!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ts13!(id), do: Repo.get!(Ts13, id)

  @doc """
  Creates a ts13.

  ## Examples

      iex> create_ts13(%{field: value})
      {:ok, %Ts13{}}

      iex> create_ts13(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ts13(attrs \\ %{}) do
    %Ts13{}
    |> Ts13.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ts13.

  ## Examples

      iex> update_ts13(ts13, %{field: new_value})
      {:ok, %Ts13{}}

      iex> update_ts13(ts13, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ts13(%Ts13{} = ts13, attrs) do
    ts13
    |> Ts13.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ts13.

  ## Examples

      iex> delete_ts13(ts13)
      {:ok, %Ts13{}}

      iex> delete_ts13(ts13)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ts13(%Ts13{} = ts13) do
    Repo.delete(ts13)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ts13 changes.

  ## Examples

      iex> change_ts13(ts13)
      %Ecto.Changeset{data: %Ts13{}}

  """
  def change_ts13(%Ts13{} = ts13, attrs \\ %{}) do
    Ts13.changeset(ts13, attrs)
  end
end
