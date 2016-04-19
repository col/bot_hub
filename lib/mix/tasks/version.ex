defmodule Mix.Tasks.Version do
  use Mix.Task

  def run(_args) do
    Mix.shell.info Mix.Project.config[:version]
  end
end
