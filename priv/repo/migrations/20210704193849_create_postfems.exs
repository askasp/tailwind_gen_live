defmodule Tailwindgen.Repo.Migrations.CreatePostfems do
  use Ecto.Migration

  def change do
    create table(:postfems) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
