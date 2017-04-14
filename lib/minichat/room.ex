defmodule Minichat.Room do
  def start_link(room) do
    Agent.start_link(fn -> [] end, name: room) 
  end

  def get(room) do
    Agent.get(room, fn list -> list end)
  end

  def push(room, msg = %{author: author, message: message}) do
    Agent.update(room, fn list -> [message | list] end)
  end
end
