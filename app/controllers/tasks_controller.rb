class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
    if params[:sort_expired]
      @tasks = @tasks.order(deadline: :desc)
    else
      @tasks = @tasks.order(created_at: :desc)
    end

    if params[:task].present?
      @tasks = @tasks.where('title LIKE ?', "%#{params[:task][:title]}%")
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if params[:back]
      render :new
    else
      if @task.save
        redirect_to tasks_path, notice: "タスクを作成しました"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクを編集しました!"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"タスクを削除しました！"
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
