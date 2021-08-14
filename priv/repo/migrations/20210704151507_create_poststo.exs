defmodule Tailwindgen.Repo.Migrations.CreatePoststo do
  use Ecto.Migration

  def change do
    create table(:poststo) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
