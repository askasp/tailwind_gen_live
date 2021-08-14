defmodule Tailwindgen.Repo.Migrations.CreatePasta2s do
  use Ecto.Migration

  def change do
    create table(:pasta2s) do
      add :title, :string
      add :age, :integer

      timestamps()
    end

  end
end
