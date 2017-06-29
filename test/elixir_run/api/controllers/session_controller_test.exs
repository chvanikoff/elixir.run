defmodule ER.API.SessionControllerTest do
  use ER.Web.ConnCase

  test "Session is created when valid token is provided", %{conn: conn} do
    token = Phoenix.Token.sign(ER.Web.Endpoint, "admin", nil)
    conn = conn
           |> put_req_header("token", token)
           |> get(session_path(conn, :set))
    assert json_response(conn, 200) == %{"result" => "ok"}
    conn = get(conn, react_path(conn, :index))
    assert match?(%{"_elixir_run_key" => _}, conn.cookies)
  end

  test "Session is not created when token provided is invalid", %{conn: conn} do
    token = Phoenix.Token.sign(ER.Web.Endpoint, "admin", nil)
    conn = conn
           |> put_req_header("token", String.reverse(token))
           |> get(session_path(conn, :set))
    refute json_response(conn, 200) == %{"result" => "ok"}
    conn = get(conn, react_path(conn, :index))
    refute match?(%{"_elixir_run_key" => _}, conn.cookies)
  end
end
