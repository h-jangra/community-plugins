--!nonstrict

local active = noctalia.state.get("is_active") ~= false

local function render()
  shortcut.setLabel(active and "Keyviz On" or "Keyviz Off")
  shortcut.setIcon(active and "keyboard" or "keyboard-off")
  shortcut.setActive(active)
end

noctalia.state.watch("is_active", function(value)
  active = value == true
  render()
end)

function onClick()
  active = not active
  noctalia.state.set("is_active", active)
  if active and type(noctalia.runAsync) == "function" then
    noctalia.runAsync("/usr/bin/noctalia msg panel-open h-jangra/keyviz:overlay", function() end)
  end
  render()
end

function onRightClick()
  onClick()
end

render()
