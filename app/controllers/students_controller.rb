class StudentsController < ApplicationController
	def show
		@student=Student.find(params[:id])
	end

	def index
		@students=Student.all
	end

	def new
		@student=Student.new
	end

	def edit
		@student=Student.find(params[:id])
	end

	def create
		# render plain: params[:student]
		@student=Student.new(params.require(:student).permit(:first_name, :last_name))
		if @student.save
			flash[:notice]="Student was successfully created."
			redirect_to student_path(@student)
		else
			render 'new'
		end
	end

	def update
		@student=Student.find(params[:id])
		if @student.update(params.require(:student).permit(:first_name, :last_name))
			flash[:notice]="Student was successfully updated."
			redirect_to @student
		else
			render 'edit'
		end
	end

	def destroy
		@student=Student.find(params[:id])
		@student.destroy
		redirect_to students_path
	end
end