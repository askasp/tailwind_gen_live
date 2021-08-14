defmodule Tailwindgen.Repo.Migrations.CreatePasta7s do
  use Ecto.Migration

  def change do
    create table(:pasta7s) do
      add :title, :string
      add :age, :integer

      timestamps()
    end

  end
end
