class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entity, only: %i[ show edit update destroy ]

  # GET /entities or /entities.json
  def index
    @category = Category.find(params[:category_id])
    @entities = Entity.where(category_id: params[:category_id], user: current_user).order('created_at desc')
  end

  # GET /entities/1 or /entities/1.json
  def show
    @transaction = entity.find.(params[:entity_id])
    @category = Category.find(params[:category_id])
  end

  # GET /entities/new
  def new
    @category = Category.find(params[:category_id])
    @entity = Entity.new
  end

  # POST /entities or /entities.json
  def create
    transaction = Entity.new(entity_params)
    transaction.category_id = params[:category_id]
    transaction.user = current_user
    if transaction.valid?
      transaction.save
      redirect_to entity_index_path(category_id: params[:category_id]), notice: 'Transaction added'
    else
      redirect_to entities_new_path(category_id: params[:category_id]),
                  alert: transaction.errors.first.message, status: 400
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def entity_params
      params.require(:entity).permit(:name, :amount)
    end
end
