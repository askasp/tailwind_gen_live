defmodule Tailwindgen.Repo.Migrations.CreatePasta3s do
  use Ecto.Migration

  def change do
    create table(:pasta3s) do
      add :title, :string
      add :age, :integer

      timestamps()
    end

  end
end
