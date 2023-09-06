import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-upload"
export default class extends Controller {
  static targets = ["input", "form"]

  connect() {
    console.log("hihi")
  }

  upload(event) {
    const reader = new FileReader();
    reader.onload = (event) => {
      this.formTarget.submit();
    }
  }
}
