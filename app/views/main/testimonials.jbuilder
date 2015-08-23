json.testimonials @testimonials do |testimonial|
  json.author testimonial.author
  json.description testimonial.description[@language]
end
