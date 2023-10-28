import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="message"
export default class extends Controller {
  static values = {
    senderId: String
  }
  static targets = ["message"]

  connect() {
    this.container = this.element.parentElement;
    this.#setClasses();
    this.container.scrollTo(0, this.container.scrollHeight);
  }

  #subscriberIsSender() {
    return this.container.dataset.subscriberId == this.senderIdValue
  }

  #setClasses() {
    if(this.#subscriberIsSender()) {
      this.element.classList.add("justify-content-end");
      this.messageTarget.classList.add("sender-style")
    } else {
      this.element.classList.add("justify-content-start");
      this.messageTarget.classList.add("receiver-style")
    }
  }
}
