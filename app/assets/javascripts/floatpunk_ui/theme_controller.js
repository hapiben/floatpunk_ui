import { Controller } from "@hotwired/stimulus"

// The theme switch: Auto (follow the device), Light or Dark. Each click moves
// to the next one. The choice is kept in this browser's localStorage, and the
// layout helper floatpunk_theme_script_tag applies it before the page paints.
//
//   <button type="button" class="theme-toggle" hidden
//           data-controller="theme" data-action="theme#toggle">
//     <span data-theme-target="icon" aria-hidden="true"></span>
//     <span data-theme-target="text"></span>
//   </button>
//
// The button stays hidden until this controller connects, so a page without
// JavaScript shows no switch that does nothing.
const KEY = "floatpunk-theme"
const ORDER = ["auto", "light", "dark"]
const TEXT = { auto: "Auto", light: "Light", dark: "Dark" }
const ICON = { auto: "◐", light: "☀", dark: "☾" }

export default class extends Controller {
  static targets = ["icon", "text"]

  connect() {
    this.render(currentTheme())
    this.element.hidden = false
  }

  toggle() {
    const next = ORDER[(ORDER.indexOf(currentTheme()) + 1) % ORDER.length]
    saveTheme(next)
    applyTheme(next)
    this.render(next)
  }

  render(theme) {
    if (this.hasIconTarget) this.iconTarget.textContent = ICON[theme]
    if (this.hasTextTarget) this.textTarget.textContent = TEXT[theme]
    this.element.setAttribute("aria-label", `Theme: ${TEXT[theme]}. Click for the next setting.`)
  }
}

function currentTheme() {
  try {
    const saved = localStorage.getItem(KEY)
    return ORDER.includes(saved) ? saved : "auto"
  } catch {
    return "auto"
  }
}

function saveTheme(theme) {
  try {
    if (theme === "auto") localStorage.removeItem(KEY)
    else localStorage.setItem(KEY, theme)
  } catch {
    // Private windows may refuse storage. The page still switches for now.
  }
}

function applyTheme(theme) {
  if (theme === "auto") delete document.documentElement.dataset.theme
  else document.documentElement.dataset.theme = theme
}
