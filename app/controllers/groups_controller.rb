# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/ModuleLength, Metrics/MethodLength
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
      if user_signed_in? && current_user.id == Group.find(params[:id][1..params[:id].length - 2]).author_id
        @group = Group.find(params[:id][1..params[:id].length - 2])
        @entities = @group.entities.paginate(page: params[:page], per_page: 3)
      else
        redirect_to root_path
      end
    elsif user_signed_in? && current_user.id == Group.find(params[:id]).author_id
      @group = Group.find(params[:id])
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
# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity,  Metrics/ModuleLength, Metrics/MethodLength