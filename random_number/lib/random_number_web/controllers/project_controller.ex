defmodule RandomNumberWeb.ProjectController do
  use RandomNumberWeb, :controller

  def project(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :project, layout: false)
  end
end
