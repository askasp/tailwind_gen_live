defmodule Tailwindgen.Tcsat8.Pasta8 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pasta8s" do
    field :age, :integer
    field :stuff, :map
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(pasta8, attrs) do
    pasta8
    |> cast(attrs, [:title, :age, :stuff])
    |> validate_required([:title, :age, :stuff])
  end
end
