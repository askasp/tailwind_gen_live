defmodule Tailwindgen.Repo.Migrations.CreatePostseks do
  use Ecto.Migration

  def change do
    create table(:postseks) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
