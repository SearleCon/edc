class CustomerDecorator < Draper::Decorator
  delegate_all

  def name
    model.name.capitalize
  end

  def surname
    model.surname.capitalize
  end

  def full_name
    model.full_name.titleize
  end



end
