# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Testimonial.create!(
  author: 'Juan Perez',
  description: {
    es: 'En español This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
    en: 'In English This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
  }
)

Testimonial.create!(
  author: 'Familia Gomez',
  description: {
    es: 'En español This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
    en: 'In English This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
  }
)

Testimonial.create!(
  author: 'Familia Gonzalez',
  description: {
    es: 'En español This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
    en: 'In English This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
  }
)

[
  { path: 'portfolio/01.jpg', categories: 'interior', visible: true },
  { path: 'portfolio/02.jpg', categories: 'exterior gaviotas', visible: true },
  { path: 'portfolio/03.jpg', categories: 'gaviotas', visible: true },
  { path: 'portfolio/04.jpg', categories: 'interior', visible: true },
  { path: 'portfolio/05.jpg', categories: 'interior', visible: true },
  { path: 'portfolio/06.jpg', categories: 'gaviotas', visible: true },
  { path: 'portfolio/07.jpg', categories: 'exterior', visible: true },
  { path: 'portfolio/08.jpg', categories: 'interior', visible: true}
].each do |image|
  Image.create!(path: image[:path], categories: image[:categories], visible: image[:visible])
end
