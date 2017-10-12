class AdminController < ApplicationController
  http_basic_authenticate_with name: Rails.configuration.admin[:user], password: Rails.configuration.admin[:pass]
end
