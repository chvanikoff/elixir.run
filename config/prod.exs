use Mix.Config

config :elixir_run, ER.Web.Endpoint,
  load_from_system_env: true,
  url: [host: "elixir.run", port: "${PHX_PORT}"],
  cache_static_manifest: "priv/static/cache_manifest.json",
  check_origin: ["//*.elixir.run"],
  server: true,
  root: ".",
  secret_key_base: "${PHX_SECRET_KEY_BASE}"
  
config :logger, level: :info

config :elixir_run, ER.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "${DB_USERNAME}",
  password: "${DB_PASSWORD}",
  database: "${DB_NAME}",
  hostname: "${DB_HOST}",
  pool_size: "${DB_PSIZE}"

config :std_json_io,
  pool_size: 20,
  pool_max_overflow: 30,
  script: "react-stdio"

