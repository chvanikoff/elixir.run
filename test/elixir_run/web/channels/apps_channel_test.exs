defmodule ER.Web.AppsChannelTest do
  use ER.Web.ChannelCase

  alias ER.Web.AppsChannel

  setup do
    {:ok, _, socket} =
      socket()
      |> subscribe_and_join(AppsChannel, "apps")

    {:ok, socket: socket}
  end

  test "Can submit an app via channel", %{socket: socket} do
    params = %{
      "name" => "test",
      "source_url" => "http://site.com",
      "description" => "Some description for the app"
    }
    ref = push(socket, "submit", params)
    assert_reply(ref, :ok, %{})
  end

  test "Returns object with errors when params are invalid", %{socket: socket} do
    params = %{
      "name" => "test",
      "description" => "Description"
    }
    ref = push(socket, "submit", params)
    assert_reply(ref, :error, %{errors: errors})
    assert %{source_url: ["can't be blank"]} = errors
  end
end
