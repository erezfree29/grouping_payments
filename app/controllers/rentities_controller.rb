class RentitiesController < ApplicationController
  before_action :authenticate_user!
  def new
    @recurring_entity = RecuringEntity.new
  end

  def create
    @recurring_entity = RecuringEntity.create(entity_id:params[:entity_id]).update(rentity_params)
    redirect_to  user_group_path(current_user.id, params[:group_id]), flash: 
    { well_done: 'reccurring transaction created' }
  end

  def destroy
    RecuringEntity.where(entity_id:params[:id]).delete_all
    redirect_to  user_group_path(current_user.id, params[:group_id])
  end

  private

  def rentity_params
    params.require(:recuring_entity).permit(:repeat)
  end
end


