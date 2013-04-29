class AlertController < ApplicationController
  before_filter :fetch_alert

  def latest
    @alert.dismiss if @alert
  end

  private
  def fetch_alert
    @alert = Alert.first
  end


end
