defmodule Tailwindgen.Tcsat9 do
  @moduledoc """
  The Tcsat9 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tcsat9.Pasta9

  @doc """
  Returns the list of pasta9s.

  ## Examples

      iex> list_pasta9s()
      [%Pasta9{}, ...]

  """
  def list_pasta9s do
    Repo.all(Pasta9)
  end

  @doc """
  Gets a single pasta9.

  Raises `Ecto.NoResultsError` if the Pasta9 does not exist.

  ## Examples

      iex> get_pasta9!(123)
      %Pasta9{}

      iex> get_pasta9!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pasta9!(id), do: Repo.get!(Pasta9, id)

  @doc """
  Creates a pasta9.

  ## Examples

      iex> create_pasta9(%{field: value})
      {:ok, %Pasta9{}}

      iex> create_pasta9(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pasta9(attrs \\ %{}) do
    %Pasta9{}
    |> Pasta9.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pasta9.

  ## Examples

      iex> update_pasta9(pasta9, %{field: new_value})
      {:ok, %Pasta9{}}

      iex> update_pasta9(pasta9, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pasta9(%Pasta9{} = pasta9, attrs) do
    pasta9
    |> Pasta9.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pasta9.

  ## Examples

      iex> delete_pasta9(pasta9)
      {:ok, %Pasta9{}}

      iex> delete_pasta9(pasta9)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pasta9(%Pasta9{} = pasta9) do
    Repo.delete(pasta9)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pasta9 changes.

  ## Examples

      iex> change_pasta9(pasta9)
      %Ecto.Changeset{data: %Pasta9{}}

  """
  def change_pasta9(%Pasta9{} = pasta9, attrs \\ %{}) do
    Pasta9.changeset(pasta9, attrs)
  end
end
