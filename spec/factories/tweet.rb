# frozen_string_literal: true

FactoryBot.define do
  factory :tweet do
    content { 'Hola mundo' }
    author { association :user }
  end
end
