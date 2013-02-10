class ShortcutsController < ApplicationController
  before_filter :must_haz_user

  def new
    @shortcut = Shortcut.new color: 'none'
    @shortcut.column = current_user.columns.first
    @sublinks = [{title:'',url:''}]
    if @shortcut.column.nil?
      Rails.logger.log @shortcut.column.inspect
      flash[:warning] = 'You have to create a column first!'
      redirect_to new_column_url
    end
  end

  def create
    @shortcut = current_user.shortcuts.new params[:shortcut]
    @sublinks = ActiveSupport::JSON.decode params[:sublinks_serialized]

    begin
      @shortcut.save!
      redirect_to :root
    rescue Mongoid::Errors::Validations
      render :new
    end
  end

  def edit
    @shortcut = current_user.shortcuts.find params[:id]
    render :new
  end

  def update
    begin
      @shortcut = current_user.shortcuts.find params[:id]
      @shortcut.write_attributes params[:shortcut]
      @shortcut.save!
      redirect_to arrange_url
    rescue Mongoid::Errors::Validations
      render :new
    end
  end

  def destroy
    @shortcut = current_user.shortcuts.find params[:id]
    @shortcut.destroy
    redirect_to arrange_url
  end

end