defmodule Tailwindgen.Test4.Postfire do
  use Ecto.Schema
  import Ecto.Changeset

  schema "postfire" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(postfire, attrs) do
    postfire
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
