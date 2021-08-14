defmodule Tailwindgen.Repo.Migrations.CreatePostas do
  use Ecto.Migration

  def change do
    create table(:postas) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
