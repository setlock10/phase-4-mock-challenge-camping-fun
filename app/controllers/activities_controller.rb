class ActivitiesController < ApplicationController
    before_action :find_activity, only: [:show, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json:Activity.all, status: :ok
    end

    # def show
    #     render json: @activity, status: :ok
    # end

    # def update
    #     render json: @activity.update!(activity_params), status: :accepted
    # end

    def destroy
        @activity.destroy
        head :no_content
    end

    # def create
    #     render json: Activity.create!(activity_params), status: :created
    # end




    private
    def render_not_found_response(invalid)
        render json: {error: "Activity not found"}, status: :not_found
    end
    def find_activity
        @activity=Activity.find(params[:id])
    end

    def activity_params
        params.permit(:name, :difficulty)
    end

end
