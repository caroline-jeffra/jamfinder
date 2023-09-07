// app/javascript/controllers/auto_submit_form_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["fileInput", "submitButton"];

  connect() {
    this.fileInputTarget.addEventListener("change", this.handleFileChange.bind(this));
  }

  handleFileChange() {
    if (this.fileInputTarget.files.length > 0) {
      this.submitButtonTarget.style.display = "block";
      this.submitButtonTarget.click();
    }
  }
}
