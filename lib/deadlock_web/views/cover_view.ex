defmodule DeadlockWeb.CoverView do
  use DeadlockWeb, :view

  def render("cover.json", %{cover: cover}) do
    %{
      id: cover.id,
      code_name: cover.code_name,
      name: cover.name
    }
  end
end
