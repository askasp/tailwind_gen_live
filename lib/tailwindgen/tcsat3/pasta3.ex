defmodule Tailwindgen.Tcsat3.Pasta3 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pasta3s" do
    field :age, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(pasta3, attrs) do
    pasta3
    |> cast(attrs, [:title, :age])
    |> validate_required([:title, :age])
  end
end
