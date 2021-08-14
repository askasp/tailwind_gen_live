defmodule Tailwindgen.Test9.Post9 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "post9s" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post9, attrs) do
    post9
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
