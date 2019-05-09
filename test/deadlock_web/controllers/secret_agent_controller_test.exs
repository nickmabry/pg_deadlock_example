defmodule DeadlockWeb.SecretAgentControllerTest do
  use DeadlockWeb.ConnCase

  alias Deadlock.SecretAgent

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create secret_agent" do
    test "renders secret_agent when data is valid", %{conn: conn} do
      params = %{
        "name" => "James Bond",
        "disavowed" => false,
        "covers" => [
          %{
            "code_name" => "Flying Panda",
            "name" => "John Smith"
          },
          %{
            "code_name" => "Psychic Tiger",
            "name" => "Will Bristol"
          }
        ]
      }

      conn = post(conn, Routes.secret_agent_path(conn, :create), params)
      assert %{"id" => id} = json_response(conn, 201)

      conn = get(conn, Routes.secret_agent_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "James Bond"
             } = json_response(conn, 200)
    end
  end

  describe "update secret_agent" do
    setup :create_secret_agent

    test "renders secret_agent when data is valid", %{
      conn: conn,
      agent: %SecretAgent{id: id} = secret_agent
    } do
      params = %{
        "disavowed" => true
      }

      conn = put(conn, Routes.secret_agent_path(conn, :update, secret_agent), params)
      assert %{"id" => ^id} = json_response(conn, 200)

      conn = get(conn, Routes.secret_agent_path(conn, :show, id))

      assert %{
               "id" => id,
               "disavowed" => true
             } = json_response(conn, 200)
    end
  end

  defp create_secret_agent(_) do
    agent =
      SecretAgent.create(%{
        "name" => "James Bond",
        "disavowed" => false,
        "covers" => [
          %{
            "code_name" => "Flying Panda",
            "name" => "John Smith"
          },
          %{
            "code_name" => "Psychic Tiger",
            "name" => "Will Bristol"
          }
        ]
      })

    %{agent: agent}
  end
end
