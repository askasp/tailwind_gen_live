defmodule Tailwindgen.Test4 do
  @moduledoc """
  The Test4 context.
  """

  import Ecto.Query, warn: false
  alias Tailwindgen.Repo

  alias Tailwindgen.Test4.Postfire

  @doc """
  Returns the list of postfire.

  ## Examples

      iex> list_postfire()
      [%Postfire{}, ...]

  """
  def list_postfire do
    Repo.all(Postfire)
  end

  @doc """
  Gets a single postfire.

  Raises `Ecto.NoResultsError` if the Postfire does not exist.

  ## Examples

      iex> get_postfire!(123)
      %Postfire{}

      iex> get_postfire!(456)
      ** (Ecto.NoResultsError)

  """
  def get_postfire!(id), do: Repo.get!(Postfire, id)

  @doc """
  Creates a postfire.

  ## Examples

      iex> create_postfire(%{field: value})
      {:ok, %Postfire{}}

      iex> create_postfire(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_postfire(attrs \\ %{}) do
    %Postfire{}
    |> Postfire.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a postfire.

  ## Examples

      iex> update_postfire(postfire, %{field: new_value})
      {:ok, %Postfire{}}

      iex> update_postfire(postfire, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_postfire(%Postfire{} = postfire, attrs) do
    postfire
    |> Postfire.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a postfire.

  ## Examples

      iex> delete_postfire(postfire)
      {:ok, %Postfire{}}

      iex> delete_postfire(postfire)
      {:error, %Ecto.Changeset{}}

  """
  def delete_postfire(%Postfire{} = postfire) do
    Repo.delete(postfire)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking postfire changes.

  ## Examples

      iex> change_postfire(postfire)
      %Ecto.Changeset{data: %Postfire{}}

  """
  def change_postfire(%Postfire{} = postfire, attrs \\ %{}) do
    Postfire.changeset(postfire, attrs)
  end
end
