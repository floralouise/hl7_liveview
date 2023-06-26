defmodule Hl7LiveviewWeb.ErrorJSONTest do
  use Hl7LiveviewWeb.ConnCase, async: true

  test "renders 404" do
    assert Hl7LiveviewWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Hl7LiveviewWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
