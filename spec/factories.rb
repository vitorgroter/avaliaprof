Factory.define :user do |user|
  user.name                  "Nome"
  user.email                 "example@example.com"
  user.password              "123456"
  user.password_confirmation "123456"
end

Factory.sequence :email do |n|
  "example#{n}@example.com"
end

Factory.define :subject do |subject|
  subject.description "Calculo eh muito importante"
  subject.name "Calculo 1"
  subject.code "MAT2453"
end

Factory.define :professor do |professor|
  professor.name "Pait"
end

Factory.define :subcomment do |subcomment|
  subcomment.comment "materia importante"
  subcomment.association :user
  subcomment.association :subject
end

Factory.define :procomment do |procomment|
  procomment.comment "professor bom"
  procomment.association :user
  procomment.association :professor
end

