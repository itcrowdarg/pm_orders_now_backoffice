
export class Modals {
  initialize() {
    let myModalEl = document.querySelector('#modal-form-entity');
    if(myModalEl != undefined){
      myModalEl.addEventListener('shown.bs.modal', function(){
        let inputAutofocus = myModalEl.querySelector("[autofocus='autofocus']");
        if(inputAutofocus != undefined){
          inputAutofocus.focus();
        }
      });    
    }

    let myModalElTwo = document.querySelector('#modal-form-entity-two');
    if(myModalElTwo != undefined){
      myModalElTwo.addEventListener('shown.bs.modal', function(){
        let inputAutofocus = myModalElTwo.querySelector("[autofocus='autofocus']");
        if(inputAutofocus != undefined){
          inputAutofocus.focus();
        }
      });
      myModalElTwo.addEventListener('hidden.bs.modal', function(){
        let myModalElPrev = bootstrap.Modal.getOrCreateInstance(myModalEl, {backdrop: 'static'});
        myModalElPrev.show();
        let inputAutofocus = myModalEl.querySelector("[autofocus='autofocus']");
        if(inputAutofocus != undefined){
          inputAutofocus.focus();
        }
      });
    }
  }
}
