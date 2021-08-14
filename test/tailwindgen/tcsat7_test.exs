defmodule Tailwindgen.Tcsat7Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tcsat7

  describe "pasta7s" do
    alias Tailwindgen.Tcsat7.Pasta7

    @valid_attrs %{age: 42, title: "some title"}
    @update_attrs %{age: 43, title: "some updated title"}
    @invalid_attrs %{age: nil, title: nil}

    def pasta7_fixture(attrs \\ %{}) do
      {:ok, pasta7} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tcsat7.create_pasta7()

      pasta7
    end

    test "list_pasta7s/0 returns all pasta7s" do
      pasta7 = pasta7_fixture()
      assert Tcsat7.list_pasta7s() == [pasta7]
    end

    test "get_pasta7!/1 returns the pasta7 with given id" do
      pasta7 = pasta7_fixture()
      assert Tcsat7.get_pasta7!(pasta7.id) == pasta7
    end

    test "create_pasta7/1 with valid data creates a pasta7" do
      assert {:ok, %Pasta7{} = pasta7} = Tcsat7.create_pasta7(@valid_attrs)
      assert pasta7.age == 42
      assert pasta7.title == "some title"
    end

    test "create_pasta7/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tcsat7.create_pasta7(@invalid_attrs)
    end

    test "update_pasta7/2 with valid data updates the pasta7" do
      pasta7 = pasta7_fixture()
      assert {:ok, %Pasta7{} = pasta7} = Tcsat7.update_pasta7(pasta7, @update_attrs)
      assert pasta7.age == 43
      assert pasta7.title == "some updated title"
    end

    test "update_pasta7/2 with invalid data returns error changeset" do
      pasta7 = pasta7_fixture()
      assert {:error, %Ecto.Changeset{}} = Tcsat7.update_pasta7(pasta7, @invalid_attrs)
      assert pasta7 == Tcsat7.get_pasta7!(pasta7.id)
    end

    test "delete_pasta7/1 deletes the pasta7" do
      pasta7 = pasta7_fixture()
      assert {:ok, %Pasta7{}} = Tcsat7.delete_pasta7(pasta7)
      assert_raise Ecto.NoResultsError, fn -> Tcsat7.get_pasta7!(pasta7.id) end
    end

    test "change_pasta7/1 returns a pasta7 changeset" do
      pasta7 = pasta7_fixture()
      assert %Ecto.Changeset{} = Tcsat7.change_pasta7(pasta7)
    end
  end
end
