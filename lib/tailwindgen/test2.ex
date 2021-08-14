defmodule Tailwindgen.Test2 do
  @moduledoc """
  The Test2 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Test2.Postto

  @doc """
  Returns the list of poststo.

  ## Examples

      iex> list_poststo()
      [%Postto{}, ...]

  """
  def list_poststo do
    Repo.all(Postto)
  end

  @doc """
  Gets a single postto.

  Raises `Ecto.NoResultsError` if the Postto does not exist.

  ## Examples

      iex> get_postto!(123)
      %Postto{}

      iex> get_postto!(456)
      ** (Ecto.NoResultsError)

  """
  def get_postto!(id), do: Repo.get!(Postto, id)

  @doc """
  Creates a postto.

  ## Examples

      iex> create_postto(%{field: value})
      {:ok, %Postto{}}

      iex> create_postto(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_postto(attrs \\ %{}) do
    %Postto{}
    |> Postto.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a postto.

  ## Examples

      iex> update_postto(postto, %{field: new_value})
      {:ok, %Postto{}}

      iex> update_postto(postto, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_postto(%Postto{} = postto, attrs) do
    postto
    |> Postto.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a postto.

  ## Examples

      iex> delete_postto(postto)
      {:ok, %Postto{}}

      iex> delete_postto(postto)
      {:error, %Ecto.Changeset{}}

  """
  def delete_postto(%Postto{} = postto) do
    Repo.delete(postto)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking postto changes.

  ## Examples

      iex> change_postto(postto)
      %Ecto.Changeset{data: %Postto{}}

  """
  def change_postto(%Postto{} = postto, attrs \\ %{}) do
    Postto.changeset(postto, attrs)
  end
end
