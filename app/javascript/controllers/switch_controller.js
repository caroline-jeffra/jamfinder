import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch"
export default class extends Controller {
  static targets = ["switchOne, switchTwo"]

  connect() {
    console.log("Hello from our first Stimulus controller");
  }

  fire1() {
    this.switchOneTarget.classList.toggle("d-none");
    this.switchTwoTarget.classList.remove("d-none");
  }

  fire2() {
    this.switchTwoTarget.classList.toggle("d-none");
    this.switchOneTarget.classList.remove("d-none");
  }
}
