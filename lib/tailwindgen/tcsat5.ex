defmodule Tailwindgen.Tcsat5 do
  @moduledoc """
  The Tcsat5 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tcsat5.Pasta5

  @doc """
  Returns the list of pasta5s.

  ## Examples

      iex> list_pasta5s()
      [%Pasta5{}, ...]

  """
  def list_pasta5s do
    Repo.all(Pasta5)
  end

  @doc """
  Gets a single pasta5.

  Raises `Ecto.NoResultsError` if the Pasta5 does not exist.

  ## Examples

      iex> get_pasta5!(123)
      %Pasta5{}

      iex> get_pasta5!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pasta5!(id), do: Repo.get!(Pasta5, id)

  @doc """
  Creates a pasta5.

  ## Examples

      iex> create_pasta5(%{field: value})
      {:ok, %Pasta5{}}

      iex> create_pasta5(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pasta5(attrs \\ %{}) do
    %Pasta5{}
    |> Pasta5.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pasta5.

  ## Examples

      iex> update_pasta5(pasta5, %{field: new_value})
      {:ok, %Pasta5{}}

      iex> update_pasta5(pasta5, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pasta5(%Pasta5{} = pasta5, attrs) do
    pasta5
    |> Pasta5.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pasta5.

  ## Examples

      iex> delete_pasta5(pasta5)
      {:ok, %Pasta5{}}

      iex> delete_pasta5(pasta5)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pasta5(%Pasta5{} = pasta5) do
    Repo.delete(pasta5)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pasta5 changes.

  ## Examples

      iex> change_pasta5(pasta5)
      %Ecto.Changeset{data: %Pasta5{}}

  """
  def change_pasta5(%Pasta5{} = pasta5, attrs \\ %{}) do
    Pasta5.changeset(pasta5, attrs)
  end
end
