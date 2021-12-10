class SnippetsController < ApplicationController
  before_action :authenticate_user, only: %i[new create]

  def new; end

  def create
    Snippet.create!(
      title: params[:title],
      content: params[:title],
      expires: params[:expires],
      created: Time.zone.now
    )
  end

  def index
    @snippets = Snippet.latest
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  private

  def authenticate_user
    render json: { error: 'You must sign in' }, status: 404 and return unless current_user
  end
end
