#require 'mongo'

class ArrangeController < ApplicationController
  before_filter :must_haz_user

  def index
    @arrange_mode = true
    render 'dashboard/index'
  end

  def update
    begin
      shortcut = current_user.shortcuts.find params[:shortcut_id]
      column = current_user.columns.find params[:column_id]

      if params[:column_id] == shortcut.column_id.to_s
        new = params[:position].to_i
        old = shortcut.position
        Shortcut.where(
            column_id: shortcut.column_id,
            position: {
              '$gte' => [old,new].min,
              '$lte' => [old,new].max
            }
        ).inc(:position, old > new ? 1 : -1)
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
      end

      shortcut.position = params[:position]
      shortcut.save!

      render json: { status: :ok }
    rescue Exception => e
      Rails.logger.error e
      render json: { error: e.to_s }
    end
  end

end