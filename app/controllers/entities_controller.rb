class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entity, only: %i[ show edit update destroy ]

  # GET /entities or /entities.json
  def index
    @entities = Entity.all
  end

  # GET /entities/1 or /entities/1.json
  def show;
  end

  # GET /entities/new
  def new
    @entity = Entity.new
  end

  # POST /entities or /entities.json
  def create
    @entity = Entity.new(entity_params)
    @entity.user_id = current_user.id
    @entity.category_id = Category.find(params[:category_id]).id

    respond_to do |format|
     if @entity.save
        format.html do
          redirect_to user_category_path(current_user, params[:category_id]), notice: 'Entity was successfully created.'
        end
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to user_category_entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:user_id, :name, :amount)
  end
end
