class HomeController < ApplicationController
  def index
    if current_user&.role=="admin"
      redirect_to admin_path
    elsif current_user&.role=="seller"
      @user=User.find(current_user.id)
      @products=@user.products
    else
      @products=Product.all
    end
  end

  def admin_page
    render :admin_page
  end
end
