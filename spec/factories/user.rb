# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    nickname  { 'JonDo2' }
    sequence(:email) { |n| "test_email#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    before(:create, &:skip_confirmation!)
  end
end
