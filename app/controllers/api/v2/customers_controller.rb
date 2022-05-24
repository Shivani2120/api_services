class Api::V2::CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers or /customers.json
  def index
    @customers = Customer.all
    render json: {customers: @customers}
  end

  # GET /customers/1 or /customers/1.json
  def show
    render json: @customer
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)
      if @customer.save
        render json: @customer
      else
        render error: { error: "Unable to create customer"}, status: 400
      end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
      if @customer.update(customer_params)
        render json: {message: "Customer successfully updated"}, status:200
      else
        render json: { error: "Unable to update Customer."}, status:400
      end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    if @customer.destroy
      render json: {message: "Customers successfully deleted"}, status: 200
    else
      render json: {error: "Customers unable to delete "}, status: 200 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :contact, :email)
    end
end
