--!nonstrict

local symbols = {
  Up = "↑",
  Down = "↓",
  Left = "←",
  Right = "→",
  Enter = "↵",
  Backspace = "⌫",
  Tab = "⇥",
  Space = "␣",
  Esc = "Esc",
  Super = "⌘",
  Ctrl = "Ctrl",
  Alt = "Alt",
  Shift = "⇧",
}

local function getFontSize()
  local size = noctalia.getConfig("font_size") or "medium"

  if size == "small" then
    return 11
  elseif size == "large" then
    return 15
  end

  return 13
end

local function getStyle()
  local style = noctalia.getConfig("badge_style") or "glass"

  if style == "solid" then
    return "surface_container_high", "outline", 1
  elseif style == "accent" then
    return "primary/0.16", "primary/0.75", 1
  end

  return "surface_container_high/0.92", "outline/0.55", 1
end

local function render()
  local keys = noctalia.state.get("active_keys") or {}

  if #keys == 0 then
    panel.render(ui.row({}))
    return
  end

  local fontSize = getFontSize()
  local fill, border, borderWidth = getStyle()
  local gap = noctalia.getConfig("margin") or 6
  local padding = noctalia.getConfig("padding") or 6
  local items = {}

  for _, combo in ipairs(keys) do
    local children = {}
    local parts = string.split(combo, " + ")

    for i, part in ipairs(parts) do
      table.insert(children, ui.label({
        text = symbols[part] or part,
        fontSize = fontSize,
        fontWeight = "bold",
        color = "on_surface",
      }))

      if i < #parts then
        table.insert(children, ui.label({
          text = "+",
          fontSize = math.max(9, fontSize - 3),
          fontWeight = "bold",
          color = "on_surface_variant",
        }))
      end
    end

    local isSingleKey = #parts == 1 and #combo <= 3
    local padH = isSingleKey and 7 or 10
    local itemHeight = 30

    table.insert(items, ui.row({
      height = itemHeight,
      paddingH = padH,
      gap = 6,
      fill = fill,
      border = border,
      borderWidth = borderWidth,
      radius = 7,
      align = "center",
      justify = "center",
    }, children))
  end

  panel.render(ui.row({
    flexGrow = 1,
    align = "center",
    justify = "center",
  }, {
    ui.row({
      gap = gap,
      padding = padding,
      align = "center",
      justify = "center",
    }, items),
  }))
end

noctalia.state.watch("active_keys", render)

function onConfigChanged()
  render()
end

function onOpen()
  render()
end

render()


