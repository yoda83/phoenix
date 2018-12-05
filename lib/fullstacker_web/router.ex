defmodule FullstackerWeb.Router do
  use FullstackerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FullstackerWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/about", PageController, :about
    get "/polls", PollController, :index

    get "/polls/new", PollController, :new
    post "/polls", PollController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", FullstackerWeb do
  #   pipe_through :api
  # end
end
