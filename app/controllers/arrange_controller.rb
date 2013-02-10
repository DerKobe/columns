#require 'mongo'

class ArrangeController < ApplicationController
  before_filter :must_haz_user

  def index
    @arrange_mode = true
    render 'dashboard/index'
  end

  def update_shortcut
    begin
      shortcut = current_user.shortcuts.find params[:shortcut_id]
      column = current_user.columns.find params[:column_id]

      if params[:column_id] == shortcut.column_id.to_s
        new = params[:position].to_i
        old = shortcut.position
        if old != new
          Shortcut.where(
              column_id: shortcut.column_id,
              position: {
                '$gte' => [old,new].min,
                '$lte' => [old,new].max
              }
          ).inc(:position, old > new ? 1 : -1)
          shortcut.position = params[:position]
          shortcut.save!
        end
      else
        Shortcut.where(
            column_id: shortcut.column_id,
            position: { '$gt' => shortcut.position }
        ).inc(:position, -1)
        Shortcut.where(
            column_id: column.id,
            position: { '$gte' => params[:position].to_i }
        ).inc(:position, 1)

        shortcut.column = column
        shortcut.position = params[:position]
        shortcut.save!
      end

      render json: { status: :ok }
    rescue Exception => e
      Rails.logger.error e
      render json: { status: :error }
    end
  end

  def update_column
    begin
      column = current_user.columns.find params[:column_id]

      Rails.logger.log params.inspect

      new = params[:position].to_i
      old = column.position

      Rails.logger.log [old,new].inspect

      if old != new
        current_user.columns.where(
            position: {
              '$gte' => [old,new].min,
              '$lte' => [old,new].max
            }
        ).inc(:position, old > new ? 1 : -1)
        column.position = params[:position]
        column.save!
      end

      render json: { status: :ok }
    rescue Exception => e
      Rails.logger.error e
      render json: { status: :error }
    end
  end

end