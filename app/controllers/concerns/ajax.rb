module Ajax
  extend ActiveSupport::Concern

  included do
    before_filter :set_layout, if: :ajax_request
    before_filter :correct_safari_and_ie_accept_headers, if: :ajax_request
    after_filter :set_xhr_flash, if: :ajax_request
  end

  private
  def ajax_request
    request.xhr?
  end

  def correct_safari_and_ie_accept_headers
    ajax_request_types = ['text/javascript', 'application/json', 'text/xml']
    request.accepts.sort! { |x, y| ajax_request_types.include?(y.to_s) ? 1 : -1 }
  end

  def set_layout
    self.action_has_layout = false
  end

  def set_xhr_flash
    flash.discard
  end

end