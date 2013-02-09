class ShortcutsController < ApplicationController
  before_filter :must_haz_user

  def index
  end

  def new
    @shortcut = Shortcut.new color: 'none'
  end

  def create
    Rails.logger.log params.inspect
    @shortcut = Shortcut.new params[:shortcut]

    begin
      @shortcut.save!
      redirect_to :root
    rescue Mongoid::Errors::Validations
      render :new
    end
  end

end