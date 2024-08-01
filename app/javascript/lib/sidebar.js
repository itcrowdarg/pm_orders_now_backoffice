import { get } from '@rails/request'

export class Sidebar {
  initialize() {
    let _this = this;
    let toggleSidebar = document.querySelector('#toggle-sidebar');
    let toggleSidebarMobile = document.querySelector('#toggle-sidebar-mobile');
    let sidebar = document.querySelector('#sidebar');
    
    if (sidebar != null){
      toggleSidebarMobile.removeEventListener('click', function(event){ _this.toggleSidebarMobile(event, _this); });
      toggleSidebar.removeEventListener('click', function(event){ _this.toggleSidebar(event, _this); });
      toggleSidebarMobile.addEventListener('click', function(event){ _this.toggleSidebarMobile(event, _this); });
      toggleSidebar.addEventListener('click', function(event){ _this.toggleSidebar(event, _this); });
    }
  }

  toggleSidebar(event, _this){
    let body = document.querySelector('body');

    if (_this.isReduced()){
      body.classList.remove('reduced');
    }
    else{
      body.classList.add('reduced');
    }
    get('/toggle_sidebar')
  }

  toggleSidebarMobile(event, _this){
    let sidebar = document.querySelector('#sidebar');

    if (_this.isOpened()){
      sidebar.classList.remove('opened');
    }
    else{
      sidebar.classList.add('opened');
    }
  }

  isReduced(){
    let body = document.querySelector('body');

    return body.classList.contains('reduced');
  }

  isOpened(){
    let sidebar = document.querySelector('#sidebar');

    return sidebar.classList.contains('opened');
  }
}

