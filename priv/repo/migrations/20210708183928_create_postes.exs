defmodule Tailwindgen.Repo.Migrations.CreatePostes do
  use Ecto.Migration

  def change do
    create table(:postes) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
