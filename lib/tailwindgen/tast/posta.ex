defmodule Tailwindgen.Tast.Posta do
  use Ecto.Schema
  import Ecto.Changeset

  schema "postas" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(posta, attrs) do
    posta
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
