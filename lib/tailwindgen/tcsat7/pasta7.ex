defmodule Tailwindgen.Tcsat7.Pasta7 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pasta7s" do
    field :age, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(pasta7, attrs) do
    pasta7
    |> cast(attrs, [:title, :age])
    |> validate_required([:title, :age])
  end
end
