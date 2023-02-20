class StudentsController < ApplicationController
	def show
		# byebug
		@student=Student.find(params[:id])
	end

	def index
		@students=Student.all
	end
end