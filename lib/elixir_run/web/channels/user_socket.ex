defmodule ER.Web.UserSocket do
  use Phoenix.Socket

  channel "apps", ER.Web.AppsChannel
  channel "auth", ER.Web.AuthChannel

  transport :websocket, Phoenix.Transports.WebSocket

  def connect(_params, socket) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
