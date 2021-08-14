defmodule Tailwindgen.Tcsat3Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tcsat3

  describe "pasta3s" do
    alias Tailwindgen.Tcsat3.Pasta3

    @valid_attrs %{age: 42, title: "some title"}
    @update_attrs %{age: 43, title: "some updated title"}
    @invalid_attrs %{age: nil, title: nil}

    def pasta3_fixture(attrs \\ %{}) do
      {:ok, pasta3} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tcsat3.create_pasta3()

      pasta3
    end

    test "list_pasta3s/0 returns all pasta3s" do
      pasta3 = pasta3_fixture()
      assert Tcsat3.list_pasta3s() == [pasta3]
    end

    test "get_pasta3!/1 returns the pasta3 with given id" do
      pasta3 = pasta3_fixture()
      assert Tcsat3.get_pasta3!(pasta3.id) == pasta3
    end

    test "create_pasta3/1 with valid data creates a pasta3" do
      assert {:ok, %Pasta3{} = pasta3} = Tcsat3.create_pasta3(@valid_attrs)
      assert pasta3.age == 42
      assert pasta3.title == "some title"
    end

    test "create_pasta3/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tcsat3.create_pasta3(@invalid_attrs)
    end

    test "update_pasta3/2 with valid data updates the pasta3" do
      pasta3 = pasta3_fixture()
      assert {:ok, %Pasta3{} = pasta3} = Tcsat3.update_pasta3(pasta3, @update_attrs)
      assert pasta3.age == 43
      assert pasta3.title == "some updated title"
    end

    test "update_pasta3/2 with invalid data returns error changeset" do
      pasta3 = pasta3_fixture()
      assert {:error, %Ecto.Changeset{}} = Tcsat3.update_pasta3(pasta3, @invalid_attrs)
      assert pasta3 == Tcsat3.get_pasta3!(pasta3.id)
    end

    test "delete_pasta3/1 deletes the pasta3" do
      pasta3 = pasta3_fixture()
      assert {:ok, %Pasta3{}} = Tcsat3.delete_pasta3(pasta3)
      assert_raise Ecto.NoResultsError, fn -> Tcsat3.get_pasta3!(pasta3.id) end
    end

    test "change_pasta3/1 returns a pasta3 changeset" do
      pasta3 = pasta3_fixture()
      assert %Ecto.Changeset{} = Tcsat3.change_pasta3(pasta3)
    end
  end
end
