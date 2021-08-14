defmodule Tailwindgen.Tyst do
  @moduledoc """
  The Tyst context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tyst.Posty

  @doc """
  Returns the list of postys.

  ## Examples

      iex> list_postys()
      [%Posty{}, ...]

  """
  def list_postys do
    Repo.all(Posty)
  end

  @doc """
  Gets a single posty.

  Raises `Ecto.NoResultsError` if the Posty does not exist.

  ## Examples

      iex> get_posty!(123)
      %Posty{}

      iex> get_posty!(456)
      ** (Ecto.NoResultsError)

  """
  def get_posty!(id), do: Repo.get!(Posty, id)

  @doc """
  Creates a posty.

  ## Examples

      iex> create_posty(%{field: value})
      {:ok, %Posty{}}

      iex> create_posty(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_posty(attrs \\ %{}) do
    %Posty{}
    |> Posty.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a posty.

  ## Examples

      iex> update_posty(posty, %{field: new_value})
      {:ok, %Posty{}}

      iex> update_posty(posty, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_posty(%Posty{} = posty, attrs) do
    posty
    |> Posty.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a posty.

  ## Examples

      iex> delete_posty(posty)
      {:ok, %Posty{}}

      iex> delete_posty(posty)
      {:error, %Ecto.Changeset{}}

  """
  def delete_posty(%Posty{} = posty) do
    Repo.delete(posty)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking posty changes.

  ## Examples

      iex> change_posty(posty)
      %Ecto.Changeset{data: %Posty{}}

  """
  def change_posty(%Posty{} = posty, attrs \\ %{}) do
    Posty.changeset(posty, attrs)
  end
end
