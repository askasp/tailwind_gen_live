defmodule Tailwindgen.Repo.Migrations.CreatePasta9s do
  use Ecto.Migration

  def change do
    create table(:pasta9s) do
      add :title, :string
      add :age, :integer
      add :stuff, :map

      timestamps()
    end

  end
end
