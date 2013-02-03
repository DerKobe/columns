module ApplicationHelper

  def is_nav_item_active?(item)
    controller.class.name == "#{item}Controller" ? 'active' : ''
  end

  def separator_needed?(neighbours)
    neighbours.reduce('') do |s,n|
      s = 'hide' if controller.class.name == "#{n}Controller"
      s
    end
  end

end
