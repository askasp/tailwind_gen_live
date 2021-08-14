defmodule Tailwindgen.Tcsat3 do
  @moduledoc """
  The Tcsat3 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tcsat3.Pasta3

  @doc """
  Returns the list of pasta3s.

  ## Examples

      iex> list_pasta3s()
      [%Pasta3{}, ...]

  """
  def list_pasta3s do
    Repo.all(Pasta3)
  end

  @doc """
  Gets a single pasta3.

  Raises `Ecto.NoResultsError` if the Pasta3 does not exist.

  ## Examples

      iex> get_pasta3!(123)
      %Pasta3{}

      iex> get_pasta3!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pasta3!(id), do: Repo.get!(Pasta3, id)

  @doc """
  Creates a pasta3.

  ## Examples

      iex> create_pasta3(%{field: value})
      {:ok, %Pasta3{}}

      iex> create_pasta3(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pasta3(attrs \\ %{}) do
    %Pasta3{}
    |> Pasta3.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pasta3.

  ## Examples

      iex> update_pasta3(pasta3, %{field: new_value})
      {:ok, %Pasta3{}}

      iex> update_pasta3(pasta3, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pasta3(%Pasta3{} = pasta3, attrs) do
    pasta3
    |> Pasta3.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pasta3.

  ## Examples

      iex> delete_pasta3(pasta3)
      {:ok, %Pasta3{}}

      iex> delete_pasta3(pasta3)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pasta3(%Pasta3{} = pasta3) do
    Repo.delete(pasta3)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pasta3 changes.

  ## Examples

      iex> change_pasta3(pasta3)
      %Ecto.Changeset{data: %Pasta3{}}

  """
  def change_pasta3(%Pasta3{} = pasta3, attrs \\ %{}) do
    Pasta3.changeset(pasta3, attrs)
  end
end
