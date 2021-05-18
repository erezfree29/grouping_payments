class GroupsController < ApplicationController
  def new
    if user_signed_in?
      @group = Group.new
    else
      redirect_to root_path, flash: { not_logged_in: 'please log in first' }
    end
  end

  def create
    @group = current_user.created_groups.build(group_params)
    if @group.save
      redirect_to group_path(@group), flash: { well_done: 'group created!' }
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name,:author_id, :icon)
  end

end
