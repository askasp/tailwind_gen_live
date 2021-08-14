defmodule Tailwindgen.Repo.Migrations.CreatePastas do
  use Ecto.Migration

  def change do
    create table(:pastas) do
      add :title, :string
      add :age, :integer

      timestamps()
    end

  end
end
