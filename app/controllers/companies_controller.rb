class CompaniesController < ApplicationController
  before_filter :authenticate_user!, :except => [:sign_up, :create]
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_filter :check_admin, only: [:new, :index, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :sign_up]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all.page params[:page]
  end

  def show
    @company = Company.find(params[:id])
    @c_users = Kaminari.paginate_array(@company.users.to_a).page(params[:page]).per(5)
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(params[:company].permit!)
    @company.creator_name = params[:company][:users_attributes]['0'][:first_name]
    @company.email_format = nil if params[:company][:allow_email_regex] == false
    respond_to do |format|
      if @company.save
        @company.track_company_activity(" created a new company ")
        format.html { redirect_to root_url, notice: 'Company was successfully created. Confirmation Email has sent to you email. Please confirm email to continue' }
        format.json { render action: 'show', status: :created, location: @company }
      else
        format.html { render action: 'sign_up', notice: "Please check the required field"}
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    @company = Company.find(params[:id])
    respond_to do |format|
      if @company.update(company_params)
        @company.email_format = nil if @company.allow_email_regex == false
        @company.save
        @company.track_company_activity(" updated the company ")
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    @company.track_company_activity(" destroyed the company ")
    respond_to do |format|
      format.html { redirect_to companies_url, notice: "Company is destroy"}
      format.json { head :no_content }
    end
  end

  def my_company
    @company = current_user.company
    @c_users  = Kaminari.paginate_array(@company.users.to_a).page(params[:page]).per(5)
    render 'show'
  end

  def sign_up
    @company = Company.new
    @company.users.build()
  end

  def edit_my_company
    @company = current_user.company
    render 'edit'
  end

  private

  def set_company
    begin
      @company = Company.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      respond_to do |format|
        format.html { redirect_to companies_url, notice: "Company not found."}
        format.json { head :no_content }
      end
    end
  end

  def company_params
    params.require(:company).permit(:name, :address, :allow_email_regex, :url, :image, :email_format, :creator_name)
  end

end
