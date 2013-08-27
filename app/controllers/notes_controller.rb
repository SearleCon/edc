class NotesController < ApplicationController
  respond_to :html, :js

  before_action :load_notable
  before_action :new_resource, only: [:new, :create]
  before_action :get_resource, only: [:destroy]

  def index
    @notes = @notable.notes.page(params[:page])
    respond_with @notes
  end

  def create
    respond_with(@note)
  end

  def destroy
    respond_with(@note)
  end

  private
  def load_notable
   resource, id = request.path.split('/')[1, 2]
   @notable = resource.classify.constantize.find(id)
  end

  def new_resource
    @note = @notable.notes.new(note_params)
  end

  def get_resource
    @note = @notable.notes.find(params[:id])
  end

  def note_params
    permitted_params.note if params[:note]
  end


end