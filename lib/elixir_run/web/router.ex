defmodule ER.Web.Router do
  use ER.Web, :router

  pipeline :browser do
    plug :accepts, ["html", "json"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :put_secure_browser_headers
  end

  scope "/api", ER.API do
    pipe_through :api

    scope "/session" do
      get "/set", SessionController, :set
      get "/delete", SessionController, :delete
    end
  end

  scope "/", ER.Web do
    pipe_through :browser # Use the default browser stack

    get "/", ReactController, :index
    get "/login", ReactController, :index
  end
end
