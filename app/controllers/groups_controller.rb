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
      redirect_to user_group_path(current_user, @group), flash: { well_done: 'group created!' }
    else
      redirect_to new_user_group_path(current_user), flash: { please_review: "#{@group.errors.full_messages[0]} ,
      #{@group.errors.full_messages[1]}" }
    end
  end

  def show
      if params[:id].include?('{')
        group_id = params[:id][1..params[:id].length - 2]
      else
        group_id = params[:id]
      end
      if user_signed_in? && current_user.id == Group.find(group_id).author_id
        @group = Group.find(group_id)
        @entities = @group.entities.paginate(page: params[:page], per_page: 3)
      else
        redirect_to root_path
      end
  end

  def index
    @groups = current_user.created_groups.paginate(page: params[:page], per_page: 3)
  end

  private

  def group_params
    params.require(:group).permit(:name, :author_id, :icon)
  end
end


