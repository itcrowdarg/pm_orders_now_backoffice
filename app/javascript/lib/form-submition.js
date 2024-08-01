export class FormSubmition {
  initialize() {
    let _this = this;

    let formElList = [].slice.call(document.querySelectorAll("form"))
    formElList.map(function (formEl) {

      formEl.addEventListener('submit', function(event){
        if (formEl.checkValidity()) {
          
          let buttonSubmitElList = [].slice.call(formEl.querySelectorAll("button[type='submit']"))
          buttonSubmitElList.map(function (buttonSubmitEl) {
            buttonSubmitEl.classList.add('disabled')
          });

        }
      });
    });

  }
}

