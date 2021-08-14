defmodule Tailwindgen.Test7 do
  @moduledoc """
  The Test7 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Test7.Postsyv

  @doc """
  Returns the list of postsyvs.

  ## Examples

      iex> list_postsyvs()
      [%Postsyv{}, ...]

  """
  def list_postsyvs do
    Repo.all(Postsyv)
  end

  @doc """
  Gets a single postsyv.

  Raises `Ecto.NoResultsError` if the Postsyv does not exist.

  ## Examples

      iex> get_postsyv!(123)
      %Postsyv{}

      iex> get_postsyv!(456)
      ** (Ecto.NoResultsError)

  """
  def get_postsyv!(id), do: Repo.get!(Postsyv, id)

  @doc """
  Creates a postsyv.

  ## Examples

      iex> create_postsyv(%{field: value})
      {:ok, %Postsyv{}}

      iex> create_postsyv(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_postsyv(attrs \\ %{}) do
    %Postsyv{}
    |> Postsyv.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a postsyv.

  ## Examples

      iex> update_postsyv(postsyv, %{field: new_value})
      {:ok, %Postsyv{}}

      iex> update_postsyv(postsyv, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_postsyv(%Postsyv{} = postsyv, attrs) do
    postsyv
    |> Postsyv.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a postsyv.

  ## Examples

      iex> delete_postsyv(postsyv)
      {:ok, %Postsyv{}}

      iex> delete_postsyv(postsyv)
      {:error, %Ecto.Changeset{}}

  """
  def delete_postsyv(%Postsyv{} = postsyv) do
    Repo.delete(postsyv)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking postsyv changes.

  ## Examples

      iex> change_postsyv(postsyv)
      %Ecto.Changeset{data: %Postsyv{}}

  """
  def change_postsyv(%Postsyv{} = postsyv, attrs \\ %{}) do
    Postsyv.changeset(postsyv, attrs)
  end
end
