defmodule Tailwindgen.Test3 do
  @moduledoc """
  The Test3 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Test3.Posttre

  @doc """
  Returns the list of posttre.

  ## Examples

      iex> list_posttre()
      [%Posttre{}, ...]

  """
  def list_posttre do
    Repo.all(Posttre)
  end

  @doc """
  Gets a single posttre.

  Raises `Ecto.NoResultsError` if the Posttre does not exist.

  ## Examples

      iex> get_posttre!(123)
      %Posttre{}

      iex> get_posttre!(456)
      ** (Ecto.NoResultsError)

  """
  def get_posttre!(id), do: Repo.get!(Posttre, id)

  @doc """
  Creates a posttre.

  ## Examples

      iex> create_posttre(%{field: value})
      {:ok, %Posttre{}}

      iex> create_posttre(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_posttre(attrs \\ %{}) do
    %Posttre{}
    |> Posttre.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a posttre.

  ## Examples

      iex> update_posttre(posttre, %{field: new_value})
      {:ok, %Posttre{}}

      iex> update_posttre(posttre, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_posttre(%Posttre{} = posttre, attrs) do
    posttre
    |> Posttre.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a posttre.

  ## Examples

      iex> delete_posttre(posttre)
      {:ok, %Posttre{}}

      iex> delete_posttre(posttre)
      {:error, %Ecto.Changeset{}}

  """
  def delete_posttre(%Posttre{} = posttre) do
    Repo.delete(posttre)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking posttre changes.

  ## Examples

      iex> change_posttre(posttre)
      %Ecto.Changeset{data: %Posttre{}}

  """
  def change_posttre(%Posttre{} = posttre, attrs \\ %{}) do
    Posttre.changeset(posttre, attrs)
  end
end
