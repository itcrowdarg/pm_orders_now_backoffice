import { Controller } from "@hotwired/stimulus"

var time = 0;

export default class extends Controller {

  
  connect() {
    if (!document.documentElement.hasAttribute("data-turbo-preview")) {
      console.log("Connect FormFilter controller");
    }
  }
  
  inputChange() {
    let _this = this;
    let controllerContainer = _this.context.element;
    Turbo.navigator.submitForm(controllerContainer);
  }
  
  inputWrite() {
    let _this = this;
    let controllerContainer = _this.context.element;
    
    
    clearTimeout(time);
    time = setTimeout(function() {
      Turbo.navigator.submitForm(controllerContainer);
    }, 500);
  }
}


