defmodule Tailwindgen.Repo.Migrations.CreatePostvsxtitle do
  use Ecto.Migration

  def change do
    create table(:postvsxtitle) do
      add :body, :text

      timestamps()
    end

  end
end
