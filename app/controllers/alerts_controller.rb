class AlertsController < ApplicationController
 def index
   @alerts = Alert.active
 end

 def destroy
   @alert = Alert.find(params[:id])
   @alert.destroy
   respond_with(@alert, head: :no_content)
 end
end
