import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch-btn"
export default class extends Controller {
  static targets = ["switch1", "switch2", "switch3", "switch4"]
  connect() {
    console.log("hi")
    switch2Target.classList.add("mapboxgl-render");
    console.log("hi2")
  }
  fire1() {
    this.switch1Target.classList.add("mapboxgl-render");
    this.switch2Target.classList.remove("mapboxgl-render");
    this.switch3Target.classList.remove("btn-primary");
    this.switch3Target.classList.add("btn-outline-primary");
    this.switch4Target.classList.remove("btn-outline-primary");
    this.switch4Target.classList.add("btn-primary");
  }

  fire2() {
    this.switch1Target.classList.remove("mapboxgl-render");
    this.switch2Target.classList.add("mapboxgl-render");
    this.switch3Target.classList.add("btn-primary");
    this.switch3Target.classList.remove("btn-outline-primary");
    this.switch4Target.classList.add("btn-outline-primary");
    this.switch4Target.classList.remove("btn-primary");
  }
}
