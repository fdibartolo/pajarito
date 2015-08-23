class MainController < ApplicationController
  def index
  end

  def photos
    photos = [
      { image_tag: view_context.image_tag('portfolio/01.jpg', class: "img-responsive"), categories: 'interior'},
      { image_tag: view_context.image_tag('portfolio/02.jpg', class: "img-responsive"), categories: 'exterior gaviotas'},
      { image_tag: view_context.image_tag('portfolio/03.jpg', class: "img-responsive"), categories: 'gaviotas'},
      { image_tag: view_context.image_tag('portfolio/04.jpg', class: "img-responsive"), categories: 'interior'},
      { image_tag: view_context.image_tag('portfolio/05.jpg', class: "img-responsive"), categories: 'interior'},
      { image_tag: view_context.image_tag('portfolio/06.jpg', class: "img-responsive"), categories: 'gaviotas'},
      { image_tag: view_context.image_tag('portfolio/07.jpg', class: "img-responsive"), categories: 'exterior'},
      { image_tag: view_context.image_tag('portfolio/08.jpg', class: "img-responsive"), categories: 'interior'}
    ]
    render json: { photos: photos }
  end

  def testimonials
    @testimonials = Testimonial.all
    @language = params[:language]
  end
end
