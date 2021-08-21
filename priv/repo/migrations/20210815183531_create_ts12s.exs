defmodule Tailwindgen.Repo.Migrations.CreateTs12s do
  use Ecto.Migration

  def change do
    create table(:ts12s) do
      add :age, :integer
      add :title, :text
      add :body, :string

      timestamps()
    end

  end
end
