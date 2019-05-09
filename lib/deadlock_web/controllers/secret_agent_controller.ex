defmodule DeadlockWeb.SecretAgentController do
  use DeadlockWeb, :controller

  alias Deadlock.SecretAgent

  action_fallback DeadlockWeb.FallbackController

  def create(conn, params) do
    with %SecretAgent{} = secret_agent <- SecretAgent.create(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.secret_agent_path(conn, :show, secret_agent))
      |> render("show.json", secret_agent: secret_agent)
    end
  end

  def show(conn, %{"id" => id}) do
    secret_agent = SecretAgent.get(id)
    render(conn, "show.json", secret_agent: secret_agent)
  end

  def update(conn, %{"id" => id} = params) do
    secret_agent = SecretAgent.get(id)

    with %SecretAgent{} = secret_agent <- SecretAgent.update(secret_agent, params) do
      render(conn, "show.json", secret_agent: secret_agent)
    end
  end
end
