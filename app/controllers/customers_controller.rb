class CustomersController < ApplicationController
  responders :flash

  before_action :set_customer, only: [:show, :destroy]

  def index
    @customers = Customer.all
  end

  def show; end

  def destroy
    @customer.destroy
    respond_with @customer
  end

  private
   def set_customer
     @customer = Customer.find(params[:id])
   end

   def interpolation_options
      { resource_name: @customer.full_name }
   end

end