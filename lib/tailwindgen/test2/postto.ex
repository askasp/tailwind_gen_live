defmodule Tailwindgen.Test2.Postto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "poststo" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(postto, attrs) do
    postto
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
