defmodule Tailwindgen.Tcsat4.Pasta4 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pasta4s" do
    field :age, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(pasta4, attrs) do
    pasta4
    |> cast(attrs, [:title, :age])
    |> validate_required([:title, :age])
  end
end
