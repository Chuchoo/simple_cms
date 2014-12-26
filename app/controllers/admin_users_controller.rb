class AdminUsersController < ApplicationController

  layout 'admin'

  before_filter :confirm_logged_in

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(params[:admin_user])
    if @admin_user.save
       flash[:notice] = "Admin user created"
       redirect_to(:action => 'index')
    else
      render('new')
    end
  end


  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(params[:admin_user])
      flash[:notice] = "Admin user #{@admin_user.username} updated."
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end


  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    AdminUser.find(params[:id]).destroy
    flash[:notice] = "The user #{@admin_user.username} is deleted."
    redirect_to(:action => 'index')
  end


  # Below method is used for Rails 4

  # private
  # def admin_user_params
  #   params.require(@admin_user).permit(:first_name, :last_name, :username, :email, :password)
  # end

end
