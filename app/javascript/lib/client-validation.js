

export class ClientValidation {
  initialize() {
    let _this = this;

    Array.from(document.querySelectorAll('.needs-validation')).forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
          form.classList.add('was-validated')
          _this.eventBindings(form)
          _this.removeBackendInvalidFeedback(form)
          _this.addInvalidFeedback(form)
        }
      }, false)
    })
  }


  eventBindings(form){
    let _this = this;

    Array.from(form.querySelectorAll("input")).forEach(function (field) {
      _this.inputEventBinding(field, 'input', form)
    })

    Array.from(form.querySelectorAll("select")).forEach(function (field) {
      _this.inputEventBinding(field, 'change',form)
    })

    Array.from(form.querySelectorAll("textarea")).forEach(function (field) {
      _this.inputEventBinding(field, 'input',form)
    })
  }

  removeBackendInvalidFeedback(form){
    let _this = this;
    Array.from(form.querySelectorAll(".invalid-feedback.backend-validation")).forEach(function (invalidFeedback) {
      invalidFeedback.style.display = 'none';
    });
    Array.from(form.querySelectorAll(".form-control.is-invalid")).forEach(function (input) {
      input.classList.remove('is-invalid');
    });
  }

  addInvalidFeedback(form){
    let _this = this;


    Array.from(form.querySelectorAll("[required]")).forEach(function (field) {
        if ((field.dataset.errorRequired != undefined) && (!field.dataset.errorRequiredPrint)){
          field.parentNode.querySelectorAll('.invalid-feedback:not(.client-validation)').forEach(e => e.remove());

          let inputGroup = field.closest(".input-group");
          let invalidFeedback = document.createElement("div");
          invalidFeedback.innerText = field.dataset.errorRequired;
          invalidFeedback.className = "invalid-feedback client-validation error-required";
          invalidFeedback.style.display = 'none';
          inputGroup.parentNode.insertBefore(invalidFeedback, inputGroup.nextSibling);
          field.dataset.errorRequiredPrint = true
        }
    });
    Array.from(form.querySelectorAll("[step]")).forEach(function (field) {
        if ((field.dataset.errorStep != undefined) && (!field.dataset.errorStepPrint)){
          field.parentNode.querySelectorAll('.invalid-feedback:not(.client-validation)').forEach(e => e.remove());

          let inputGroup = field.closest(".input-group");
          let invalidFeedback = document.createElement("div");
          invalidFeedback.innerText = field.dataset.errorStep;
          invalidFeedback.className = "invalid-feedback client-validation error-step";
          invalidFeedback.style.display = 'none';
          inputGroup.parentNode.insertBefore(invalidFeedback, inputGroup.nextSibling);
          field.dataset.errorStepPrint = true
        }
    });
    Array.from(form.querySelectorAll("[min]")).forEach(function (field) {
        if ((field.dataset.errorStep != undefined) && (!field.dataset.errorMinPrint)){
          field.parentNode.querySelectorAll('.invalid-feedback:not(.client-validation)').forEach(e => e.remove());
          
          let inputGroup = field.closest(".input-group");
          let invalidFeedback = document.createElement("div");
          invalidFeedback.innerText = field.dataset.errorMin;
          invalidFeedback.className = "invalid-feedback client-validation error-min";
          invalidFeedback.style.display = 'none';
          inputGroup.parentNode.insertBefore(invalidFeedback, inputGroup.nextSibling);
          field.dataset.errorMinPrint = true
        }
    });
    Array.from(form.querySelectorAll("[type='email']")).forEach(function (field) {
      if ((field.dataset.errorEmail != undefined) && (!field.dataset.errorEmailPrint)){
        field.parentNode.querySelectorAll('.invalid-feedback:not(.client-validation)').forEach(e => e.remove());

        let inputGroup = field.closest(".input-group");
        let invalidFeedback = document.createElement("div");
        invalidFeedback.innerText = field.dataset.errorEmail;
        invalidFeedback.className = "invalid-feedback client-validation error-email";
        invalidFeedback.style.display = 'none';
        inputGroup.parentNode.insertBefore(invalidFeedback, inputGroup.nextSibling);
        field.dataset.errorEmailPrint = true
      }
  });


    Array.from(form.querySelectorAll("[min]")).forEach(function (field) {
      _this.showCorrespondingFeedback(field)
    })
    Array.from(form.querySelectorAll("[required]")).forEach(function (field) {
      _this.showCorrespondingFeedback(field)
    })
    Array.from(form.querySelectorAll("[step]")).forEach(function (field) {
      _this.showCorrespondingFeedback(field)
    })
    Array.from(form.querySelectorAll("[type='email']")).forEach(function (field) {
      _this.showCorrespondingFeedback(field)
    })    
  }

  inputEventBinding(field, listener, form){ 
    let _this = this;

    field.addEventListener(listener, function (event) {
      let inputGroup = field.closest(".input-group");

      field.classList.remove('is-invalid')
      inputGroup.parentNode.querySelectorAll('.invalid-feedback').forEach(function(el){
        el.style.display = "none";
      });

      form.checkValidity()
      form.classList.add('was-validated')
    })
    
    field.addEventListener('invalid', (e) => {
      _this.showCorrespondingFeedback(e.target)
    })
  }

  showCorrespondingFeedback(field){
    let validRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    let inputGroup = field.closest(".input-group");

    if((field.required == true) && ((field.value == '') || (field.value == undefined))){
      inputGroup.parentNode.querySelector('.invalid-feedback.error-required').style.display = "block";
    }
    if((field.step != '') && (field.step != undefined) && (field.value != '') && (field.value != undefined) && ((parseFloat(field.value) % parseFloat(field.step)) != 0.0)){
      inputGroup.parentNode.querySelector('.invalid-feedback.error-step').style.display = "block";
    }
    if((field.min != '') && (field.min != undefined) && (field.value != '') && (field.value != undefined) && (parseFloat(field.value) < parseFloat(field.min))){
      inputGroup.parentNode.querySelector('.invalid-feedback.error-min').style.display = "block";
    }
    if((field.type == 'email') && (field.value != '') && (field.value != undefined) && (!field.value.match(validRegex))){
      inputGroup.parentNode.querySelector('.invalid-feedback.error-email').style.display = "block";
    }
  }


}
