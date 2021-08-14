defmodule Tailwindgen.Test3.Posttre do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posttre" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(posttre, attrs) do
    posttre
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
