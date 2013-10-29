defmodule UserGen do
  use Application.Behaviour

  def start(_type, stack) do
    UserGen.Supervisor.start_link(stack)
  end

end
