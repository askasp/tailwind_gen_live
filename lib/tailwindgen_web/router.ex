defmodule TailwindgenWeb.Router do
  use TailwindgenWeb, :router
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TailwindgenWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

	use Kaffy.Routes, scope: "/admin", pipe_through: [:browser]



  scope "/", TailwindgenWeb do
    pipe_through :browser

    live "/posts", PostLive.Index, :index
    live "/posts/new", PostLive.Index, :new
    live "/posts/:id/edit", PostLive.Index, :edit

    live "/posts/:id", PostLive.Show, :show
    live "/posts/:id/show/edit", PostLive.Show, :edit


    live "/poststo", PosttoLive.Index, :index
    live "/poststo/new", PosttoLive.Index, :new
    live "/poststo/:id/edit", PosttoLive.Index, :edit

    live "/poststo/:id", PosttoLive.Show, :show
    live "/poststo/:id/show/edit", PosttoLive.Show, :edit


    live "/postfems", PostfemLive.Index, :index
    live "/postfems/new", PostfemLive.Index, :new
    live "/postfems/:id/edit", PostfemLive.Index, :edit

    live "/postfems/:id", PostfemLive.Show, :show
    live "/postfems/:id/show/edit", PostfemLive.Show, :edit


    live "/postseks", PostsekLive.Index, :index
    live "/postseks/new", PostsekLive.Index, :new
    live "/postseks/:id/edit", PostsekLive.Index, :edit

    live "/postseks/:id", PostsekLive.Show, :show
    live "/postseks/:id/show/edit", PostsekLive.Show, :edit


    live "/postas", PostaLive.Index, :index
    live "/postas/new", PostaLive.Index, :new
    live "/postas/:id/edit", PostaLive.Index, :edit

    live "/postas/:id", PostaLive.Show, :show
    live "/postas/:id/show/edit", PostaLive.Show, :edit



    live "/postsyvs", PostsyvLive.Index, :index
    live "/postsyvs/new", PostsyvLive.Index, :new
    live "/postsyvs/:id/edit", PostsyvLive.Index, :edit

    live "/postsyvs/:id", PostsyvLive.Show, :show
    live "/postsyvs/:id/show/edit", PostsyvLive.Show, :edit

    live "/postos", PostoLive.Index, :index
    live "/postos/new", PostoLive.Index, :new
    live "/postos/:id/edit", PostoLive.Index, :edit

    live "/postos/:id", PostoLive.Show, :show
    live "/postos/:id/show/edit", PostoLive.Show, :edit


    live "/postes", PosteLive.Index, :index
    live "/postes/new", PosteLive.Index, :new
    live "/postes/:id/edit", PosteLive.Index, :edit

    live "/postes/:id", PosteLive.Show, :show
    live "/postes/:id/show/edit", PosteLive.Show, :edit

    live "/postvsxtitle", PostxLive.Index, :index
    live "/postvsxtitle/new", PostxLive.Index, :new
    live "/postvsxtitle/:id/edit", PostxLive.Index, :edit

    live "/postvsxtitle/:id", PostxLive.Show, :show
    live "/postvsxtitle/:id/show/edit", PostxLive.Show, :edit


    live "/pastas", PastaLive.Index, :index
    live "/pastas/new", PastaLive.Index, :new
    live "/pastas/:id/edit", PastaLive.Index, :edit

    live "/pastas/:id", PastaLive.Show, :show
    live "/pastas/:id/show/edit", PastaLive.Show, :edit


    live "/pasta2s", Pasta2Live.Index, :index
    live "/pasta2s/new", Pasta2Live.Index, :new
    live "/pasta2s/:id/edit", Pasta2Live.Index, :edit

    live "/pasta2s/:id", Pasta2Live.Show, :show
    live "/pasta2s/:id/show/edit", Pasta2Live.Show, :edit


    live "/pasta3s", Pasta3Live.Index, :index
    live "/pasta3s/new", Pasta3Live.Index, :new
    live "/pasta3s/:id/edit", Pasta3Live.Index, :edit

    live "/pasta3s/:id", Pasta3Live.Show, :show
    live "/pasta3s/:id/show/edit", Pasta3Live.Show, :edit


    live "/pasta5s", Pasta5Live.Index, :index
    live "/pasta5s/new", Pasta5Live.Index, :new
    live "/pasta5s/:id/edit", Pasta5Live.Index, :edit

    live "/pasta5s/:id", Pasta5Live.Show, :show
    live "/pasta5s/:id/show/edit", Pasta5Live.Show, :edit

    live "/pasta6s", Pasta6Live.Index, :index
    live "/pasta6s/new", Pasta6Live.Index, :new
    live "/pasta6s/:id/edit", Pasta6Live.Index, :edit

    live "/pasta6s/:id", Pasta6Live.Show, :show
    live "/pasta6s/:id/show/edit", Pasta6Live.Show, :edit

    live "/pasta7s", Pasta7Live.Index, :index
    live "/pasta7s/new", Pasta7Live.Index, :new
    live "/pasta7s/:id/edit", Pasta7Live.Index, :edit

    live "/pasta7s/:id", Pasta7Live.Show, :show
    live "/pasta7s/:id/show/edit", Pasta7Live.Show, :edit


    live "/pasta8s", Pasta8Live.Index, :index
    live "/pasta8s/new", Pasta8Live.Index, :new
    live "/pasta8s/:id/edit", Pasta8Live.Index, :edit

    live "/pasta8s/:id", Pasta8Live.Show, :show
    live "/pasta8s/:id/show/edit", Pasta8Live.Show, :edit
    resources "/pasta9s", Pasta9Controller

    live "/ts10s", Ts10Live.Index, :index
    live "/ts10s/new", Ts10Live.Index, :new
    live "/ts10s/:id/edit", Ts10Live.Index, :edit

    live "/ts10s/:id", Ts10Live.Show, :show
    live "/ts10s/:id/show/edit", Ts10Live.Show, :edit

    live "/ts11s", Ts11Live.Index, :index
    live "/ts11s/new", Ts11Live.Index, :new
    live "/ts11s/:id/edit", Ts11Live.Index, :edit

    live "/ts11s/:id", Ts11Live.Show, :show
    live "/ts11s/:id/show/edit", Ts11Live.Show, :edit


    live "/", PageLive, :index

  live "/ts12s", Ts12Live.Index, :index
    live "/ts12s/new", Ts12Live.Index, :new
    live "/ts12s/:id/edit", Ts12Live.Index, :edit

    live "/ts12s/:id", Ts12Live.Show, :show
    live "/ts12s/:id/show/edit", Ts12Live.Show, :edit
    live "/ts13s", Ts13Live.Index, :index
    live "/ts13s/new", Ts13Live.Index, :new
    live "/ts13s/:id/edit", Ts13Live.Index, :edit

    live "/ts13s/:id", Ts13Live.Show, :show
    live "/ts13s/:id/show/edit", Ts13Live.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", TailwindgenWeb do
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
      live_dashboard "/dashboard", metrics: TailwindgenWeb.Telemetry
    end
  end
end
