defmodule ER.Web.AuthChannelTest do
  use ER.Web.ChannelCase

  alias ER.Web.AuthChannel

  setup do
    {:ok, _, socket} = subscribe_and_join(socket(), AuthChannel, "auth")
    {:ok, socket: socket}
  end

  test "Can login when password is correct", %{socket: socket} do
    password = "testpassword"
    ER.Application.set_admin_password(password)
    params = %{
      "password" => password
    }
    ref = push(socket, "login", params)
    assert_reply(ref, :ok, %{token: token}, 1000)
    assert {:ok, _} = Phoenix.Token.verify(@endpoint, "admin", token)
  end

  test "Returns error when password is incorrect", %{socket: socket} do
    password = "testpassword"
    ER.Application.set_admin_password(password)
    params = %{
      "password" => String.reverse(password)
    }
    ref = push(socket, "login", params)
    assert_reply(ref, :error, %{}, 1000)
  end
end
