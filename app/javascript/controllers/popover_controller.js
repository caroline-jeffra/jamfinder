import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popover"
export default class extends Controller {
  static targets = ['bio', 'genre', 'instrument', 'images']
  bio(){
    this.bioTarget.classList.toggle('d-none')
  }
  genre(){
    this.genreTarget.classList.toggle('d-none')
  }
  instrument(){
    this.instrumentTarget.classList.toggle('d-none')
  }
  images(){
    this.imagesTarget.classList.toggle('d-none')
  }
}
