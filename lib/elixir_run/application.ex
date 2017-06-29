defmodule ER.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    password = System.get_env("ER_ADMIN_PASSWORD")
    if password == nil do
      raise "Environment variable ER_ADMIN_PASSWORD must be set to run the application"
    end
    set_admin_password(password)

    children = [
      supervisor(ER.Repo, []),
      supervisor(ER.Web.Endpoint, []),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ER.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ER.Web.Endpoint.config_change(changed, removed)
    :ok
  end

  @doc """
  API function to set Administrator password
  """
  @spec set_admin_password(String.t()) :: :ok
  def set_admin_password(password) do
    hash = Comeonin.Bcrypt.hashpwsalt(password)
    Application.put_env(:elixir_run, :admin_password, hash)
  end
end
