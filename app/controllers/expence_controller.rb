class ExpenceController < ApplicationController
	def expense
	end

	def expense_list
		@expense=Expense.all
	end

	def search

		@expense=Expense.where(date: params[:Start_date]..params[:End_date])
		if @expense != nil
			
			render :expense_list, :object => @expense
			
		end
	end

	def add_expense
	end

	def create
		@expense = Expense.new(params_permit)
		if @expense.save
			redirect_to expense_path
		else
			render :add_expense
		end

	end

	private
	def params_permit
		params.permit(:title, :description, :date, :amount)
	end
end
