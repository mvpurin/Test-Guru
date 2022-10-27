document.addEventListener('turbolinks:load', function() {
  var button = document.querySelector('.actions')

  if (button) {button.addEventListener('click', check)}
})

function check() {
  var password = document.getElementById('user_password').value;
  var confirm_password = document.getElementById('user_password_confirmation').value;

  if (password === confirm_password && !isEmpty(password) && !isEmpty(confirm_password)) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'matching'
  }
  else if (isEmpty(password) && isEmpty(confirm_password)) {
    return
  }
  else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'not matching';
  }
}

function isEmpty(str) {
  if (str.trim() == '') {
    return true
  }
}
