class CustomerDecorator < Draper::Decorator
  delegate_all

  def name
    model.name.capitalize
  end

  def surname
    model.surname.capitalize
  end

  def full_name
    model.full_name.capitalize
  end

  def recent_activities(limit=10)
    model.activities.recent(limit).decorate
  end


end
