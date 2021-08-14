defmodule Tailwindgen.Tcsat5Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tcsat5

  describe "pasta5s" do
    alias Tailwindgen.Tcsat5.Pasta5

    @valid_attrs %{age: 42, title: "some title"}
    @update_attrs %{age: 43, title: "some updated title"}
    @invalid_attrs %{age: nil, title: nil}

    def pasta5_fixture(attrs \\ %{}) do
      {:ok, pasta5} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tcsat5.create_pasta5()

      pasta5
    end

    test "list_pasta5s/0 returns all pasta5s" do
      pasta5 = pasta5_fixture()
      assert Tcsat5.list_pasta5s() == [pasta5]
    end

    test "get_pasta5!/1 returns the pasta5 with given id" do
      pasta5 = pasta5_fixture()
      assert Tcsat5.get_pasta5!(pasta5.id) == pasta5
    end

    test "create_pasta5/1 with valid data creates a pasta5" do
      assert {:ok, %Pasta5{} = pasta5} = Tcsat5.create_pasta5(@valid_attrs)
      assert pasta5.age == 42
      assert pasta5.title == "some title"
    end

    test "create_pasta5/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tcsat5.create_pasta5(@invalid_attrs)
    end

    test "update_pasta5/2 with valid data updates the pasta5" do
      pasta5 = pasta5_fixture()
      assert {:ok, %Pasta5{} = pasta5} = Tcsat5.update_pasta5(pasta5, @update_attrs)
      assert pasta5.age == 43
      assert pasta5.title == "some updated title"
    end

    test "update_pasta5/2 with invalid data returns error changeset" do
      pasta5 = pasta5_fixture()
      assert {:error, %Ecto.Changeset{}} = Tcsat5.update_pasta5(pasta5, @invalid_attrs)
      assert pasta5 == Tcsat5.get_pasta5!(pasta5.id)
    end

    test "delete_pasta5/1 deletes the pasta5" do
      pasta5 = pasta5_fixture()
      assert {:ok, %Pasta5{}} = Tcsat5.delete_pasta5(pasta5)
      assert_raise Ecto.NoResultsError, fn -> Tcsat5.get_pasta5!(pasta5.id) end
    end

    test "change_pasta5/1 returns a pasta5 changeset" do
      pasta5 = pasta5_fixture()
      assert %Ecto.Changeset{} = Tcsat5.change_pasta5(pasta5)
    end
  end
end
