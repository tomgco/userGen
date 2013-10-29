defmodule UserGen.Server do
  use GenServer.Behaviour

  def start_link(stack) do
    :gen_server.start_link({ :local, :userGen }, __MODULE__, stack, [])
  end

  def init(stack) do
    { :ok, stack }
  end

  def handle_call( :pop, _from, [ h | stack ]) do
    { :reply, h, stack }
  end

  def handle_cast({ :update, key, tuple }, stack) do
    { :noreply, List.keystore(stack, key, 0, { key, tuple }) }
  end

  def handle_cast({ :push, new }, stack) do
    { :noreply, [ new | stack ] }
  end
end