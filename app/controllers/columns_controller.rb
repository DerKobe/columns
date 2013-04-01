class ColumnsController < ApplicationController
  before_filter :must_haz_user

  def new
    @column = Column.new
  end

  def create
    @column = current_user.columns.new params[:column]

    begin
      @column.save!
      redirect_to :root
    rescue Mongoid::Errors::Validations
      render :new
    end
  end

  def edit
    begin
      @column = current_user.columns.find params[:id]
    rescue Mongoid::Errors::DocumentNotFound => e
      Rails.logger.error e
      redirect_to :root
    else
      render :new
    end
  end

  def update
    begin
      @column = current_user.columns.find params[:id]
      @column.title = params[:column][:title]
    rescue Mongoid::Errors::DocumentNotFound => e
      Rails.logger.error e
      redirect_to :root
    else
      begin
        @column.save!
        redirect_to arrange_url
      rescue Mongoid::Errors::Validations
        render :new
      end
    end
  end

  def destroy
    begin
      column = current_user.columns.find params[:id]
    rescue Mongoid::Errors::DocumentNotFound => e
      Rails.logger.error e
    else
      Shortcut.where(column_id: column.id).delete
      column.delete
    end
    redirect_to arrange_url
  end

end