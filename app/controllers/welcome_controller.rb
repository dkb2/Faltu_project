class WelcomeController < ApplicationController

def index
	@sports = Sport.first(2)
end

end
