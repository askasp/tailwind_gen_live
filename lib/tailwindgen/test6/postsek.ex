defmodule Tailwindgen.Test6.Postsek do
  use Ecto.Schema
  import Ecto.Changeset

  schema "postseks" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(postsek, attrs) do
    postsek
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
