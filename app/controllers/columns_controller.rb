class ColumnsController < ApplicationController
  before_filter :must_haz_user

  def new
    @column = Column.new
  end

  def create
    @column = Column.new params[:column]
    @column.user = current_user

    begin
      @column.save!
      redirect_to :root
    rescue Mongoid::Errors::Validations
      render :new
    end
  end

  def edit
    @column = current_user.columns.find(params[:id])
  end

end