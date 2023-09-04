import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    minDate: "today"})
  }
}
