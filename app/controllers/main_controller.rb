class MainController < ApplicationController
  def index
  end

  def photos
    photos = []
    Image.active.each do |image|
      photos << {
        image_tag: view_context.image_tag(image.path, class: "img-responsive"), 
        categories: image.categories
      }
    end
    render json: { photos: photos }
  end

  def testimonials
    @testimonials = Testimonial.all
    @language = params[:language]
  end

  def contact_us
    name, email, body = contact_us_params[:name], contact_us_params[:email], contact_us_params[:body]
    ContactUsMailer.information_requested(name, email, body).deliver_now
    head :no_content
  end

  private
  def contact_us_params
    params.require(:question).permit(:name, :email, :body)
  end
end
