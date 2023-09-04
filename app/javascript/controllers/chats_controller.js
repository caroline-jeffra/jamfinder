import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chats"
export default class extends Controller {
  static targets = ['chatbox', 'chatlist']

  connect() {
  }

  display(e) {
    e.preventDefault()
    e.stopImmediatePropagation()
    const url = e.srcElement.attributes.href.value;
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then(data => this.chatboxTarget.innerHTML = data)
  }

  toggle() {
    console.log("hi");
    this.chatlistTarget.classList.toggle("d-none");
    this.chatboxTarget.classList.toggle("d-none");
  }
}
