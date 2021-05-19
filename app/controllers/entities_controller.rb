class EntitiesController < ApplicationController
  def new
    if user_signed_in?
      @entity = Entity.new()
      session[:group_id] = params[:group_id] 
    else
      redirect_to root_path, flash: { not_logged_in: 'please log in first' }
    end
  end

  def create
    @entity = current_user.created_entities.build(entity_params)
    if @entity.save
        @entity.update(group_id:session[:group_id])
        redirect_to user_group_path(current_user,params[:group_id]), flash: { well_done: 'entity created!' }
    else
      raise
      render :new
    end
  end

  def show
    @entity = Entity.find(params[:id])
  end

  def external_new
    if user_signed_in?
      @entity = Entity.new() 
    else
      redirect_to root_path, flash: { not_logged_in: 'please log in first' }
    end
  end

  def external_create
    @entity = current_user.created_entities.build(external_entity_params)
    if @entity.save
        redirect_to root_path,  flash: { well_done: 'external entity created!' }
    else
        # redirect in case the page was renderd
       render :external_new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name,:amount, :group_id)
  end

  def external_entity_params
    params.require(:entity).permit(:name,:amount)
  end
end
