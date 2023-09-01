import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch-btn"
export default class extends Controller {
  static targets = ["switch1", "switch2", "switch3", "switch4"]
  connect() {
  }
  fire1() {
    this.switch1Target.classList.add("d-none");
    this.switch2Target.classList.remove("d-none");
    this.switch3Target.classList.remove("btn-primary");
    this.switch3Target.classList.add("btn-outline-primary");
    this.switch4Target.classList.remove("btn-outline-primary");
    this.switch4Target.classList.add("btn-primary");
  }

  fire2() {
    this.switch1Target.classList.remove("d-none");
    this.switch2Target.classList.add("d-none");
    this.switch3Target.classList.add("btn-primary");
    this.switch3Target.classList.remove("btn-outline-primary");
    this.switch4Target.classList.add("btn-outline-primary");
    this.switch4Target.classList.remove("btn-primary");
  }
}
