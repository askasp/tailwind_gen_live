defmodule Tailwindgen.Tgst do
  @moduledoc """
  The Tgst context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tgst.Poste

  @doc """
  Returns the list of postes.

  ## Examples

      iex> list_postes()
      [%Poste{}, ...]

  """
  def list_postes do
    Repo.all(Poste)
  end

  @doc """
  Gets a single poste.

  Raises `Ecto.NoResultsError` if the Poste does not exist.

  ## Examples

      iex> get_poste!(123)
      %Poste{}

      iex> get_poste!(456)
      ** (Ecto.NoResultsError)

  """
  def get_poste!(id), do: Repo.get!(Poste, id)

  @doc """
  Creates a poste.

  ## Examples

      iex> create_poste(%{field: value})
      {:ok, %Poste{}}

      iex> create_poste(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_poste(attrs \\ %{}) do
    %Poste{}
    |> Poste.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a poste.

  ## Examples

      iex> update_poste(poste, %{field: new_value})
      {:ok, %Poste{}}

      iex> update_poste(poste, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_poste(%Poste{} = poste, attrs) do
    poste
    |> Poste.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a poste.

  ## Examples

      iex> delete_poste(poste)
      {:ok, %Poste{}}

      iex> delete_poste(poste)
      {:error, %Ecto.Changeset{}}

  """
  def delete_poste(%Poste{} = poste) do
    Repo.delete(poste)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking poste changes.

  ## Examples

      iex> change_poste(poste)
      %Ecto.Changeset{data: %Poste{}}

  """
  def change_poste(%Poste{} = poste, attrs \\ %{}) do
    Poste.changeset(poste, attrs)
  end
end
