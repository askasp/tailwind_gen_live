defmodule Tailwindgen.Test8.Post8 do
  use Ecto.Schema
  import Ecto.Changeset

  schema "post8s" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post8, attrs) do
    post8
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
