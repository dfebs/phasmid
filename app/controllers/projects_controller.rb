class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show ]
  before_action :verify_user, only: %i[ edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    @membership = Membership.new(project: @project, member: Current.user, role: "owner")

    begin
      ActiveRecord::Base.transaction do
        @project.save!
        @membership.save!
      end

      respond_to do |format|
        format.html { redirect_to @project, notice: "Project was successfully created." }
      end

    rescue ActiveRecord::RecordInvalid
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy!

    respond_to do |format|
      format.html { redirect_to projects_path, status: :see_other, notice: "Project was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.expect(project: [ :title, :description ])
    end

    def verify_user
      set_project
      redirect_to root_path, alert: "NO, BAD." and return if Current.user != @project.owner && !Current.user.admin
    end
end
