class DemoController < ApplicationController
	
	def hello
		# render('hello')
		@id = params['id']
		@page = params[:page]
	end

	def index
		# render('index')
	end	

	def other_index
		redirect_to(:controller => 'demo', :action => 'index')
	end	

end
