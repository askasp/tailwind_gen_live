defmodule Tailwindgen.Tcsat6Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tcsat6

  describe "pasta6s" do
    alias Tailwindgen.Tcsat6.Pasta6

    @valid_attrs %{age: 42, title: "some title"}
    @update_attrs %{age: 43, title: "some updated title"}
    @invalid_attrs %{age: nil, title: nil}

    def pasta6_fixture(attrs \\ %{}) do
      {:ok, pasta6} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tcsat6.create_pasta6()

      pasta6
    end

    test "list_pasta6s/0 returns all pasta6s" do
      pasta6 = pasta6_fixture()
      assert Tcsat6.list_pasta6s() == [pasta6]
    end

    test "get_pasta6!/1 returns the pasta6 with given id" do
      pasta6 = pasta6_fixture()
      assert Tcsat6.get_pasta6!(pasta6.id) == pasta6
    end

    test "create_pasta6/1 with valid data creates a pasta6" do
      assert {:ok, %Pasta6{} = pasta6} = Tcsat6.create_pasta6(@valid_attrs)
      assert pasta6.age == 42
      assert pasta6.title == "some title"
    end

    test "create_pasta6/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tcsat6.create_pasta6(@invalid_attrs)
    end

    test "update_pasta6/2 with valid data updates the pasta6" do
      pasta6 = pasta6_fixture()
      assert {:ok, %Pasta6{} = pasta6} = Tcsat6.update_pasta6(pasta6, @update_attrs)
      assert pasta6.age == 43
      assert pasta6.title == "some updated title"
    end

    test "update_pasta6/2 with invalid data returns error changeset" do
      pasta6 = pasta6_fixture()
      assert {:error, %Ecto.Changeset{}} = Tcsat6.update_pasta6(pasta6, @invalid_attrs)
      assert pasta6 == Tcsat6.get_pasta6!(pasta6.id)
    end

    test "delete_pasta6/1 deletes the pasta6" do
      pasta6 = pasta6_fixture()
      assert {:ok, %Pasta6{}} = Tcsat6.delete_pasta6(pasta6)
      assert_raise Ecto.NoResultsError, fn -> Tcsat6.get_pasta6!(pasta6.id) end
    end

    test "change_pasta6/1 returns a pasta6 changeset" do
      pasta6 = pasta6_fixture()
      assert %Ecto.Changeset{} = Tcsat6.change_pasta6(pasta6)
    end
  end
end
