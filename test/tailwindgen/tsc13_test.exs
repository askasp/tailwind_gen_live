defmodule Tailwindgen.Tsc13Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tsc13

  describe "ts13s" do
    alias Tailwindgen.Tsc13.Ts13

    @valid_attrs %{age: 42, body: "some body", title: "some title"}
    @update_attrs %{age: 43, body: "some updated body", title: "some updated title"}
    @invalid_attrs %{age: nil, body: nil, title: nil}

    def ts13_fixture(attrs \\ %{}) do
      {:ok, ts13} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tsc13.create_ts13()

      ts13
    end

    test "list_ts13s/0 returns all ts13s" do
      ts13 = ts13_fixture()
      assert Tsc13.list_ts13s() == [ts13]
    end

    test "get_ts13!/1 returns the ts13 with given id" do
      ts13 = ts13_fixture()
      assert Tsc13.get_ts13!(ts13.id) == ts13
    end

    test "create_ts13/1 with valid data creates a ts13" do
      assert {:ok, %Ts13{} = ts13} = Tsc13.create_ts13(@valid_attrs)
      assert ts13.age == 42
      assert ts13.body == "some body"
      assert ts13.title == "some title"
    end

    test "create_ts13/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tsc13.create_ts13(@invalid_attrs)
    end

    test "update_ts13/2 with valid data updates the ts13" do
      ts13 = ts13_fixture()
      assert {:ok, %Ts13{} = ts13} = Tsc13.update_ts13(ts13, @update_attrs)
      assert ts13.age == 43
      assert ts13.body == "some updated body"
      assert ts13.title == "some updated title"
    end

    test "update_ts13/2 with invalid data returns error changeset" do
      ts13 = ts13_fixture()
      assert {:error, %Ecto.Changeset{}} = Tsc13.update_ts13(ts13, @invalid_attrs)
      assert ts13 == Tsc13.get_ts13!(ts13.id)
    end

    test "delete_ts13/1 deletes the ts13" do
      ts13 = ts13_fixture()
      assert {:ok, %Ts13{}} = Tsc13.delete_ts13(ts13)
      assert_raise Ecto.NoResultsError, fn -> Tsc13.get_ts13!(ts13.id) end
    end

    test "change_ts13/1 returns a ts13 changeset" do
      ts13 = ts13_fixture()
      assert %Ecto.Changeset{} = Tsc13.change_ts13(ts13)
    end
  end
end
