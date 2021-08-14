defmodule Tailwindgen.Test8 do
  @moduledoc """
  The Test8 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Test8.Post8

  @doc """
  Returns the list of post8s.

  ## Examples

      iex> list_post8s()
      [%Post8{}, ...]

  """
  def list_post8s do
    Repo.all(Post8)
  end

  @doc """
  Gets a single post8.

  Raises `Ecto.NoResultsError` if the Post8 does not exist.

  ## Examples

      iex> get_post8!(123)
      %Post8{}

      iex> get_post8!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post8!(id), do: Repo.get!(Post8, id)

  @doc """
  Creates a post8.

  ## Examples

      iex> create_post8(%{field: value})
      {:ok, %Post8{}}

      iex> create_post8(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post8(attrs \\ %{}) do
    %Post8{}
    |> Post8.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post8.

  ## Examples

      iex> update_post8(post8, %{field: new_value})
      {:ok, %Post8{}}

      iex> update_post8(post8, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post8(%Post8{} = post8, attrs) do
    post8
    |> Post8.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post8.

  ## Examples

      iex> delete_post8(post8)
      {:ok, %Post8{}}

      iex> delete_post8(post8)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post8(%Post8{} = post8) do
    Repo.delete(post8)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post8 changes.

  ## Examples

      iex> change_post8(post8)
      %Ecto.Changeset{data: %Post8{}}

  """
  def change_post8(%Post8{} = post8, attrs \\ %{}) do
    Post8.changeset(post8, attrs)
  end
end
