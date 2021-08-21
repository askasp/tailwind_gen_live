defmodule Tailwindgen.Tsc13.Ts13 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ts13s" do
    field :age, :integer
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(ts13, attrs) do
    ts13
    |> cast(attrs, [:age, :title, :body])
    |> validate_required([:age, :title, :body])
  end
end
