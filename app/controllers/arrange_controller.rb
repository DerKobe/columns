class ArrangeController < ApplicationController
  before_filter :must_haz_user

  def index
    @arrange_mode = true
    render 'dashboard/index'
  end

end