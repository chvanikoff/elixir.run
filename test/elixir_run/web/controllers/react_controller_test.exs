defmodule ER.Web.ReactControllerTest do
  use ER.Web.ConnCase

  test "/ path have index div", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ ~s(<div id="index">)
  end

  describe "Server-side rendering" do
    test "Page have element with data-reactroot attribute", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ "data-reactroot"
    end

    test "/ path renders accepted apps", %{conn: conn} do
      app1 = Fixture.app("accepted")
      app2 = Fixture.app("submitted")
      app3 = Fixture.app("declined")
      app4 = Fixture.app("accepted")

      conn = get(conn, "/")
      response = html_response(conn, 200)
      assert response =~ app1.name
      assert response =~ app4.name
      refute response =~ app2.name
      refute response =~ app3.name
    end
  end
end
