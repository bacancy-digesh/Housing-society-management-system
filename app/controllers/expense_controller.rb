# frozen_string_literal: true

class ExpenseController < ApplicationController
  def expense_list
    @expense = Expense.all
  end

  def search
    @expense = Expense.where(date: params[:Start_date]..params[:End_date])

    render :expense_list, object: @expense unless @expense.nil?
  end

  def add_expense
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(params_permit)
    if @expense.save
      redirect_to expense_list_expense_index_path
    else
      render :add_expense
    end
  end

  private

  def params_permit
    params.require(:expense).permit(:title, :description, :date, :amount)
  end
end
