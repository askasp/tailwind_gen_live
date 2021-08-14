defmodule Tailwindgen.Repo.Migrations.CreatePasta5s do
  use Ecto.Migration

  def change do
    create table(:pasta5s) do
      add :title, :string
      add :age, :integer

      timestamps()
    end

  end
end
