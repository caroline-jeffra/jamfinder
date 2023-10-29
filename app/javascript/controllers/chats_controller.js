import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chats"
export default class extends Controller {
  static values = {
    url: String,
    subscriberId: String
  }

  static targets = ['chatbox', 'chatlist', 'messages', 'message']

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

  messageTargetConnected(message) {
    this.#setClasses(message, message.parentElement);
    this.scrollDown();
  }

  #setClasses(message, messageWrapper) {
    if(this.subscriberIdValue == message.dataset.senderId) {
      messageWrapper.classList.add("justify-content-end");
      message.classList.add("sender-style")
    } else {
      messageWrapper.classList.add("justify-content-start");
      message.classList.add("receiver-style")
    }
  }

}
