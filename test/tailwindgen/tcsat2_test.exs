defmodule Tailwindgen.Tcsat2Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tcsat2

  describe "pasta2s" do
    alias Tailwindgen.Tcsat2.Pasta2

    @valid_attrs %{age: 42, title: "some title"}
    @update_attrs %{age: 43, title: "some updated title"}
    @invalid_attrs %{age: nil, title: nil}

    def pasta2_fixture(attrs \\ %{}) do
      {:ok, pasta2} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tcsat2.create_pasta2()

      pasta2
    end

    test "list_pasta2s/0 returns all pasta2s" do
      pasta2 = pasta2_fixture()
      assert Tcsat2.list_pasta2s() == [pasta2]
    end

    test "get_pasta2!/1 returns the pasta2 with given id" do
      pasta2 = pasta2_fixture()
      assert Tcsat2.get_pasta2!(pasta2.id) == pasta2
    end

    test "create_pasta2/1 with valid data creates a pasta2" do
      assert {:ok, %Pasta2{} = pasta2} = Tcsat2.create_pasta2(@valid_attrs)
      assert pasta2.age == 42
      assert pasta2.title == "some title"
    end

    test "create_pasta2/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tcsat2.create_pasta2(@invalid_attrs)
    end

    test "update_pasta2/2 with valid data updates the pasta2" do
      pasta2 = pasta2_fixture()
      assert {:ok, %Pasta2{} = pasta2} = Tcsat2.update_pasta2(pasta2, @update_attrs)
      assert pasta2.age == 43
      assert pasta2.title == "some updated title"
    end

    test "update_pasta2/2 with invalid data returns error changeset" do
      pasta2 = pasta2_fixture()
      assert {:error, %Ecto.Changeset{}} = Tcsat2.update_pasta2(pasta2, @invalid_attrs)
      assert pasta2 == Tcsat2.get_pasta2!(pasta2.id)
    end

    test "delete_pasta2/1 deletes the pasta2" do
      pasta2 = pasta2_fixture()
      assert {:ok, %Pasta2{}} = Tcsat2.delete_pasta2(pasta2)
      assert_raise Ecto.NoResultsError, fn -> Tcsat2.get_pasta2!(pasta2.id) end
    end

    test "change_pasta2/1 returns a pasta2 changeset" do
      pasta2 = pasta2_fixture()
      assert %Ecto.Changeset{} = Tcsat2.change_pasta2(pasta2)
    end
  end
end
