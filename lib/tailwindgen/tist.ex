defmodule Tailwindgen.Tist do
  @moduledoc """
  The Tist context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tist.Posti

  @doc """
  Returns the list of postis.

  ## Examples

      iex> list_postis()
      [%Posti{}, ...]

  """
  def list_postis do
    Repo.all(Posti)
  end

  @doc """
  Gets a single posti.

  Raises `Ecto.NoResultsError` if the Posti does not exist.

  ## Examples

      iex> get_posti!(123)
      %Posti{}

      iex> get_posti!(456)
      ** (Ecto.NoResultsError)

  """
  def get_posti!(id), do: Repo.get!(Posti, id)

  @doc """
  Creates a posti.

  ## Examples

      iex> create_posti(%{field: value})
      {:ok, %Posti{}}

      iex> create_posti(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_posti(attrs \\ %{}) do
    %Posti{}
    |> Posti.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a posti.

  ## Examples

      iex> update_posti(posti, %{field: new_value})
      {:ok, %Posti{}}

      iex> update_posti(posti, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_posti(%Posti{} = posti, attrs) do
    posti
    |> Posti.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a posti.

  ## Examples

      iex> delete_posti(posti)
      {:ok, %Posti{}}

      iex> delete_posti(posti)
      {:error, %Ecto.Changeset{}}

  """
  def delete_posti(%Posti{} = posti) do
    Repo.delete(posti)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking posti changes.

  ## Examples

      iex> change_posti(posti)
      %Ecto.Changeset{data: %Posti{}}

  """
  def change_posti(%Posti{} = posti, attrs \\ %{}) do
    Posti.changeset(posti, attrs)
  end
end
