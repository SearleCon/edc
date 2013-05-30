module Ajax
  extend ActiveSupport::Concern

  included do
    before_filter :set_layout, :correct_xhr_headers
    after_filter :set_xhr_flash
  end

  private

  def correct_xhr_headers
    if request.xhr?
     ajax_request_types = ['text/javascript', 'application/json', 'text/xml']
     request.accepts.sort! { |x, y| ajax_request_types.include?(y.to_s) ? 1 : -1 }
    end
  end

  def set_layout
    action_has_layout = !request.xhr?
  end

  def set_xhr_flash
    flash.discard  if request.xhr?
  end

end