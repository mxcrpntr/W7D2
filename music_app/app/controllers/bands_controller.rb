class BandsController < ApplicationController
    before_action :set_band, only: [:show,:edit,:update,:destroy]

    def set_band
        @band = Band.find_by(id: params[:id])
    end
    def index
        @bands = Band.all
        render :index
    end
    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to band_url(@band.id)
        else
            flash[:errors] = @band.errors.full_messages
            render :new
        end
    end
    def new
        render :new
    end
    def edit
        render :edit
    end
    def show
        render :show
    end
    def update
        @band.update(band_params)
        if @band.save
            redirect_to band_url(@band.id)
        else
            flash.now[:errors] = @band.errors
            render :edit
        end
    end
    def destroy
        @band.delete
        redirect_to bands_url
    end

    private
    def band_params
        params.require(:band).permit(:name)
    end
end
