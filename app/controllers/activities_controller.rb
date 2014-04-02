class ActivitiesController < ApplicationController
  respond_to :js

  before_action :load_trackable

  def index
    @activities = @trackable.activities
  end

  private
    def load_trackable
      resource, id = request.path.split('/')[1, 2]
      @trackable = resource.classify.constantize.find(id)
    end
end