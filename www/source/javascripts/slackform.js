/*global io,superagent*/

var body = document.body;
var request = superagent;

// elements
var form = body.querySelector('form#invite');
var channel = form.elements['channel'] || {};
var email = form.elements['email'];
var coc = form.elements['coc'];
var button = body.querySelector('button');

// remove loading state
button.className = '';

// capture submit
body.addEventListener('submit', function(ev){
  ev.preventDefault();
  button.disabled = true;
  button.className = '';
  button.innerHTML = 'Please Wait';
  invite(channel ? channel.value : null, coc && coc.checked ? 1 : 0, email.value, function(err, msg){
    if (err) {
      button.removeAttribute('disabled');
      button.className = 'error';
      button.innerHTML = err.message;
    } else {
      button.className = 'success';
      button.innerHTML = msg;
    }
  });
});


function invite(channel, coc, email, fn){
  request
  .post(data.path + 'invite')
  .send({
    coc: coc,
    channel: channel,
    email: email
  })
  .end(function(res){
    if (res.body.redirectUrl) {
      var err = new Error(res.body.msg || 'Server error');
      window.setTimeout(function() {
        topLevelRedirect(res.body.redirectUrl);
      }, 1500);
    }
    if (res.error) {
      var err = new Error(res.body.msg || 'Server error');
      return fn(err);
    } else {
      fn(null, res.body.msg);
    }
  });
}
