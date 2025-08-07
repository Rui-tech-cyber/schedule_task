class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to plans_path, notice: t('.create')
    else
      flash.now[:alert] = "予定の作成に失敗しました。"
      render :new
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to plans_path, notice: t('.destroy')
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to plan_path(@plan), notice: t('.update')
    else
      flash..now[:alert] = "更新に失敗しました。"
      render :edit
    end
  end
  
  private

  def plan_params
    params.require(:plan).permit(:title, :start_date, :end_date, :all_day, :memo)
  end

end
