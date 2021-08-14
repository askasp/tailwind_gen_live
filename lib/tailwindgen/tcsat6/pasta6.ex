defmodule Tailwindgen.Tcsat6.Pasta6 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pasta6s" do
    field :age, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(pasta6, attrs) do
    pasta6
    |> cast(attrs, [:title, :age])
    |> validate_required([:title, :age])
  end
end
