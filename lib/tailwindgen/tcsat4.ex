defmodule Tailwindgen.Tcsat4 do
  @moduledoc """
  The Tcsat4 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tcsat4.Pasta4

  @doc """
  Returns the list of pasta4s.

  ## Examples

      iex> list_pasta4s()
      [%Pasta4{}, ...]

  """
  def list_pasta4s do
    Repo.all(Pasta4)
  end

  @doc """
  Gets a single pasta4.

  Raises `Ecto.NoResultsError` if the Pasta4 does not exist.

  ## Examples

      iex> get_pasta4!(123)
      %Pasta4{}

      iex> get_pasta4!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pasta4!(id), do: Repo.get!(Pasta4, id)

  @doc """
  Creates a pasta4.

  ## Examples

      iex> create_pasta4(%{field: value})
      {:ok, %Pasta4{}}

      iex> create_pasta4(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pasta4(attrs \\ %{}) do
    %Pasta4{}
    |> Pasta4.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pasta4.

  ## Examples

      iex> update_pasta4(pasta4, %{field: new_value})
      {:ok, %Pasta4{}}

      iex> update_pasta4(pasta4, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pasta4(%Pasta4{} = pasta4, attrs) do
    pasta4
    |> Pasta4.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pasta4.

  ## Examples

      iex> delete_pasta4(pasta4)
      {:ok, %Pasta4{}}

      iex> delete_pasta4(pasta4)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pasta4(%Pasta4{} = pasta4) do
    Repo.delete(pasta4)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pasta4 changes.

  ## Examples

      iex> change_pasta4(pasta4)
      %Ecto.Changeset{data: %Pasta4{}}

  """
  def change_pasta4(%Pasta4{} = pasta4, attrs \\ %{}) do
    Pasta4.changeset(pasta4, attrs)
  end
end
