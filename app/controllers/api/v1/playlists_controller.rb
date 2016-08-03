class Api::V1::PlaylistsController < ApiBaseController

  def index
    user = User.find(params[:user_id])
    render json: Playlist.all(user)
  end

  def update
    user = User.find(params[:user_id])
    render json: Playlist.update(user, params[:playlist_id], params[:track_uri])
  end

  def create
    user = current_user
    render json: Playlist.create(user, params[:playlist_name])
  end
end
