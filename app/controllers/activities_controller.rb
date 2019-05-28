class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  def index
    if params[:location]
      @activities = Activity.where('address LIKE ?', "%#{params[:location]}%")
    else
      @activities = Activity.all
    end
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.seller = current_user
    if @activity.save
      redirect_to activities_path
    else
      render :new
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :address, :price, :type_activity, :description, :max_participants, :location)
  end
end
