import {PasswordConfirmation} from 'utilities/class_password_confirmation.js'

document.addEventListener('turbolinks:load', function() {
  const reg_form = document.getElementById('new_user')

  if (reg_form) new PasswordConfirmation(reg_form)
})
