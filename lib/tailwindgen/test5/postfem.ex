defmodule Tailwindgen.Test5.Postfem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "postfems" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(postfem, attrs) do
    postfem
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
