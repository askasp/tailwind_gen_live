defmodule Tailwindgen.Test5 do
  @moduledoc """
  The Test5 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Test5.Postfem

  @doc """
  Returns the list of postfems.

  ## Examples

      iex> list_postfems()
      [%Postfem{}, ...]

  """
  def list_postfems do
    Repo.all(Postfem)
  end

  @doc """
  Gets a single postfem.

  Raises `Ecto.NoResultsError` if the Postfem does not exist.

  ## Examples

      iex> get_postfem!(123)
      %Postfem{}

      iex> get_postfem!(456)
      ** (Ecto.NoResultsError)

  """
  def get_postfem!(id), do: Repo.get!(Postfem, id)

  @doc """
  Creates a postfem.

  ## Examples

      iex> create_postfem(%{field: value})
      {:ok, %Postfem{}}

      iex> create_postfem(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_postfem(attrs \\ %{}) do
    %Postfem{}
    |> Postfem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a postfem.

  ## Examples

      iex> update_postfem(postfem, %{field: new_value})
      {:ok, %Postfem{}}

      iex> update_postfem(postfem, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_postfem(%Postfem{} = postfem, attrs) do
    postfem
    |> Postfem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a postfem.

  ## Examples

      iex> delete_postfem(postfem)
      {:ok, %Postfem{}}

      iex> delete_postfem(postfem)
      {:error, %Ecto.Changeset{}}

  """
  def delete_postfem(%Postfem{} = postfem) do
    Repo.delete(postfem)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking postfem changes.

  ## Examples

      iex> change_postfem(postfem)
      %Ecto.Changeset{data: %Postfem{}}

  """
  def change_postfem(%Postfem{} = postfem, attrs \\ %{}) do
    Postfem.changeset(postfem, attrs)
  end
end
