class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:location]
      @activities = policy_scope(Activity).where('address LIKE ?', "%#{params[:location]}%")
    else
     @activities = policy_scope(Activity).order(created_at: :desc)
    end
  end

  def new
    @activity = Activity.new
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.seller = current_user
    authorize @activity
    if @activity.save
      redirect_to activities_path
    else
      render :new
    end
  end

  def show
    authorize @activity
    @activity = Activity.find(params[:id])
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :address, :price, :type_activity, :description, :max_participants, :location)
  end
end
