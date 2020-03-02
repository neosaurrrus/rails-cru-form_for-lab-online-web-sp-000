class SongsController < ApplicationController
    def index
        @songs = Song.all
    end
    def  new
        @song = Song.new
    end

    def  show
        @song = Song.find(params[:id])
        @artist = @song.artist
        @genre = @song.genre
    end

    def  edit
        @song = Song.find(params[:id])
    end

    def  create
        @song = Song.new(song_params(:name, :artist_id, :genre_id))
        @song.save
        redirect_to @song
    end

    def update
        @song = Song.find(params[:id])
        @song.update(song_params(:name, :artist_id, :genre_id))
        redirect_to @song
    end

    private

    def song_params(*args)
        params.require(:song).permit(*args)
    end
end
