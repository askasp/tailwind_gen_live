defmodule Tailwindgen.Repo.Migrations.CreateTs10s do
  use Ecto.Migration

  def change do
    create table(:ts10s) do
      add :age, :integer
      add :title, :text
      add :body, :string

      timestamps()
    end

  end
end
