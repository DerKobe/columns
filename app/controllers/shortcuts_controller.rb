class ShortcutsController < ApplicationController

  def index
  end

  def new
    @shortcut = Shortcut.new color: 'none'
  end

  def create
    @shortcut = Shortcut.new params[:shortcut]

    begin
      @shortcut.save!
    rescue Mongoid::Errors::Validations
      render :new
    end
  end

end