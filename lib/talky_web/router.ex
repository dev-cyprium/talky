defmodule TalkyWeb.Router do
  use TalkyWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TalkyWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug TalkyWeb.Plug.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TalkyWeb do
    pipe_through :browser

    live "/app", AppLive
    live "/bots", BotsLive
    live "/bots/new", BotsLive.New
    get "/", PageController, :home

    get "/sign-up", UserController, :register_form
    post "/sign-up", UserController, :register
    delete "/sign-out", SessionController, :destroy
  end

  # Other scopes may use custom stacks.
  # scope "/api", TalkyWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: TalkyWeb.Telemetry
    end
  end
end
