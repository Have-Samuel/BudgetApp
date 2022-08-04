# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    @categories = Category.all
  end
  
  def show
    @categories = Category.find(params[:id])
    @entities = Entity.where(category_id: @category.id)
  end
  
  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    @category.user_id = current_user.id

    respond_to do|format|
      if @category.save
        format.html { redirect_to user_category_url(current_user, @category), notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Entity.where(category_id: @category.id).destroy_all
    @category.destroy

    respond_to do |format|
      format.html { redirect_to user_categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @Category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :image)
  end
end
