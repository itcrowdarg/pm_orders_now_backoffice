module Admin
  class AdminController < ApplicationController
    before_action :authenticate_user!

    def toggle_sidebar
      session[:sidebar_collapsed] = session[:sidebar_collapsed] ? false : true
      head :ok
    end
  end
end
