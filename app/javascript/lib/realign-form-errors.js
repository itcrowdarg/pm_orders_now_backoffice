

export class RealignFormErrors {
  initialize() {
    let _this = this;
    let invalidFeedbackElList = [].slice.call(document.querySelectorAll('.invalid-feedback.backend-validation'))

    invalidFeedbackElList.map(function (invalidFeedbackEl) {
      let inputGroup = invalidFeedbackEl.closest(".input-group");
      invalidFeedbackEl.style.display = "block";
      inputGroup.parentNode.insertBefore(invalidFeedbackEl, inputGroup.nextSibling);      
    });
  }

}