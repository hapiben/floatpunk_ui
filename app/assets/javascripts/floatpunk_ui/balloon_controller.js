import { Controller } from "@hotwired/stimulus"

// Moves the balloon on a .board. Put it on the board element:
//
//   <div class="board board-grid"
//        data-controller="balloon"
//        data-balloon-air-value="1">
//
// air goes from 1 (top of the sky) to 0 (the sea). Change it from another
// controller through an outlet, or by setting the data-balloon-air-value
// attribute. The controller writes --air for the CSS, and adds .low when air
// is under the lowBelow value.
//
//   this.balloonOutlet.airValue = 0.6   // move the balloon
//   this.balloonOutlet.boost()          // fire the burner for a moment
//   this.balloonOutlet.win()            // float off the top
//   this.balloonOutlet.lose()           // splash into the sea
//   this.balloonOutlet.reset()          // back to full air, no states
export default class extends Controller {
  static values = {
    air: { type: Number, default: 1 },
    lowBelow: { type: Number, default: 0.25 },
    boostMs: { type: Number, default: 600 }
  }

  airValueChanged() {
    const air = Math.min(1, Math.max(0, this.airValue))
    this.element.style.setProperty("--air", air.toFixed(4))
    this.element.classList.toggle("low", air < this.lowBelowValue && !this.finished)
  }

  boost() {
    this.element.classList.remove("boost")
    void this.element.offsetWidth // Restart the animation if it is already running.
    this.element.classList.add("boost")
    clearTimeout(this.boostTimer)
    this.boostTimer = setTimeout(() => this.element.classList.remove("boost"), this.boostMsValue)
  }

  win() {
    this.element.classList.remove("over", "low")
    this.element.classList.add("won")
  }

  lose() {
    this.element.classList.remove("won", "low")
    this.element.classList.add("over")
    this.airValue = 0
  }

  reset() {
    this.element.classList.remove("won", "over", "boost", "low")
    this.airValue = 1
  }

  get finished() {
    return this.element.classList.contains("won") || this.element.classList.contains("over")
  }

  disconnect() {
    clearTimeout(this.boostTimer)
  }
}
