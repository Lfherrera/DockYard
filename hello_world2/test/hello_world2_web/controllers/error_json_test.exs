defmodule HelloWorld2Web.ErrorJSONTest do
  use HelloWorld2Web.ConnCase, async: true

  test "renders 404" do
    assert HelloWorld2Web.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert HelloWorld2Web.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
