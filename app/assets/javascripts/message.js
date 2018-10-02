$(function(){

   function buildHTML(message){
   	var Image = '';

   	if ( message.image ){
      Image = `<img src= "${message.image}"/>`
    };

     var html = `<div class='chat-body'>
					<p class='chat-body__name'></p>
					<span class='chat-body__name'>
					${message.name}
					</span>
					<span class='chat-body__name--time'>
					<time>${message.created_at}<time>
					</span>
					<p class='chat-body__name--time--messages'>
					${message.body}
					</p>
					<p class='chat-body_image'>
					${Image}
					</p>
					</div>`
	return html;
   }

   $('#new_message').on('submit', function(e){
      e.preventDefault();
      console.log(this);
      var formData = new FormData(this);
      var url = $(this).attr('action')

   $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
   })

   .done(function(data){
      var html = buildHTML(data);
      $('#new_message')[0].reset();
      $('.Send').prop('disabled', false);
      $('.chat-body-all').append(html);
      $('.chat-footer').val('')
      $('.chat-body-all').animate({scrollTop: $('.chat-body-all')[0].scrollHeight});
    })

   .fail(function(){
   	  $('.Send').prop('disabled', false);
      alert('error');
    })

   })
});