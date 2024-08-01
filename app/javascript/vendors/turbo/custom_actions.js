import { Turbo } from "@hotwired/turbo-rails"

Turbo.StreamActions.redirect = function () {
  const url = this.getAttribute('url') || '/'

  //history.pushState(history.state, "", url);
  //Turbo.navigator.history.push(url);

  //Turbo.visit(url, {frame: '_top', action: 'advance'})
  // Better this:
  Turbo.visit(url)
}