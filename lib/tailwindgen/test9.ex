defmodule Tailwindgen.Test9 do
  @moduledoc """
  The Test9 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Test9.Post9

  @doc """
  Returns the list of post9s.

  ## Examples

      iex> list_post9s()
      [%Post9{}, ...]

  """
  def list_post9s do
    Repo.all(Post9)
  end

  @doc """
  Gets a single post9.

  Raises `Ecto.NoResultsError` if the Post9 does not exist.

  ## Examples

      iex> get_post9!(123)
      %Post9{}

      iex> get_post9!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post9!(id), do: Repo.get!(Post9, id)

  @doc """
  Creates a post9.

  ## Examples

      iex> create_post9(%{field: value})
      {:ok, %Post9{}}

      iex> create_post9(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post9(attrs \\ %{}) do
    %Post9{}
    |> Post9.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post9.

  ## Examples

      iex> update_post9(post9, %{field: new_value})
      {:ok, %Post9{}}

      iex> update_post9(post9, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post9(%Post9{} = post9, attrs) do
    post9
    |> Post9.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post9.

  ## Examples

      iex> delete_post9(post9)
      {:ok, %Post9{}}

      iex> delete_post9(post9)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post9(%Post9{} = post9) do
    Repo.delete(post9)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post9 changes.

  ## Examples

      iex> change_post9(post9)
      %Ecto.Changeset{data: %Post9{}}

  """
  def change_post9(%Post9{} = post9, attrs \\ %{}) do
    Post9.changeset(post9, attrs)
  end
end
