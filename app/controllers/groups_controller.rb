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
      redirect_to user_group_path(current_user,@group), flash: { well_done: 'group created!' }
    else
      redirect_to new_user_group_path(current_user), flash: {please_review:"#{@group.errors.full_messages[0]} ,
      #{@group.errors.full_messages[1]}"}
    end
  end

  def show
    if user_signed_in? && current_user.id == Group.find(params[:id]).author_id
      @group = Group.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def index
    @groups = current_user.created_groups
  end

  private

  def group_params
    params.require(:group).permit(:name,:author_id, :icon)
  end

end
