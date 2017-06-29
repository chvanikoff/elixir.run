defmodule ER.Web.AuthChannel do
  use ER.Web, :channel

  def join("auth", _payload, socket) do
    {:ok, socket}
  end

  def handle_in("login", params, socket) do
    password = Map.get(params, "password", "")
    hash = Application.get_env(:elixir_run, :admin_password)
    response = case Comeonin.Bcrypt.checkpw(password, hash) do
      true ->
        token = Phoenix.Token.sign(ER.Web.Endpoint, "admin", nil)
        {:ok, %{token: token}}
      false ->
        {:error, %{}}
    end
    {:reply, response, socket}
  end
end
