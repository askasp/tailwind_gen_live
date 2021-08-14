defmodule Tailwindgen.Repo.Migrations.CreatePost8s do
  use Ecto.Migration

  def change do
    create table(:post8s) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
