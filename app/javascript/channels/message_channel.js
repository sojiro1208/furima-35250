import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const MessageList = document.getElementById('messages');
    const html = `
    <div class="message">
    <div class="message-user"><p>${data.user.nickname}さん</p></div>
    <div class="message-text"><p>${data.content.text}</p></div>
    <div class="message-time"><p>${data.time}</p></div>
    </div>
    `
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_text');
    const messageUser = document.getElementById('message_user_nickname');
    const messageTime = document.getElementById('message_created_at');
    messages.insertAdjacentHTML('beforeend', html);
    newMessage.value='';
  }
});


