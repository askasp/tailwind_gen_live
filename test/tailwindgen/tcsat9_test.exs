defmodule Tailwindgen.Tcsat9Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tcsat9

  describe "pasta9s" do
    alias Tailwindgen.Tcsat9.Pasta9

    @valid_attrs %{age: 42, stuff: %{}, title: "some title"}
    @update_attrs %{age: 43, stuff: %{}, title: "some updated title"}
    @invalid_attrs %{age: nil, stuff: nil, title: nil}

    def pasta9_fixture(attrs \\ %{}) do
      {:ok, pasta9} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tcsat9.create_pasta9()

      pasta9
    end

    test "list_pasta9s/0 returns all pasta9s" do
      pasta9 = pasta9_fixture()
      assert Tcsat9.list_pasta9s() == [pasta9]
    end

    test "get_pasta9!/1 returns the pasta9 with given id" do
      pasta9 = pasta9_fixture()
      assert Tcsat9.get_pasta9!(pasta9.id) == pasta9
    end

    test "create_pasta9/1 with valid data creates a pasta9" do
      assert {:ok, %Pasta9{} = pasta9} = Tcsat9.create_pasta9(@valid_attrs)
      assert pasta9.age == 42
      assert pasta9.stuff == %{}
      assert pasta9.title == "some title"
    end

    test "create_pasta9/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tcsat9.create_pasta9(@invalid_attrs)
    end

    test "update_pasta9/2 with valid data updates the pasta9" do
      pasta9 = pasta9_fixture()
      assert {:ok, %Pasta9{} = pasta9} = Tcsat9.update_pasta9(pasta9, @update_attrs)
      assert pasta9.age == 43
      assert pasta9.stuff == %{}
      assert pasta9.title == "some updated title"
    end

    test "update_pasta9/2 with invalid data returns error changeset" do
      pasta9 = pasta9_fixture()
      assert {:error, %Ecto.Changeset{}} = Tcsat9.update_pasta9(pasta9, @invalid_attrs)
      assert pasta9 == Tcsat9.get_pasta9!(pasta9.id)
    end

    test "delete_pasta9/1 deletes the pasta9" do
      pasta9 = pasta9_fixture()
      assert {:ok, %Pasta9{}} = Tcsat9.delete_pasta9(pasta9)
      assert_raise Ecto.NoResultsError, fn -> Tcsat9.get_pasta9!(pasta9.id) end
    end

    test "change_pasta9/1 returns a pasta9 changeset" do
      pasta9 = pasta9_fixture()
      assert %Ecto.Changeset{} = Tcsat9.change_pasta9(pasta9)
    end
  end
end
