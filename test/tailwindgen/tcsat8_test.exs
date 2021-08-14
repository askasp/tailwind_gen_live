defmodule Tailwindgen.Tcsat8Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tcsat8

  describe "pasta8s" do
    alias Tailwindgen.Tcsat8.Pasta8

    @valid_attrs %{age: 42, stuff: %{}, title: "some title"}
    @update_attrs %{age: 43, stuff: %{}, title: "some updated title"}
    @invalid_attrs %{age: nil, stuff: nil, title: nil}

    def pasta8_fixture(attrs \\ %{}) do
      {:ok, pasta8} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tcsat8.create_pasta8()

      pasta8
    end

    test "list_pasta8s/0 returns all pasta8s" do
      pasta8 = pasta8_fixture()
      assert Tcsat8.list_pasta8s() == [pasta8]
    end

    test "get_pasta8!/1 returns the pasta8 with given id" do
      pasta8 = pasta8_fixture()
      assert Tcsat8.get_pasta8!(pasta8.id) == pasta8
    end

    test "create_pasta8/1 with valid data creates a pasta8" do
      assert {:ok, %Pasta8{} = pasta8} = Tcsat8.create_pasta8(@valid_attrs)
      assert pasta8.age == 42
      assert pasta8.stuff == %{}
      assert pasta8.title == "some title"
    end

    test "create_pasta8/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tcsat8.create_pasta8(@invalid_attrs)
    end

    test "update_pasta8/2 with valid data updates the pasta8" do
      pasta8 = pasta8_fixture()
      assert {:ok, %Pasta8{} = pasta8} = Tcsat8.update_pasta8(pasta8, @update_attrs)
      assert pasta8.age == 43
      assert pasta8.stuff == %{}
      assert pasta8.title == "some updated title"
    end

    test "update_pasta8/2 with invalid data returns error changeset" do
      pasta8 = pasta8_fixture()
      assert {:error, %Ecto.Changeset{}} = Tcsat8.update_pasta8(pasta8, @invalid_attrs)
      assert pasta8 == Tcsat8.get_pasta8!(pasta8.id)
    end

    test "delete_pasta8/1 deletes the pasta8" do
      pasta8 = pasta8_fixture()
      assert {:ok, %Pasta8{}} = Tcsat8.delete_pasta8(pasta8)
      assert_raise Ecto.NoResultsError, fn -> Tcsat8.get_pasta8!(pasta8.id) end
    end

    test "change_pasta8/1 returns a pasta8 changeset" do
      pasta8 = pasta8_fixture()
      assert %Ecto.Changeset{} = Tcsat8.change_pasta8(pasta8)
    end
  end
end
