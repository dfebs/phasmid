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
    filtered_params = bug_params

    if @bug.update(filtered_params)
      @bug.bug_tags.where.not(tag_id: filtered_params[:tag_ids]).destroy_all
      respond_to do |format|
        format.turbo_stream
      end
    else
      format.html { render "projects/show", status: :unprocessable_entity }
    end
  end

  def create
    @project = Project.find(params[:project_id])
    @bug = Bug.new
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
    final_params = params.expect bug: [ :title, :description, :completed, tag_ids: [] ]
    if final_params.has_value?(:tag_ids)
      final_params[:tag_ids] = final_params[:tag_ids].reject { |tag_id| tag_id.blank? || @bug.bug_tags.exists?(tag_id) } if @bug.tags.any?
    end
    final_params
  end
end
