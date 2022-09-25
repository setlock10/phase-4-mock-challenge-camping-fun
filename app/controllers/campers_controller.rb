class CampersController < ApplicationController
    before_action :find_camper, only: [:show, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json:Camper.all, status: :ok
    end

    def show
        render json: @camper, serializer: CamperActivitiesSerializer, status: :ok
    end

 
    def create
        render json: Camper.create!(camper_params), status: :created
    end
    



    private
    def render_not_found_response(invalid)
        render json: {error: "Camper not found"}, status: :not_found
    end


    def find_camper
        @camper=Camper.find(params[:id])
    end

    def camper_params
        params.permit(:name, :age)
    end

end
