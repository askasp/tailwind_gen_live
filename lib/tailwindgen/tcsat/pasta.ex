defmodule Tailwindgen.Tcsat.Pasta do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pastas" do
    field :age, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(pasta, attrs) do
    pasta
    |> cast(attrs, [:title, :age])
    |> validate_required([:title, :age])
  end
end
