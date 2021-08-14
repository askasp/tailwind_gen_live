defmodule Tailwindgen.Tcsat8 do
  @moduledoc """
  The Tcsat8 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tcsat8.Pasta8

  @doc """
  Returns the list of pasta8s.

  ## Examples

      iex> list_pasta8s()
      [%Pasta8{}, ...]

  """
  def list_pasta8s do
    Repo.all(Pasta8)
  end

  @doc """
  Gets a single pasta8.

  Raises `Ecto.NoResultsError` if the Pasta8 does not exist.

  ## Examples

      iex> get_pasta8!(123)
      %Pasta8{}

      iex> get_pasta8!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pasta8!(id), do: Repo.get!(Pasta8, id)

  @doc """
  Creates a pasta8.

  ## Examples

      iex> create_pasta8(%{field: value})
      {:ok, %Pasta8{}}

      iex> create_pasta8(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pasta8(attrs \\ %{}) do
    %Pasta8{}
    |> Pasta8.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pasta8.

  ## Examples

      iex> update_pasta8(pasta8, %{field: new_value})
      {:ok, %Pasta8{}}

      iex> update_pasta8(pasta8, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pasta8(%Pasta8{} = pasta8, attrs) do
    pasta8
    |> Pasta8.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pasta8.

  ## Examples

      iex> delete_pasta8(pasta8)
      {:ok, %Pasta8{}}

      iex> delete_pasta8(pasta8)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pasta8(%Pasta8{} = pasta8) do
    Repo.delete(pasta8)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pasta8 changes.

  ## Examples

      iex> change_pasta8(pasta8)
      %Ecto.Changeset{data: %Pasta8{}}

  """
  def change_pasta8(%Pasta8{} = pasta8, attrs \\ %{}) do
    Pasta8.changeset(pasta8, attrs)
  end
end
