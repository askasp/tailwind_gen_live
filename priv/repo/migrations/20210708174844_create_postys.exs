defmodule Tailwindgen.Repo.Migrations.CreatePostys do
  use Ecto.Migration

  def change do
    create table(:postys) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
