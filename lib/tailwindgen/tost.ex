defmodule Tailwindgen.Tost do
  @moduledoc """
  The Tost context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tost.Posto

  @doc """
  Returns the list of postos.

  ## Examples

      iex> list_postos()
      [%Posto{}, ...]

  """
  def list_postos do
    Repo.all(Posto)
  end

  @doc """
  Gets a single posto.

  Raises `Ecto.NoResultsError` if the Posto does not exist.

  ## Examples

      iex> get_posto!(123)
      %Posto{}

      iex> get_posto!(456)
      ** (Ecto.NoResultsError)

  """
  def get_posto!(id), do: Repo.get!(Posto, id)

  @doc """
  Creates a posto.

  ## Examples

      iex> create_posto(%{field: value})
      {:ok, %Posto{}}

      iex> create_posto(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_posto(attrs \\ %{}) do
    %Posto{}
    |> Posto.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a posto.

  ## Examples

      iex> update_posto(posto, %{field: new_value})
      {:ok, %Posto{}}

      iex> update_posto(posto, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_posto(%Posto{} = posto, attrs) do
    posto
    |> Posto.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a posto.

  ## Examples

      iex> delete_posto(posto)
      {:ok, %Posto{}}

      iex> delete_posto(posto)
      {:error, %Ecto.Changeset{}}

  """
  def delete_posto(%Posto{} = posto) do
    Repo.delete(posto)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking posto changes.

  ## Examples

      iex> change_posto(posto)
      %Ecto.Changeset{data: %Posto{}}

  """
  def change_posto(%Posto{} = posto, attrs \\ %{}) do
    Posto.changeset(posto, attrs)
  end
end
