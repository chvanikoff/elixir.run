defmodule ER.API.SessionController do
  use ER.Web, :controller
  require Logger

  def set(conn, _params) do
    [token] = Plug.Conn.get_req_header(conn, "token")
    {conn, result} = case Phoenix.Token.verify(conn, "admin", token) do
      {:ok, _} ->
        {put_session(conn, :token, token), "ok"}
      {:error, error} ->
        {conn, error}
    end
    json(conn, %{"result" => result})
  end

  def delete(conn, _params) do
    [token] = Plug.Conn.get_req_header(conn, "token")
    {conn, result} = case Phoenix.Token.verify(conn, "admin", token) do
      {:ok, _} ->
        {configure_session(conn, drop: true), "ok"}
      {:error, error} ->
        {conn, error}
    end
    json(conn, %{"result" => result})
  end
end
