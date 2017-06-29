defmodule Release.Tasks.Migration do
  @app_name :elixir_run
  @app_module ER

  @start_apps [
    :postgrex,
    :ecto
  ]

  def run() do
    app = @app_name
    IO.puts "Loading app #{app}.."
    :ok = Application.load(app)
    IO.puts "Starting dependencies.."
    Enum.each(@start_apps, fn (app) ->
      {:ok, _} = Application.ensure_all_started(app)
    end)
    IO.puts "Starting repos.."
    @app_module.Repo.start_link(pool_size: 1)
    app
    |> migrate
    |> seed
    :init.stop()
  end

  def migrate(app) do
    IO.puts "Running migrations for #{app}"
    Ecto.Migrator.run(@app_module.Repo, Path.join([repo_path(app), "migrations"]), :up, all: true)
    app
  end

  def seed(app) do
    IO.puts "Seeding data for app #{app}.."
    seed_script = Path.join([repo_path(app), "seeds", "prod.exs"])
    if File.exists?(seed_script) do
      IO.puts "Starting seed..."
      Code.eval_file(seed_script)
    end
    IO.puts "Seeding done!"
  end

  defp repo_path(app), do: Path.join([priv_dir(app), "repo"])
  defp priv_dir(app), do: "#{:code.priv_dir(app)}"
end
