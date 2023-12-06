# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

binding.pry
User.create(
  email: 'techniquea2z@gmail.com',
  role: 'admin',
  password: Rails.application.credentials.admin_password,
  password_confirmation: Rails.application.credentials.admin_password)