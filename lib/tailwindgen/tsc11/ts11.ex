defmodule Tailwindgen.Tsc11.Ts11 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ts11s" do
    field :age, :integer
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(ts11, attrs) do
    ts11
    |> cast(attrs, [:age, :title, :body])
    |> validate_required([:age, :title, :body])
  end
end
