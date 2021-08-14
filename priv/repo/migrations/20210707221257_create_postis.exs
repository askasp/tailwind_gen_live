defmodule Tailwindgen.Repo.Migrations.CreatePostis do
  use Ecto.Migration

  def change do
    create table(:postis) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
