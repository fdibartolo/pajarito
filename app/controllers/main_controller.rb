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
    
    # photos = [
    #   { image_tag: view_context.image_tag('portfolio/01.jpg', class: "img-responsive"), categories: 'interior'},
    #   { image_tag: view_context.image_tag('portfolio/02.jpg', class: "img-responsive"), categories: 'exterior gaviotas'},
    #   { image_tag: view_context.image_tag('portfolio/03.jpg', class: "img-responsive"), categories: 'gaviotas'},
    #   { image_tag: view_context.image_tag('portfolio/04.jpg', class: "img-responsive"), categories: 'interior'},
    #   { image_tag: view_context.image_tag('portfolio/05.jpg', class: "img-responsive"), categories: 'interior'},
    #   { image_tag: view_context.image_tag('portfolio/06.jpg', class: "img-responsive"), categories: 'gaviotas'},
    #   { image_tag: view_context.image_tag('portfolio/07.jpg', class: "img-responsive"), categories: 'exterior'},
    #   { image_tag: view_context.image_tag('portfolio/08.jpg', class: "img-responsive"), categories: 'interior'}
    # ]
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
