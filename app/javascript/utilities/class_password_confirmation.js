export class PasswordConfirmation {
  constructor(form) {
    this.form = form
    this.password = form.elements.user_password
    this.password_confirmation = form.elements.user_password_confirmation

    this.setup()
  }

  resetStyleForinputs() {
    this.password_confirmation.classList.remove('input-green');
    this.password_confirmation.parentElement.classList.remove('success');
    this.password_confirmation.classList.remove('input-red');
    this.password_confirmation.parentElement.classList.remove('failed');
  }

  checkPassword() {
    this.resetStyleForinputs()

    if(this.password_confirmation.value === this.password.value) {
      this.password_confirmation.classList.add('input-green')
      this.password_confirmation.parentElement.classList.add('success')
    } else {
      this.password_confirmation.classList.add('input-red')
      this.password_confirmation.parentElement.classList.add('failed')
    }
  }

  setup() {
    this.form.addEventListener('keyup', event => {
      if (this.password.value != '') this.checkPassword()
    })
  }
}
