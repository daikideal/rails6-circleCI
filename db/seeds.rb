# frozen_string_literal: true

# Users

10.times do |i|
  User.create!(email: "test#{i+1}@example.com", password: 'password', name: "test-user#{i+1}")
end
