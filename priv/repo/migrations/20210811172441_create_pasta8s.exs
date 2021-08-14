defmodule Tailwindgen.Repo.Migrations.CreatePasta8s do
  use Ecto.Migration

  def change do
    create table(:pasta8s) do
      add :title, :string
      add :age, :integer
      add :stuff, :map

      timestamps()
    end

  end
end
