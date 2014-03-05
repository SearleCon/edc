class CustomersController < ApplicationController
  responders :flash

  before_action :set_customer, only: [:edit, :show, :destroy,  :update]

  decorates_assigned :customer

  def index
    @customers = Customer.all
  end

  def edit
    sleep 5
  end

  def show; end

  def update
    @customer.update(customer_params)
    respond_with @customer
  end

  def destroy
    @customer.destroy
    respond_with @customer
  end

  private
   def set_customer
     @customer = Customer.find(params[:id])
   end

   def customer_params
     params.require(:customer).permit(:name, :surname)
   end

   def interpolation_options
      { resource_name: @customer.full_name }
   end

end