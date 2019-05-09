defmodule DeadlockWeb.Router do
  use DeadlockWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DeadlockWeb do
    pipe_through :api

    resources "/secret_agents", SecretAgentController, only: [:show, :create, :update]
  end
end
