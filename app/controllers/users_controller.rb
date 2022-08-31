require 'net/http'
require 'json'

class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy projects_users ]

  # GET /users or /users.json
  def index
    if params[:company_id].present?
      @users = User.where(company_id: params[:company_id])
    end
    @users ||= User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def projects_users
    #respond_to do |format|
      #format.json { render json: @user.as_json(include: :projects) }
    #end
    uri = URI("https://api.onlinewebtutorblog.com/projects")
    params = { :employeeId => @user.id}
    uri.query = URI.encode_www_form(params)
    @response = JSON.parse(Net::HTTP.get(uri))
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone_number, :company_id, :user_type)
    end
end
