defmodule Tailwindgen.Test6 do
  @moduledoc """
  The Test6 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Test6.Postsek

  @doc """
  Returns the list of postseks.

  ## Examples

      iex> list_postseks()
      [%Postsek{}, ...]

  """
  def list_postseks do
    Repo.all(Postsek)
  end

  @doc """
  Gets a single postsek.

  Raises `Ecto.NoResultsError` if the Postsek does not exist.

  ## Examples

      iex> get_postsek!(123)
      %Postsek{}

      iex> get_postsek!(456)
      ** (Ecto.NoResultsError)

  """
  def get_postsek!(id), do: Repo.get!(Postsek, id)

  @doc """
  Creates a postsek.

  ## Examples

      iex> create_postsek(%{field: value})
      {:ok, %Postsek{}}

      iex> create_postsek(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_postsek(attrs \\ %{}) do
    %Postsek{}
    |> Postsek.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a postsek.

  ## Examples

      iex> update_postsek(postsek, %{field: new_value})
      {:ok, %Postsek{}}

      iex> update_postsek(postsek, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_postsek(%Postsek{} = postsek, attrs) do
    postsek
    |> Postsek.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a postsek.

  ## Examples

      iex> delete_postsek(postsek)
      {:ok, %Postsek{}}

      iex> delete_postsek(postsek)
      {:error, %Ecto.Changeset{}}

  """
  def delete_postsek(%Postsek{} = postsek) do
    Repo.delete(postsek)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking postsek changes.

  ## Examples

      iex> change_postsek(postsek)
      %Ecto.Changeset{data: %Postsek{}}

  """
  def change_postsek(%Postsek{} = postsek, attrs \\ %{}) do
    Postsek.changeset(postsek, attrs)
  end
end
