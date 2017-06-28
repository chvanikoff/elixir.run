defmodule ER.Web.AppsChannel do
  use ER.Web, :channel

  def join("apps", payload, socket) do
    {:ok, socket}
  end

  def handle_in("submit", params, socket) do
    response = case Apps.submit_app(params) do
      {:ok, _} ->
        {:ok, %{}}
      {:error, %Ecto.Changeset{} = changeset} ->
        errors = ER.Web.ErrorHelpers.changeset_to_map(changeset)
        {:error, %{errors: errors}}
    end
    {:reply, response, socket}
  end
end
