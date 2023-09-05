import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chats"
export default class extends Controller {
  static values = {
    url: String
  }
  static targets = ['chatbox', 'chatlist', 'messages']

  connect() {
    if(this.urlValue) {
      this.load(this.urlValue)
    }
  }

  display(e) {
    e.preventDefault()
    e.stopImmediatePropagation()
    const url = e.srcElement.attributes.href.value;
    this.load(url);
  }

  load(url) {
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then(data => {
        this.chatboxTarget.innerHTML = data
        this.toggle()
        this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
      })
  }

  toggle() {
    this.chatlistTarget.classList.toggle("d-none");
    this.chatboxTarget.classList.toggle("d-none");
  }

}
