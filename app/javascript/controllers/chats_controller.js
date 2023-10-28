import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chats"
export default class extends Controller {
  static values = {
    url: String
  }
  static targets = ['chatbox', 'chatlist', 'messages']

  reset(event) {
    event.target.reset();
  }

  scrollDown() {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  toggle(e) {
    this.chatlistTarget.classList.toggle("d-none");
    this.chatboxTarget.classList.toggle("d-none");
    this.scrollDown();
  }

}
