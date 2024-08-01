import { Controller } from "@hotwired/stimulus"
import { Tooltip } from 'lib/tooltip';
import { Popover } from 'lib/popover';

export default class extends Controller {
  connect() {
    if (!document.documentElement.hasAttribute("data-turbo-preview")) {
      console.log("Connect TableRow controller");

      let _this = this;
      _this.initTooltip();
      _this.initPopover();
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
}


