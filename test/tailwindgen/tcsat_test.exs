defmodule Tailwindgen.TcsatTest do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tcsat

  describe "pastas" do
    alias Tailwindgen.Tcsat.Pasta

    @valid_attrs %{age: 42, title: "some title"}
    @update_attrs %{age: 43, title: "some updated title"}
    @invalid_attrs %{age: nil, title: nil}

    def pasta_fixture(attrs \\ %{}) do
      {:ok, pasta} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tcsat.create_pasta()

      pasta
    end

    test "list_pastas/0 returns all pastas" do
      pasta = pasta_fixture()
      assert Tcsat.list_pastas() == [pasta]
    end

    test "get_pasta!/1 returns the pasta with given id" do
      pasta = pasta_fixture()
      assert Tcsat.get_pasta!(pasta.id) == pasta
    end

    test "create_pasta/1 with valid data creates a pasta" do
      assert {:ok, %Pasta{} = pasta} = Tcsat.create_pasta(@valid_attrs)
      assert pasta.age == 42
      assert pasta.title == "some title"
    end

    test "create_pasta/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tcsat.create_pasta(@invalid_attrs)
    end

    test "update_pasta/2 with valid data updates the pasta" do
      pasta = pasta_fixture()
      assert {:ok, %Pasta{} = pasta} = Tcsat.update_pasta(pasta, @update_attrs)
      assert pasta.age == 43
      assert pasta.title == "some updated title"
    end

    test "update_pasta/2 with invalid data returns error changeset" do
      pasta = pasta_fixture()
      assert {:error, %Ecto.Changeset{}} = Tcsat.update_pasta(pasta, @invalid_attrs)
      assert pasta == Tcsat.get_pasta!(pasta.id)
    end

    test "delete_pasta/1 deletes the pasta" do
      pasta = pasta_fixture()
      assert {:ok, %Pasta{}} = Tcsat.delete_pasta(pasta)
      assert_raise Ecto.NoResultsError, fn -> Tcsat.get_pasta!(pasta.id) end
    end

    test "change_pasta/1 returns a pasta changeset" do
      pasta = pasta_fixture()
      assert %Ecto.Changeset{} = Tcsat.change_pasta(pasta)
    end
  end
end
