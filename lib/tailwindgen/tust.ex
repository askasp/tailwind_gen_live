defmodule Tailwindgen.Tust do
  @moduledoc """
  The Tust context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tust.Postu

  @doc """
  Returns the list of postus.

  ## Examples

      iex> list_postus()
      [%Postu{}, ...]

  """
  def list_postus do
    Repo.all(Postu)
  end

  @doc """
  Gets a single postu.

  Raises `Ecto.NoResultsError` if the Postu does not exist.

  ## Examples

      iex> get_postu!(123)
      %Postu{}

      iex> get_postu!(456)
      ** (Ecto.NoResultsError)

  """
  def get_postu!(id), do: Repo.get!(Postu, id)

  @doc """
  Creates a postu.

  ## Examples

      iex> create_postu(%{field: value})
      {:ok, %Postu{}}

      iex> create_postu(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_postu(attrs \\ %{}) do
    %Postu{}
    |> Postu.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a postu.

  ## Examples

      iex> update_postu(postu, %{field: new_value})
      {:ok, %Postu{}}

      iex> update_postu(postu, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_postu(%Postu{} = postu, attrs) do
    postu
    |> Postu.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a postu.

  ## Examples

      iex> delete_postu(postu)
      {:ok, %Postu{}}

      iex> delete_postu(postu)
      {:error, %Ecto.Changeset{}}

  """
  def delete_postu(%Postu{} = postu) do
    Repo.delete(postu)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking postu changes.

  ## Examples

      iex> change_postu(postu)
      %Ecto.Changeset{data: %Postu{}}

  """
  def change_postu(%Postu{} = postu, attrs \\ %{}) do
    Postu.changeset(postu, attrs)
  end
end
