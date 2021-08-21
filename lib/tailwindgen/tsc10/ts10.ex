defmodule Tailwindgen.Tsc10.Ts10 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ts10s" do
    field :age, :integer
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(ts10, attrs) do
    ts10
    |> cast(attrs, [:age, :title, :body])
    |> validate_required([:age, :title, :body])
  end
end
