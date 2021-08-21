defmodule Tailwindgen.Repo.Migrations.CreateTs13s do
  use Ecto.Migration

  def change do
    create table(:ts13s) do
      add :age, :integer
      add :title, :text
      add :body, :string

      timestamps()
    end

  end
end
