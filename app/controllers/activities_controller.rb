class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to new_activity_path
    else
      render :new
    end
  end

  def show
    activity = Activity.find(params[:id])
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :address, :price, :type_activity, :description, :max_participants, :start_date, :end_date)
  end
end
