import consumer from "./consumer"
document.addEventListener('turbolinks:load', () => {
  const room_element = document.getElementById('room-id');
  const room_id = room_element.getAttribute('data-room-id');

  consumer.subscriptions.create({ channel:"GroupChatChannel", room_id: room_id }, {
	  connected() {

	    // Called when the subscription is ready for use on the server
	  },

	  disconnected() {
	    // Called when the subscription has been terminated by the server
	  },

	  received(data) {
	  	console.log(data)
	  	 const html = ` <p> - ${data.user} :
      					${data.message}</p>`
    	const element = document.getElementById("group_message")

    	element.insertAdjacentHTML("beforeend", html)
	    // Called when there's incoming data on the websocket for this channel
	  }
	});
});

