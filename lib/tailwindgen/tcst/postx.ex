defmodule Tailwindgen.Tcst.Postx do
  use Ecto.Schema
  import Ecto.Changeset

  schema "postvsxtitle" do
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(postx, attrs) do
    postx
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
