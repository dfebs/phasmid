class TagsController < ApplicationController
  def new
    @tag = Tag.new
    @project = Project.find(params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    @tag = @project.tags.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.turbo_stream
        format.html { redirect_to @project, notice: "Tag was successfully created." }
      else
        flash.now[:alert] = "Failed to create tag"
        format.html { render "projects/show", status: :unprocessable_entity }
      end
    end
  end

  private
  def tag_params
    params.expect(tag: [ :name, :weight ])
  end
end
