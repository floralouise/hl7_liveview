defmodule Hl7LiveviewWeb.AboutLive do
  use Hl7LiveviewWeb, :live_view

  # mount

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  # render

  def render(assigns) do

    # add button clicks to be able to display data here

    ~H"""

    <h1 class="text-[2rem] mt-4 font-semibold leading-10 tracking-tighter text-zinc-900">About Page</h1>
<p> <strong>Color pallete:</strong><br>
<div style="color: #FB8B24">- #FB8B24</div>
<div style="color: #D90368">- #D90368</div>
<div style="color: #820263">- #820263</div>
<div style="color: #291720">- #291720</div>
<div style="color: #04A777">- #04A777</div>
</p>

<p><strong>References</strong><br>
-  <a href="https://youtu.be/pQ0CvjAJXz4" target="blank" style="color: blue">Waterpark: Transforming Healthcare with Distributed Actors, Bryan Hunter </a><br>
- <a href="https://www.youtube.com/watch?v=JGF4LzM6ytE" target="blank" style="color: blue">Medical Messaging: An Elixir For Healthcare, Scott Southworth</a> 
</p>

    """
    end

  # handle_event
  end
