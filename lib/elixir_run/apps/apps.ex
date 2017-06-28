defmodule ER.Apps do
  @moduledoc """
  The module provides API for managing apps
  """

  import Ecto.Query

  alias ER.{Repo, Apps}

  @doc """
  Function for submitting an app.
  Once an app is submitted, it gets status "submitted" and is not listed
  on the site until status is changed to "accepted".
  """
  @spec submit_app(map()) :: {:ok, Apps.App.t} | {:error, Ecto.Changeset.t}
  def submit_app(params) do
    Apps.App.changeset(%Apps.App{}, params)
    |> Repo.insert()
  end

  @doc """
  List all apps with given status. Defaults to list all accepted
  """
  @spec list_apps(String.t()) :: list()
  def list_apps(status \\ "accepted") do
    query = from a in Apps.App,
      where: a.status == ^status
    Repo.all(query)
  end
end
