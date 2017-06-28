defmodule ER.Fixture do
  alias ER.{Repo, Apps}

  def app(status \\ "submitted") do
    uid = unique_id()
    struct = %Apps.App{
      name: "Application #{uid}",
      demo_url: "https://site#{uid}.com",
      source_url: "https://github.com/app#{uid}/repo",
      image_url: nil,
      description: "A great app that doesn't exist but created for a test purpose",
      status: status
    }
    {:ok, %Apps.App{} = app} = Repo.insert(struct)
    app
  end

  defp unique_id(), do: System.unique_integer([:positive])
end
