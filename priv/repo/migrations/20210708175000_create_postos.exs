defmodule Tailwindgen.Repo.Migrations.CreatePostos do
  use Ecto.Migration

  def change do
    create table(:postos) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
