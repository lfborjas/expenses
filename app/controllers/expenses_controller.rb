class ExpensesController < ApplicationController
  before_filter :authenticate_user!

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = current_user.expenses.all.order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expenses }
    end
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    @expense = current_user.expenses.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/new
  # GET /expenses/new.json
  def new
    @expense = current_user.expenses.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/1/edit
  def edit
    @expense = current_user.expenses.find(params[:id])
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = current_user.expenses.new(params[:expense])

    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'current_user.expenses was successfully created.' }
        format.json { render json: @expense, status: :created, location: @expense }
      else
        format.html { render action: "new" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expenses/1
  # PUT /expenses/1.json
  def update
    @expense = current_user.expenses.find(params[:id])

    respond_to do |format|
      if @expense.update_attributes(params[:expense])
        format.html { redirect_to @expense, notice: 'current_user.expenses was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense = current_user.expenses.find(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url }
      format.json { head :no_content }
    end
  end
end
