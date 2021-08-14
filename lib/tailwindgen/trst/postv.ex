defmodule Tailwindgen.Trst.Postv do
  use Ecto.Schema
  import Ecto.Changeset

  schema "postvs" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(postv, attrs) do
    postv
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
