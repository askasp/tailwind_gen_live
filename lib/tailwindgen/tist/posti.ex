defmodule Tailwindgen.Tist.Posti do
  use Ecto.Schema
  import Ecto.Changeset

  schema "postis" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(posti, attrs) do
    posti
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
