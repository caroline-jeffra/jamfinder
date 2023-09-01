import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popover"
export default class extends Controller {
  static targets = ['bio']
  bio(){
    this.bioTarget.classList.toggle('d-none')
  }

}
