class DemoController < ApplicationController
	
	layout 'application'

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

	def text_helpers
	end

	def escape_output

	end
end
