defmodule Tailwindgen.Tcsat4Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tcsat4

  describe "pasta4s" do
    alias Tailwindgen.Tcsat4.Pasta4

    @valid_attrs %{age: 42, title: "some title"}
    @update_attrs %{age: 43, title: "some updated title"}
    @invalid_attrs %{age: nil, title: nil}

    def pasta4_fixture(attrs \\ %{}) do
      {:ok, pasta4} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tcsat4.create_pasta4()

      pasta4
    end

    test "list_pasta4s/0 returns all pasta4s" do
      pasta4 = pasta4_fixture()
      assert Tcsat4.list_pasta4s() == [pasta4]
    end

    test "get_pasta4!/1 returns the pasta4 with given id" do
      pasta4 = pasta4_fixture()
      assert Tcsat4.get_pasta4!(pasta4.id) == pasta4
    end

    test "create_pasta4/1 with valid data creates a pasta4" do
      assert {:ok, %Pasta4{} = pasta4} = Tcsat4.create_pasta4(@valid_attrs)
      assert pasta4.age == 42
      assert pasta4.title == "some title"
    end

    test "create_pasta4/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tcsat4.create_pasta4(@invalid_attrs)
    end

    test "update_pasta4/2 with valid data updates the pasta4" do
      pasta4 = pasta4_fixture()
      assert {:ok, %Pasta4{} = pasta4} = Tcsat4.update_pasta4(pasta4, @update_attrs)
      assert pasta4.age == 43
      assert pasta4.title == "some updated title"
    end

    test "update_pasta4/2 with invalid data returns error changeset" do
      pasta4 = pasta4_fixture()
      assert {:error, %Ecto.Changeset{}} = Tcsat4.update_pasta4(pasta4, @invalid_attrs)
      assert pasta4 == Tcsat4.get_pasta4!(pasta4.id)
    end

    test "delete_pasta4/1 deletes the pasta4" do
      pasta4 = pasta4_fixture()
      assert {:ok, %Pasta4{}} = Tcsat4.delete_pasta4(pasta4)
      assert_raise Ecto.NoResultsError, fn -> Tcsat4.get_pasta4!(pasta4.id) end
    end

    test "change_pasta4/1 returns a pasta4 changeset" do
      pasta4 = pasta4_fixture()
      assert %Ecto.Changeset{} = Tcsat4.change_pasta4(pasta4)
    end
  end
end
