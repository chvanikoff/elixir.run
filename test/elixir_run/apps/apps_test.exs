defmodule ER.AppsTest do
  use ER.DataCase

  alias ER.{Apps}

  describe "App" do
    test "Submit with valid params" do
      valid_params = [%{
        "name" => "test 1",
        "demo_url" => "http://site1.com",
        "source_url" => "http://site1.com",
        "image_url" => "http://site1.com",
        "description" => "test application 1"
      }, %{
        "name" => "test 2",
        "source_url" => "http://site2.com",
        "description" => "test application 2"
      }]
      for params <- valid_params do
        assert {:ok, app} = Apps.submit_app(params)
        assert app.status == "submitted"
      end
    end

    test "Submit with invalid params" do
      params = %{
        "name" => "test",
        "description" => ""
      }
      assert {:error, %Ecto.Changeset{errors: errors}} = Apps.submit_app(params)
      assert :source_url in Keyword.keys(errors)
      assert :description in Keyword.keys(errors)
    end

    test "List apps" do
      app1 = Fixture.app("submitted")
      app2 = Fixture.app("accepted")
      app3 = Fixture.app("declined")

      list = Apps.list_apps()
      assert list == [app2]

      list = Apps.list_apps("accepted")
      assert list == [app2]

      list = Apps.list_apps("submitted")
      assert list == [app1]
      
      list = Apps.list_apps("declined")
      assert list == [app3]
    end
  end
end
