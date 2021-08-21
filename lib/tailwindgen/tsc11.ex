defmodule Tailwindgen.Tsc11 do
  @moduledoc """
  The Tsc11 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tsc11.Ts11

  @doc """
  Returns the list of ts11s.

  ## Examples

      iex> list_ts11s()
      [%Ts11{}, ...]

  """
  def list_ts11s do
    Repo.all(Ts11)
  end

  @doc """
  Gets a single ts11.

  Raises `Ecto.NoResultsError` if the Ts11 does not exist.

  ## Examples

      iex> get_ts11!(123)
      %Ts11{}

      iex> get_ts11!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ts11!(id), do: Repo.get!(Ts11, id)

  @doc """
  Creates a ts11.

  ## Examples

      iex> create_ts11(%{field: value})
      {:ok, %Ts11{}}

      iex> create_ts11(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ts11(attrs \\ %{}) do
    %Ts11{}
    |> Ts11.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ts11.

  ## Examples

      iex> update_ts11(ts11, %{field: new_value})
      {:ok, %Ts11{}}

      iex> update_ts11(ts11, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ts11(%Ts11{} = ts11, attrs) do
    ts11
    |> Ts11.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ts11.

  ## Examples

      iex> delete_ts11(ts11)
      {:ok, %Ts11{}}

      iex> delete_ts11(ts11)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ts11(%Ts11{} = ts11) do
    Repo.delete(ts11)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ts11 changes.

  ## Examples

      iex> change_ts11(ts11)
      %Ecto.Changeset{data: %Ts11{}}

  """
  def change_ts11(%Ts11{} = ts11, attrs \\ %{}) do
    Ts11.changeset(ts11, attrs)
  end
end
