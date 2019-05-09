defmodule DeadlockWeb.SecretAgentView do
  use DeadlockWeb, :view
  alias DeadlockWeb.{CoverView, SecretAgentView}

  def render("show.json", %{secret_agent: secret_agent}) do
    render_one(secret_agent, SecretAgentView, "secret_agent.json")
  end

  def render("secret_agent.json", %{secret_agent: secret_agent}) do
    %{
      id: secret_agent.id,
      name: secret_agent.name,
      disavowed: secret_agent.disavowed,
      covers: render_many(secret_agent.covers, CoverView, "cover.json")
    }
  end
end
