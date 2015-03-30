class RequestsController < ApplicationController

  before_action :find_request, only: [:show, :edit, :update, :destroy]

  # METHODS ARE SORTED ALPHABETICALLY

  search_term = nil

  def create

    @request = Request.new(request_params)
    
    if @request.save
      flash[:notice] = "Question Created Successfully!"
      redirect_to request_path(@request)
    else
      render :new
    end

  end

  def destroy
    @request.destroy
    redirect_to root_path, notice: "Question deleted successfully!"
  end

  def edit
  end

  def index
    # @search = Search.new

    @request = Request.all.order("done ASC")

    # @search_term ||= nil

    # if @search_term != nil
    #   @request = Request.where("name ILIKE ? OR email ILIKE ? OR message ILIKE ?",
    #                     "%#{@search_term}%", "%#{@search_term}%", "%#{@search_term}%")
    # end
  end

  def new
    @request = Request.new
  end

  # def search
  #   lookup = params[:lookup]
  #   @models = Model.find_by_lookup(lookup)
  #   redirect_to root_path
  # end

  def show
  end

  def update
    if @request.update(request_params)
      redirect_to @request, notice: "Question updated successfully!"
    else
      flash[:alert] = "Please correct errors below"
      render :edit
    end

  end

  private

  def find_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:name, :email, :department, :message, :done)
  end

  
end
