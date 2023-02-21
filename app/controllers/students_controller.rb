class StudentsController < ApplicationController

	before_action :set_student, only:[:show, :edit, :update, :destory]

	def show
		# This action of set_student is performed before show, edit, update, destroy actions
		# @student=Student.find(params[:id])
		render json: @student
	end

	def index
		@students=Student.all
		render json: @students
	end

	def new
		@student=Student.new
	end

	def edit
		# @student=Student.find(params[:id])
	end

	def create
		# render plain: params[:student]
		@student=Student.new(student_params)
		if @student.save
			flash[:notice]="Student was successfully created."
			redirect_to student_path(@student)
		else
			render 'new'
		end
	end

	def update
		# @student=Student.find(params[:id])
		if @student.update(student_params)
			flash[:notice]="Student was successfully updated."
			redirect_to @student
		else
			render 'edit'
		end
	end

	def destroy
		# @student=Student.find(params[:id])
		@student.destroy
		redirect_to students_path
	end

	private
	
	def set_student
		@student=Student.find(params[:id])
	end

	def student_params
		params.require(:student).permit(:first_name, :last_name)
	end
end