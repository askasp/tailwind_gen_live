defmodule Tailwindgen.Repo.Migrations.CreatePosttre do
  use Ecto.Migration

  def change do
    create table(:posttre) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
