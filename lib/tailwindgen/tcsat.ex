defmodule Tailwindgen.Tcsat do
  @moduledoc """
  The Tcsat context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Tcsat.Pasta

  @doc """
  Returns the list of pastas.

  ## Examples

      iex> list_pastas()
      [%Pasta{}, ...]

  """
  def list_pastas do
    Repo.all(Pasta)
  end

  @doc """
  Gets a single pasta.

  Raises `Ecto.NoResultsError` if the Pasta does not exist.

  ## Examples

      iex> get_pasta!(123)
      %Pasta{}

      iex> get_pasta!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pasta!(id), do: Repo.get!(Pasta, id)

  @doc """
  Creates a pasta.

  ## Examples

      iex> create_pasta(%{field: value})
      {:ok, %Pasta{}}

      iex> create_pasta(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pasta(attrs \\ %{}) do
    %Pasta{}
    |> Pasta.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pasta.

  ## Examples

      iex> update_pasta(pasta, %{field: new_value})
      {:ok, %Pasta{}}

      iex> update_pasta(pasta, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pasta(%Pasta{} = pasta, attrs) do
    pasta
    |> Pasta.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pasta.

  ## Examples

      iex> delete_pasta(pasta)
      {:ok, %Pasta{}}

      iex> delete_pasta(pasta)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pasta(%Pasta{} = pasta) do
    Repo.delete(pasta)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pasta changes.

  ## Examples

      iex> change_pasta(pasta)
      %Ecto.Changeset{data: %Pasta{}}

  """
  def change_pasta(%Pasta{} = pasta, attrs \\ %{}) do
    Pasta.changeset(pasta, attrs)
  end
end
