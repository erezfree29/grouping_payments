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
        @entity.update(group_id:session[:group_id],external:false)
        redirect_to user_group_path(current_user,params[:group_id]), flash: { well_done: 'entity created!' }
    else
      redirect_to new_user_group_entity_path(current_user,params[:group_id]), flash: 
      {please_review:"#{@entity.errors.full_messages[0]}
      #{@entity.errors.full_messages[1]} #{@entity.errors.full_messages[2]}"}
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
    @entity.update(external:true)
    if @entity.save
        redirect_to root_path,  flash: { well_done: 'external entity created!' }
    else
        # redirect in case the page was renderd
       render :external_new
    end
  end

  def index
    @entites = current_user.created_entities.paginate(page: params[:page],per_page: 5)
  end
  private

  def entity_params
    params.require(:entity).permit(:name,:amount, :group_id, :occured)
  end

  def external_entity_params
    params.require(:entity).permit(:name,:amount, :occured, :external_group_name)
  end

end
