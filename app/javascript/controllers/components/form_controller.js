import { Controller } from "@hotwired/stimulus"
import { Tooltip } from 'lib/tooltip';
import { Popover } from 'lib/popover';
import { ClientValidation } from 'lib/client-validation';
import { TogglePasswordField } from 'lib/toggle-password-field';
import { CopyClipboardField } from 'lib/copy-clipboard-field';
import { RealignFormErrors } from 'lib/realign-form-errors';
import { FormSubmition } from 'lib/form-submition';
import { InputSelect2 } from 'lib/input-select2';
import { InputDatepicker } from 'lib/input-datepicker';
import { InputImageUploader } from 'lib/input-image-uploader';

export default class extends Controller {
  connect() {
    if (!document.documentElement.hasAttribute("data-turbo-preview")) {
      console.log("Connect Form controller");

      let _this = this;
      _this.initTooltip();
      _this.initPopover();
      _this.initClientValidation();
      _this.initTogglePasswordField();
      _this.initCopyClipboardField();
      _this.initRealignFormErrors();
      _this.initSelect2();
      _this.initDatepicker();
      _this.initImageUploader();

    }
  }
  initTooltip() {
    let tooltip = new Tooltip();
    tooltip.initialize();
  }
  initPopover() {
    let popover = new Popover();
    popover.initialize();
  }
  initClientValidation() {
    let clientValidation = new ClientValidation();
    clientValidation.initialize();
  }
  initTogglePasswordField() {
    let togglePasswordField = new TogglePasswordField();
    togglePasswordField.initialize();
  }
  initCopyClipboardField() {
    let copyClipboardField = new CopyClipboardField();
    copyClipboardField.initialize();
  }
  initRealignFormErrors() {
    let realignFormErrors = new RealignFormErrors();
    realignFormErrors.initialize();
  }
  initFormSubmition() {
    let formSubmition = new FormSubmition();
    formSubmition.initialize();
  }
  initSelect2() {
    let select2 = new InputSelect2();
    select2.initialize();
  }
  initDatepicker() {
    let datepicker = new InputDatepicker();
    datepicker.initialize();
  }
  initImageUploader() {
    let imageUploader = new InputImageUploader();
    imageUploader.initialize();
  }
}


