class SnippetsController < ApplicationController
  before_action :authenticate_user, only: %i[new create]

  def new; end

  def create
    Snippet.create!(
      title: params[:title],
      content: params[:title],
      expires: Time.zone.now + params[:expires].to_i.days,
      created: Time.zone.now
    )

    redirect_to root_path, notice: "Snippet successfully created!"
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def index
    @snippets = Snippet.latest
  end

  private

  def authenticate_user
    render json: { error: 'You must sign in' }, status: 404 and return unless current_user
  end
end
