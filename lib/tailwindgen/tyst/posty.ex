defmodule Tailwindgen.Tyst.Posty do
  use Ecto.Schema
  import Ecto.Changeset

  schema "postys" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(posty, attrs) do
    posty
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
