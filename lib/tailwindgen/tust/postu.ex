defmodule Tailwindgen.Tust.Postu do
  use Ecto.Schema
  import Ecto.Changeset

  schema "postus" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(postu, attrs) do
    postu
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
