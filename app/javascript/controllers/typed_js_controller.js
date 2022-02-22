import { Controller } from "@hotwired/stimulus"

import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Instruments for everyone.", "From everyone."],
      typeSpeed: 45,
      loop: true
    });
  }
}
