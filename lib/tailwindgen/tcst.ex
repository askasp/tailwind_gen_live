defmodule Tailwindgen.Tcst do
  @moduledoc """
  The Tcst context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tcst.Postx

  @doc """
  Returns the list of postvsxtitle.

  ## Examples

      iex> list_postvsxtitle()
      [%Postx{}, ...]

  """
  def list_postvsxtitle do
    Repo.all(Postx)
  end

  @doc """
  Gets a single postx.

  Raises `Ecto.NoResultsError` if the Postx does not exist.

  ## Examples

      iex> get_postx!(123)
      %Postx{}

      iex> get_postx!(456)
      ** (Ecto.NoResultsError)

  """
  def get_postx!(id), do: Repo.get!(Postx, id)

  @doc """
  Creates a postx.

  ## Examples

      iex> create_postx(%{field: value})
      {:ok, %Postx{}}

      iex> create_postx(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_postx(attrs \\ %{}) do
    %Postx{}
    |> Postx.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a postx.

  ## Examples

      iex> update_postx(postx, %{field: new_value})
      {:ok, %Postx{}}

      iex> update_postx(postx, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_postx(%Postx{} = postx, attrs) do
    postx
    |> Postx.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a postx.

  ## Examples

      iex> delete_postx(postx)
      {:ok, %Postx{}}

      iex> delete_postx(postx)
      {:error, %Ecto.Changeset{}}

  """
  def delete_postx(%Postx{} = postx) do
    Repo.delete(postx)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking postx changes.

  ## Examples

      iex> change_postx(postx)
      %Ecto.Changeset{data: %Postx{}}

  """
  def change_postx(%Postx{} = postx, attrs \\ %{}) do
    Postx.changeset(postx, attrs)
  end
end
