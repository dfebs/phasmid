class TagsController < ApplicationController
  before_action :set_project_and_tag, only: %i[ edit update ]
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
        render "projects/edit", status: :unprocessable_entity
      end
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      respond_to do |format|
        format.turbo_stream
      end
    else
      render "projects/show", status: :unprocessable_entity
    end
  end

  private
  def tag_params
    params.expect(tag: [ :name, :weight ])
  end

  def set_project_and_tag
    @tag = Tag.find(params[:id])
    @project = @tag.project
  end
end
