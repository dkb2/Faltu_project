class WelcomeController < ApplicationController

def index
	@blogs = Blogg.first(2)
end

end
