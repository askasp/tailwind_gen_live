defmodule Tailwindgen.Tcsat6 do
  @moduledoc """
  The Tcsat6 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tcsat6.Pasta6

  @doc """
  Returns the list of pasta6s.

  ## Examples

      iex> list_pasta6s()
      [%Pasta6{}, ...]

  """
  def list_pasta6s do
    Repo.all(Pasta6)
  end

  @doc """
  Gets a single pasta6.

  Raises `Ecto.NoResultsError` if the Pasta6 does not exist.

  ## Examples

      iex> get_pasta6!(123)
      %Pasta6{}

      iex> get_pasta6!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pasta6!(id), do: Repo.get!(Pasta6, id)

  @doc """
  Creates a pasta6.

  ## Examples

      iex> create_pasta6(%{field: value})
      {:ok, %Pasta6{}}

      iex> create_pasta6(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pasta6(attrs \\ %{}) do
    %Pasta6{}
    |> Pasta6.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pasta6.

  ## Examples

      iex> update_pasta6(pasta6, %{field: new_value})
      {:ok, %Pasta6{}}

      iex> update_pasta6(pasta6, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pasta6(%Pasta6{} = pasta6, attrs) do
    pasta6
    |> Pasta6.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pasta6.

  ## Examples

      iex> delete_pasta6(pasta6)
      {:ok, %Pasta6{}}

      iex> delete_pasta6(pasta6)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pasta6(%Pasta6{} = pasta6) do
    Repo.delete(pasta6)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pasta6 changes.

  ## Examples

      iex> change_pasta6(pasta6)
      %Ecto.Changeset{data: %Pasta6{}}

  """
  def change_pasta6(%Pasta6{} = pasta6, attrs \\ %{}) do
    Pasta6.changeset(pasta6, attrs)
  end
end
