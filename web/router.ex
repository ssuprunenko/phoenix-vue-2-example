defmodule Web.Router do
  use Web.Web, :router

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

  scope "/", Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/sample", PageController, :sample
    get "/chat", PageController, :chat
    resources "/links", LinkController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  scope "/api", Web do
    pipe_through :api

    get "/random", PageController, :random
    resources "/links", LinkController, only: [:create, :update, :delete]
  end
end
