defmodule Tailwindgen.Tost.Posto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "postos" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(posto, attrs) do
    posto
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
