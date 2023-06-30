defmodule Hl7LiveviewWeb.ExamplesLive do
use Hl7LiveviewWeb, :live_view

# mount

# render

def render(assigns) do

  ~H"""
      <h1 class="text-[2rem] mt-4 font-semibold leading-10 tracking-tighter text-zinc-900">LiveView Examples</h1>

    <a href="/buttons">
    <h2 class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">🆒 Button clicks</h2></a>

    <a href="/forms">
      <h2 class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">📝 Interactive forms (to do)</h2>
    </a>

    <h2 class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">⌨️  Key events (to do)</h2>

    <h2 class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">📈 Components (to do)</h2>

    <h2 class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">📊 Dynamic Charts (to do)</h2>

    <h2 class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">🧪Add a test here, too (to do)</h2>

  """
  end



# handle_event
end
