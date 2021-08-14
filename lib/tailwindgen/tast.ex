defmodule Tailwindgen.Tast do
  @moduledoc """
  The Tast context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tast.Posta

  @doc """
  Returns the list of postas.

  ## Examples

      iex> list_postas()
      [%Posta{}, ...]

  """
  def list_postas do
    Repo.all(Posta)
  end

  @doc """
  Gets a single posta.

  Raises `Ecto.NoResultsError` if the Posta does not exist.

  ## Examples

      iex> get_posta!(123)
      %Posta{}

      iex> get_posta!(456)
      ** (Ecto.NoResultsError)

  """
  def get_posta!(id), do: Repo.get!(Posta, id)

  @doc """
  Creates a posta.

  ## Examples

      iex> create_posta(%{field: value})
      {:ok, %Posta{}}

      iex> create_posta(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_posta(attrs \\ %{}) do
    %Posta{}
    |> Posta.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a posta.

  ## Examples

      iex> update_posta(posta, %{field: new_value})
      {:ok, %Posta{}}

      iex> update_posta(posta, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_posta(%Posta{} = posta, attrs) do
    posta
    |> Posta.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a posta.

  ## Examples

      iex> delete_posta(posta)
      {:ok, %Posta{}}

      iex> delete_posta(posta)
      {:error, %Ecto.Changeset{}}

  """
  def delete_posta(%Posta{} = posta) do
    Repo.delete(posta)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking posta changes.

  ## Examples

      iex> change_posta(posta)
      %Ecto.Changeset{data: %Posta{}}

  """
  def change_posta(%Posta{} = posta, attrs \\ %{}) do
    Posta.changeset(posta, attrs)
  end
end
