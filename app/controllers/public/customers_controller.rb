class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:show, :edit, :update]
  
  def show
  end
  
  def edit
  end
  
  def update
    current_customer.update(customer_params)
    redirect_to customers_path
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :manaba_user_id, :manaba_password, :line_path, :email, :is_active)
  end
end
