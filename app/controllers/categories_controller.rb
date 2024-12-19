class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  #This class contains the CRUD operations 

  #READ CRUD OPERATIONS
  #R
  def index
    @categories = Category.all
  end
  #R
  def show
  end

  #CREATE CRUD OPERATIONS
  #C
  def new
    @category = Category.new
  end

  #C
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: "Category was successfully created."
    else
      render :new
    end
  end
  
  #UPDATE CRUD OPERATIONS
  #U
  def edit
  end

  #U
  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category was successfully updated."
    else
      render :edit
    end
  end

  #DELETE CRUD OPERATIONS
  #D
  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Category was successfully deleted."
  end

  #OTHER
  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
