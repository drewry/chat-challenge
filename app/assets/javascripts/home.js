jQuery(function ($) {
  var renderMessage = function (message) {
    var html = '';

    if (message.is_you) {
      html += '<div class="message you">';
    } else {
      html += '<div class="message">';
    }

    html += '<span class="timestamps">' + message.created_at + '</span>';
    html += '<span class="email">' + message.user.email + '</span>';
    html += '<p>' + message.content + '</p>';
    html += '</div>';
    
    return html;
  };

  var updateMessages = function () {
    $.get('/messages').done(function (res) {
      var messages = res.messages;

      if(messages.length > 0) {
        $('#messages').html('');

        for (var i = 0; i < messages.length; i++) {
          var message = messages[i];

          $('#messages').append(renderMessage(message));
        }
      } else {
        $('#messages').text('There are no messages, try sending one!');
      }
    });
  };

  updateMessages();
  setInterval(function () {
    updateMessages();
  }, 2000);

  $('button.submit').click(function (e) {
    var content = $('form.message textarea').val();

    if(content.length > 0) {
      $.post('/messages', { message: { content: content } }).done(function (message) {
        $('#messages').append(renderMessage(message));
        $('form.message textarea').val('');
      });
    } else {
      swal('Uh oh', 'You need some content before we will send your mesage!', 'error');
    }
  });
});