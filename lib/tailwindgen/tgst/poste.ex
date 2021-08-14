defmodule Tailwindgen.Tgst.Poste do
  use Ecto.Schema
  import Ecto.Changeset

  schema "postes" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(poste, attrs) do
    poste
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
