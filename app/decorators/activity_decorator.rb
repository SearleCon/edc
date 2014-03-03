class ActivityDecorator < Draper::Decorator
  delegate_all

  def name
    model.name.humanize
  end

  def username
    user.name.to_s.titleize
  end

  def occurred
    h.fa_icon('clock-o', text: "#{h.distance_of_time_in_words_to_now(created_at)} ago")
  end
end

