class StepsController < ApplicationController

before_filter :find_list
before_filter :find_step, :only => [:show, :edit, :update, :destroy]

def new
  @step = @list.steps.build
end

def create
  @step = @list.steps.build(params[:step])

  if @step.save
    flash[:notice] = "Step has been created."
    redirect_to @list
  else
    flash[:alert] = "Step has not been created."
    render :action => "new"
  end
end

def show
end

def edit
end

def update
  if @step.update_attributes(params[:step])
    flash[:notice] = "Step has been updated."
    redirect_to @list
  else
    flash[:alert] = "Step has not been updated."
    render :action => "edit"
  end
end


private
  def find_list
      @list = List.find(params[:list_id])
  end

  def find_step
    @step = @list.steps.find(params[:id])
  end

end
