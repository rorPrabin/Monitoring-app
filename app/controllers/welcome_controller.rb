class WelcomeController < ApplicationController
  def index
  end

 def page_not_found
 	render layout: "public_layout"
 end
end
