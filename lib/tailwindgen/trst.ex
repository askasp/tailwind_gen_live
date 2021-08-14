defmodule Tailwindgen.Trst do
  @moduledoc """
  The Trst context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Trst.Postv

  @doc """
  Returns the list of postvs.

  ## Examples

      iex> list_postvs()
      [%Postv{}, ...]

  """
  def list_postvs do
    Repo.all(Postv)
  end

  @doc """
  Gets a single postv.

  Raises `Ecto.NoResultsError` if the Postv does not exist.

  ## Examples

      iex> get_postv!(123)
      %Postv{}

      iex> get_postv!(456)
      ** (Ecto.NoResultsError)

  """
  def get_postv!(id), do: Repo.get!(Postv, id)

  @doc """
  Creates a postv.

  ## Examples

      iex> create_postv(%{field: value})
      {:ok, %Postv{}}

      iex> create_postv(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_postv(attrs \\ %{}) do
    %Postv{}
    |> Postv.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a postv.

  ## Examples

      iex> update_postv(postv, %{field: new_value})
      {:ok, %Postv{}}

      iex> update_postv(postv, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_postv(%Postv{} = postv, attrs) do
    postv
    |> Postv.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a postv.

  ## Examples

      iex> delete_postv(postv)
      {:ok, %Postv{}}

      iex> delete_postv(postv)
      {:error, %Ecto.Changeset{}}

  """
  def delete_postv(%Postv{} = postv) do
    Repo.delete(postv)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking postv changes.

  ## Examples

      iex> change_postv(postv)
      %Ecto.Changeset{data: %Postv{}}

  """
  def change_postv(%Postv{} = postv, attrs \\ %{}) do
    Postv.changeset(postv, attrs)
  end
end
