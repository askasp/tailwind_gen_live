defmodule Tailwindgen.Tcsat9.Pasta9 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pasta9s" do
    field :age, :integer
    field :stuff, :map
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(pasta9, attrs) do
    pasta9
    |> cast(attrs, [:title, :age, :stuff])
    |> validate_required([:title, :age, :stuff])
  end
end
