defmodule Tailwindgen.Repo.Migrations.CreatePasta4s do
  use Ecto.Migration

  def change do
    create table(:pasta4s) do
      add :title, :string
      add :age, :integer

      timestamps()
    end

  end
end
