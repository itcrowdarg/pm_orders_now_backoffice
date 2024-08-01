import { Controller } from "@hotwired/stimulus"
import { Tooltip } from 'lib/tooltip';
import { Popover } from 'lib/popover';
import { FlashMessage } from 'lib/flash-message';
import { Sidebar } from 'lib/sidebar';
import { CustomConfirm } from 'lib/custom-confirm';
import { OffCanvasElements } from 'lib/off-canvas-elements';
import { BodyScrolleable } from 'lib/body-scrolleable';
import { Modals } from 'lib/modals';

export default class extends Controller {
  connect() {
    if (!document.documentElement.hasAttribute("data-turbo-preview")) {
      console.log("Connect LayoutAdmin controller");

      let _this = this;
      window.layout_admin = this;
      _this.initTooltip();
      _this.initPopover();
      _this.initFlashMessage();
      _this.initSidebar();
      _this.initCustomConfirm();
      _this.initModals();
      _this.initOffCanvas();
      _this.initBodyScrolleable();
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

  initFlashMessage() {
    let flashMessage = new FlashMessage();
    flashMessage.initialize();
  }

  initCustomConfirm() {
    let customConfirm = new CustomConfirm();
    customConfirm.initialize();
  }



  initModals() {
    let modals = new Modals();
    modals.initialize();
  }

  initSidebar() {
    let sidebar = new Sidebar();
    sidebar.initialize();
  }

  initOffCanvas() {
    let offCanvasElements = new OffCanvasElements();
    offCanvasElements.initialize();
  }

  initBodyScrolleable() {
    let bodyScrolleable = new BodyScrolleable();
    bodyScrolleable.initialize();
  }


}

