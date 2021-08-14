defmodule Tailwindgen.Tcsat2.Pasta2 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pasta2s" do
    field :age, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(pasta2, attrs) do
    pasta2
    |> cast(attrs, [:title, :age])
    |> validate_required([:title, :age])
  end
end
