defmodule HelloWorld2Web.PageController do
  use HelloWorld2Web, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    render(conn, :home, layout: false)
    # so skip the default app layout.
  end
end
