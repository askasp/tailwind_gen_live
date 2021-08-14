defmodule Tailwindgen.Tcsat2 do
  @moduledoc """
  The Tcsat2 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tcsat2.Pasta2

  @doc """
  Returns the list of pasta2s.

  ## Examples

      iex> list_pasta2s()
      [%Pasta2{}, ...]

  """
  def list_pasta2s do
    Repo.all(Pasta2)
  end

  @doc """
  Gets a single pasta2.

  Raises `Ecto.NoResultsError` if the Pasta2 does not exist.

  ## Examples

      iex> get_pasta2!(123)
      %Pasta2{}

      iex> get_pasta2!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pasta2!(id), do: Repo.get!(Pasta2, id)

  @doc """
  Creates a pasta2.

  ## Examples

      iex> create_pasta2(%{field: value})
      {:ok, %Pasta2{}}

      iex> create_pasta2(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pasta2(attrs \\ %{}) do
    %Pasta2{}
    |> Pasta2.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pasta2.

  ## Examples

      iex> update_pasta2(pasta2, %{field: new_value})
      {:ok, %Pasta2{}}

      iex> update_pasta2(pasta2, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pasta2(%Pasta2{} = pasta2, attrs) do
    pasta2
    |> Pasta2.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pasta2.

  ## Examples

      iex> delete_pasta2(pasta2)
      {:ok, %Pasta2{}}

      iex> delete_pasta2(pasta2)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pasta2(%Pasta2{} = pasta2) do
    Repo.delete(pasta2)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pasta2 changes.

  ## Examples

      iex> change_pasta2(pasta2)
      %Ecto.Changeset{data: %Pasta2{}}

  """
  def change_pasta2(%Pasta2{} = pasta2, attrs \\ %{}) do
    Pasta2.changeset(pasta2, attrs)
  end
end
