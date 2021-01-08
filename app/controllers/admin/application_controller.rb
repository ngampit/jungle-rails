class Admin::ApplicationController < ApplicationController
  
  http_basic_authenticate_with name: ENV['name'], password: ENV['password']

end