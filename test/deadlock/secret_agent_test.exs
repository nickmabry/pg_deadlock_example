defmodule Deadlock.SecretAgentTest do
  use Deadlock.DataCase, async: true

  alias Deadlock.SecretAgent

  describe "get/1" do
    setup :create_agent

    test "looks up an agent by ID", %{agent: agent} do
      retrieved_agent = SecretAgent.get(agent.id)

      assert retrieved_agent == agent
    end
  end

  describe "create/1" do
    test "creates a secret agent" do
      params = %{
        "name" => "James Bond",
        "disavowed" => false
      }

      agent = SecretAgent.create(params)

      assert is_integer(agent.id)
    end

    test "creates a secret agent with covers" do
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

      agent = SecretAgent.create(params)

      cover_names =
        agent.covers
        |> Enum.map(& &1.name)
        |> Enum.sort()

      assert cover_names == ["John Smith", "Will Bristol"]
    end
  end

  describe "update/2" do
    setup :create_agent

    test "updates a secret agent", %{agent: agent} do
      updated_agent = SecretAgent.update(agent, %{"disavowed" => true})

      assert updated_agent.disavowed
    end

    test "updates a secret agent's covers", %{agent: agent} do
      params = %{
        "covers" => [
          %{
            "code_name" => "Flying Cobra",
            "name" => "John Smith"
          },
          %{
            "code_name" => "Spicy Monkey",
            "name" => "Jeff Bridges"
          }
        ]
      }

      updated_agent = SecretAgent.update(agent, params)

      cover_names =
        updated_agent.covers
        |> Enum.map(& &1.name)
        |> Enum.sort()

      assert cover_names == ["Jeff Bridges", "John Smith"]
    end
  end

  def create_agent(_) do
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
