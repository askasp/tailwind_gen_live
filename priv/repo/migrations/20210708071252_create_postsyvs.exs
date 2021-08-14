defmodule Tailwindgen.Repo.Migrations.CreatePostsyvs do
  use Ecto.Migration

  def change do
    create table(:postsyvs) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
