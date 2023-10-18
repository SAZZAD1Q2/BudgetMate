class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show destroy]
  before_action :authenticate_user!

  def index
    @entities = Entity.all
  end

  def show
    # show
  end

  def new
    @groups = Group.all # Fetch the groups you want to display in the new entity form.
    @entity = Entity.new
    @entity.group_id = params[:group_id] # Set the group_id based on your requirements.
  end
  
  

  def create
    puts params
    puts '-------------------------------'

    @entity = Entity.new(entity_params)
    @entity.author_id = current_user.id
    if @entity.save
      redirect_to entities_path(@entity.group_id), notice: 'Add new transaction'
    else
      render :new
    end
  end

  def destroy
    @entity = Entity.find(params[:id])
    @entity.destroy
    redirect_to entities_path, notice: 'Transaction was successfully deleted.'
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :group_id, :amount)
  end
end
