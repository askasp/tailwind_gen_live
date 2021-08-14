defmodule Tailwindgen.Repo.Migrations.CreatePost9s do
  use Ecto.Migration

  def change do
    create table(:post9s) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
