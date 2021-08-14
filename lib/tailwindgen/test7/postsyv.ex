defmodule Tailwindgen.Test7.Postsyv do
  use Ecto.Schema
  import Ecto.Changeset

  schema "postsyvs" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(postsyv, attrs) do
    postsyv
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
