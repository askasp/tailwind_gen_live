defmodule Tailwindgen.Tcsat7 do
  @moduledoc """
  The Tcsat7 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tcsat7.Pasta7

  @doc """
  Returns the list of pasta7s.

  ## Examples

      iex> list_pasta7s()
      [%Pasta7{}, ...]

  """
  def list_pasta7s do
    Repo.all(Pasta7)
  end

  @doc """
  Gets a single pasta7.

  Raises `Ecto.NoResultsError` if the Pasta7 does not exist.

  ## Examples

      iex> get_pasta7!(123)
      %Pasta7{}

      iex> get_pasta7!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pasta7!(id), do: Repo.get!(Pasta7, id)

  @doc """
  Creates a pasta7.

  ## Examples

      iex> create_pasta7(%{field: value})
      {:ok, %Pasta7{}}

      iex> create_pasta7(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pasta7(attrs \\ %{}) do
    %Pasta7{}
    |> Pasta7.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pasta7.

  ## Examples

      iex> update_pasta7(pasta7, %{field: new_value})
      {:ok, %Pasta7{}}

      iex> update_pasta7(pasta7, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pasta7(%Pasta7{} = pasta7, attrs) do
    pasta7
    |> Pasta7.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pasta7.

  ## Examples

      iex> delete_pasta7(pasta7)
      {:ok, %Pasta7{}}

      iex> delete_pasta7(pasta7)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pasta7(%Pasta7{} = pasta7) do
    Repo.delete(pasta7)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pasta7 changes.

  ## Examples

      iex> change_pasta7(pasta7)
      %Ecto.Changeset{data: %Pasta7{}}

  """
  def change_pasta7(%Pasta7{} = pasta7, attrs \\ %{}) do
    Pasta7.changeset(pasta7, attrs)
  end
end
