defmodule Tailwindgen.Repo.Migrations.CreatePasta6s do
  use Ecto.Migration

  def change do
    create table(:pasta6s) do
      add :title, :string
      add :age, :integer

      timestamps()
    end

  end
end
