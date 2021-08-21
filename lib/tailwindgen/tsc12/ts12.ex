defmodule Tailwindgen.Tsc12.Ts12 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ts12s" do
    field :age, :integer
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(ts12, attrs) do
    ts12
    |> cast(attrs, [:age, :title, :body])
    |> validate_required([:age, :title, :body])
  end
end
