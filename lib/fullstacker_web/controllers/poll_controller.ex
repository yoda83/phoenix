defmodule FullstackerWeb.PollController do
  use FullstackerWeb, :controller
  alias Fullstacker.Votes

  def index(conn, _params) do
    polls = Votes.list_polls()
    render conn, "index.html", polls: polls
  end

  def new(conn, _params) do
    poll = Votes.new_poll()
    render conn, "new.html", poll: poll
  end

end
