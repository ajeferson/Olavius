class ImagesController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource :post
  load_and_authorize_resource :image, through: :post, shallow: true

  # POST /posts/:post_id/images
  def create
    @image.save
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end

end
