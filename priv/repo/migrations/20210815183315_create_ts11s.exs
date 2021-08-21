defmodule Tailwindgen.Repo.Migrations.CreateTs11s do
  use Ecto.Migration

  def change do
    create table(:ts11s) do
      add :age, :integer
      add :title, :text
      add :body, :string

      timestamps()
    end

  end
end
