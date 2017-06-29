defmodule ER.Web.ReactController do
  use ER.Web, :controller

  def index(conn, _params) do
    apps = "accepted"
           |> Apps.list_apps()
           |> Enum.reduce(%{}, fn app, acc ->
             Map.put(acc, app.id, app)
           end)
    token = get_session(conn, :token)
    token = case Phoenix.Token.verify(conn, "admin", token) do
      {:ok, _} ->
        token
      _ ->
        nil
    end
    initial_state = %{apps: %{list: apps}, auth: %{token: token}}
    react_stdio_args = %{
      component: Application.app_dir(:elixir_run, "priv/static/server/js/app.js"),
      props: %{
        "location" => conn.request_path,
        "initial_state" => initial_state
      }
    }
    {:ok, %{"html" => html}} = StdJsonIo.json_call(react_stdio_args)
    render(conn, "index.html", html: html, initial_state: initial_state)
  end
end
