class EntitiesController < ApplicationController
  def new
    if user_signed_in?
      @entity = Entity.new
    else
      redirect_to root_path, flash: { not_logged_in: 'please log in first' }
    end
  end

  def create
    @entity = current_user.created_groups.build(entity_params)
    if @entity.save
      redirect_to group_path(@entity), flash: { well_done: 'entity created!' }
    else
      render :new
    end
  end

  def show
    @entity = Entity.find(params[:id])
  end

  private

  def group_params
    params.require(:entity).permit(:name,:amount, :group_id)
  end
end
