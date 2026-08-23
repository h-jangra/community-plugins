# Keyviz (Key Visualizer)

A minimal, real-time floating on-screen keystroke visualizer HUD for [Noctalia](https://noctalia.dev). Displays typed keys and modifier combinations (e.g. `Ctrl + Shift + P`, `Super + Space`, `Alt + Tab`) as translucent, blurred glass keycaps directly on your screen with zero typing latency.

## Features

- **Floating On-Screen HUD**: Minimal translucent glass keycaps floating at the bottom-center of your screen.
- **Zero Background When Idle**: Automatically renders transparent when not typing—no lingering boxes or frames.
- **Zero Typing Interference**: Runs in a non-focusing layer (`keyboard_focus = "none"`), ensuring uninterrupted continuous typing.
- **Split Keycap Design**: Combinations like `Ctrl + Shift + P` are rendered as distinct, elevated keycaps with clean typography.
- **Bar Widget**: Status icon on your Noctalia bar with one-click toggle to show/hide and enable/disable overlay visualizer.
- **Control Center Shortcut**: Quick-toggle tile to easily pause and resume key visualizer at any time.
- **Customizable In Settings**:
  - Inner overlay padding (`0px` – `30px`).
  - Keycap margin gap (`0px` – `30px`).
  - Inactivity timeout slider (`200ms` – `5000ms`).
  - Max key combinations (`1` – `8`).
  - Font size (`Small`, `Medium`, `Large`).
  - Visual style (`Glass (Blurred)`, `Solid Surface`, `Accent Outline`).
  - Shortcuts-only filter (Ctrl/Alt/Shift/Super).

## Prerequisites & Permissions

On Linux (Wayland / Hyprland), capturing global keystrokes requires read access to `/dev/input/event*` devices.

Add your user to the `input` group:

```sh
sudo usermod -a -G input $USER
```

> **Note:** Log out and log back in (or restart your session) for the group membership to take effect.

## Installation & Activation

Enable the plugin in Noctalia:

```sh
noctalia msg plugins enable h-jangra/keyviz
```

## Settings

Configure Keyviz in **Noctalia Settings → Plugins → Key Visualizer**:

| Setting | Type | Default | Description |
| --- | --- | --- | --- |
| `enabled_by_default` | `bool` | `true` | Start visualizer automatically when Noctalia starts. |
| `padding` | `int` | `6` | Internal padding spacing inside overlay around keycaps (`0` – `30`). |
| `margin` | `int` | `6` | Spacing gap between visualized key combinations (`0` – `30`). |
| `timeout_ms` | `int` | `500` | Inactivity duration (ms) before keys disappear. |
| `max_keys` | `int` | `4` | Maximum number of key combinations to display. |
| `font_size` | `select` | `medium` | Text size of keycaps (`small`, `medium`, `large`). |
| `badge_style` | `select` | `glass` | Visual style (`glass`, `solid`, `accent`). |
| `show_modifiers_only` | `bool` | `false` | Only visualize combinations with Ctrl, Alt, Shift, or Super. |

## IPC Commands

```sh
# Toggle key visualizer on/off
noctalia msg plugin h-jangra/keyviz:keylistener all toggle

# Clear currently displayed keys
noctalia msg plugin h-jangra/keyviz:keylistener all clear
```

## License

MIT © [Himanshu Jangra](https://github.com/h-jangra)
