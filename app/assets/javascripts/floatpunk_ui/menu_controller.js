import { Controller } from "@hotwired/stimulus"

// The mobile menu. On phones the nav folds away behind a Menu button.
// From 720px up the button is hidden and the nav always shows.
// Without JavaScript the nav always shows, at every width.
//
//   <div class="site-menu" data-controller="menu">
//     <button type="button" class="site-menu-toggle" data-action="menu#toggle"
//             aria-expanded="false" aria-controls="site-nav">Menu</button>
//     <nav id="site-nav" class="site-nav" aria-label="Main">…</nav>
//   </div>
export default class extends Controller {
  static classes = ["open"]

  connect() {
    this.element.dataset.menuReady = ""
  }

  toggle(event) {
    const open = this.element.classList.toggle(this.hasOpenClass ? this.openClass : "open")
    event.currentTarget.setAttribute("aria-expanded", String(open))
  }
}
