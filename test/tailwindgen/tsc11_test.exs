defmodule Tailwindgen.Tsc11Test do
  use Tailwindgen.DataCase

  alias Tailwindgen.Tsc11

  describe "ts11s" do
    alias Tailwindgen.Tsc11.Ts11

    @valid_attrs %{age: 42, body: "some body", title: "some title"}
    @update_attrs %{age: 43, body: "some updated body", title: "some updated title"}
    @invalid_attrs %{age: nil, body: nil, title: nil}

    def ts11_fixture(attrs \\ %{}) do
      {:ok, ts11} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tsc11.create_ts11()

      ts11
    end

    test "list_ts11s/0 returns all ts11s" do
      ts11 = ts11_fixture()
      assert Tsc11.list_ts11s() == [ts11]
    end

    test "get_ts11!/1 returns the ts11 with given id" do
      ts11 = ts11_fixture()
      assert Tsc11.get_ts11!(ts11.id) == ts11
    end

    test "create_ts11/1 with valid data creates a ts11" do
      assert {:ok, %Ts11{} = ts11} = Tsc11.create_ts11(@valid_attrs)
      assert ts11.age == 42
      assert ts11.body == "some body"
      assert ts11.title == "some title"
    end

    test "create_ts11/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tsc11.create_ts11(@invalid_attrs)
    end

    test "update_ts11/2 with valid data updates the ts11" do
      ts11 = ts11_fixture()
      assert {:ok, %Ts11{} = ts11} = Tsc11.update_ts11(ts11, @update_attrs)
      assert ts11.age == 43
      assert ts11.body == "some updated body"
      assert ts11.title == "some updated title"
    end

    test "update_ts11/2 with invalid data returns error changeset" do
      ts11 = ts11_fixture()
      assert {:error, %Ecto.Changeset{}} = Tsc11.update_ts11(ts11, @invalid_attrs)
      assert ts11 == Tsc11.get_ts11!(ts11.id)
    end

    test "delete_ts11/1 deletes the ts11" do
      ts11 = ts11_fixture()
      assert {:ok, %Ts11{}} = Tsc11.delete_ts11(ts11)
      assert_raise Ecto.NoResultsError, fn -> Tsc11.get_ts11!(ts11.id) end
    end

    test "change_ts11/1 returns a ts11 changeset" do
      ts11 = ts11_fixture()
      assert %Ecto.Changeset{} = Tsc11.change_ts11(ts11)
    end
  end
end
