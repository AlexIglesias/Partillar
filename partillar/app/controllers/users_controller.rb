class UsersController < ApplicationController
  before_action :authenticate_user!


  def index

  end

  def show
    @contents = current_user.contents
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user }
        flash[:success] = 'Ya estás registrado!!'
      else
        format.html { render :new }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user}
        flash[:success] = 'Perfil actualizado'
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      flash[:success] = 'Usuario eliminado correctmente'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
