class AlbumsController < ApplicationController
    before_action :set_album, only: [:show,:edit,:update,:destroy]

    def set_album
        @album = Album.find_by(id: params[:id])
    end
    def create
        @band = Band.find_by(id: params[:band_id])
        @album = Album.new(album_params)
        if @album.save
            redirect_to album_url(@album.id)
        else
            flash[:errors] = @album.errors.full_messages
            render :new
        end
    end
    def new
        @band = Band.find_by(id: params[:band_id])
        render :new
    end
    def edit
        render :edit
    end
    def show
        render :show
    end
    def update
        @album.update(album_params)
        if @album.save
            redirect_to album_url(@album.id)
        else
            flash.now[:errors] = @album.errors
            render :edit
        end
    end
    def destroy
        @album.delete
        redirect_to albums_url
    end

    private
    def album_params
        album_params = params.require(:album).permit(:band_id,:title,:year)
        album_params[:live?] = false
        album_params
    end
end
