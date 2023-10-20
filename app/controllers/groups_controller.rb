class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @groups = Group.all # or any logic to load other groups if needed
  end

  def new
    @group = Group.new
    @groups = Group.all # Load groups to display in the new view.
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    if @group.save
      redirect_to group_path(@group), notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def edit
    # Render the edit form for the group.
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group), notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, notice: 'Group was successfully deleted.'
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
