class MemosController < ApplicationController
  def new
    @plan = Plan.find(params[:plan_id])
    @memo = @plan.memos.build
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to @memo, notice: "メモが保存されました"
    else
      render :new
    end

  private

  def memo_params
    params.require(:memo).permit(:title, :content)
  end
end