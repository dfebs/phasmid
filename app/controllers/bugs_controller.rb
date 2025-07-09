class BugsController < ApplicationController
  def new
    @bug = Bug.new
    @project = Project.find(params[:project_id])
  end

  def edit
    @bug = Bug.find(params[:id])
    @project = @bug.project
  end

  def update
    @bug = Bug.find(params[:id])

    if @bug.update(bug_params)
      respond_to do |format|
        format.turbo_stream
      end
    else
      format.html { render "projects/show", status: :unprocessable_entity }
    end
  end

  def create
    @project = Project.find(params[:project_id])
    @bug = @project.bugs.new(bug_params)
    @bug.author = Current.user


    respond_to do |format|
      if @bug.save
        format.turbo_stream
        format.html { redirect_to @project, notice: "Bug was successfully created." }
      else
        flash.now[:alert] = "Failed to create bug"
        format.html { render "projects/show", status: :unprocessable_entity }
      end
    end
  end

  private
  def set_bug
    @bug = Bug.find(params.expect(:id))
  end

  def bug_params
    params.expect bug: [ :title, :description, tag_ids: [] ]
  end
end
