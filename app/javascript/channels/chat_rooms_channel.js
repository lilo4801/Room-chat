import consumer from "./consumer"

consumer.subscriptions.create("ChatRoomsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('hello')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

   received(data) {
     this.appendLine(data)
 	},
 	

  appendLine(data) {
    const html = this.createLine(data)
    const element = document.getElementById("msg")

    element.insertAdjacentHTML("beforeend", html)
  },

  createLine(data) {
    return `
      <p> - ${data.user} :
      ${data.message}</p>
     
    `
  }
});
