defmodule Tailwindgen.Tcsat5.Pasta5 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pasta5s" do
    field :age, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(pasta5, attrs) do
    pasta5
    |> cast(attrs, [:title, :age])
    |> validate_required([:title, :age])
  end
end
