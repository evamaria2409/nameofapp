class ObjectNamesController < ApplicationController
  before_action :set_object_name, only: [:show, :edit, :update, :destroy]

  # GET /object_names
  # GET /object_names.json
  def index
    @object_names = ObjectName.all
  end

  # GET /object_names/1
  # GET /object_names/1.json
  def show
  end

  # GET /object_names/new
  def new
    @object_name = ObjectName.new
  end

  # GET /object_names/1/edit
  def edit
  end

  # POST /object_names
  # POST /object_names.json
  def create
    @object_name = ObjectName.new(object_name_params)

    respond_to do |format|
      if @object_name.save
        format.html { redirect_to @object_name, notice: 'Object name was successfully created.' }
        format.json { render :show, status: :created, location: @object_name }
      else
        format.html { render :new }
        format.json { render json: @object_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /object_names/1
  # PATCH/PUT /object_names/1.json
  def update
    respond_to do |format|
      if @object_name.update(object_name_params)
        format.html { redirect_to @object_name, notice: 'Object name was successfully updated.' }
        format.json { render :show, status: :ok, location: @object_name }
      else
        format.html { render :edit }
        format.json { render json: @object_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /object_names/1
  # DELETE /object_names/1.json
  def destroy
    @object_name.destroy
    respond_to do |format|
      format.html { redirect_to object_names_url, notice: 'Object name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_object_name
      @object_name = ObjectName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def object_name_params
      params.fetch(:object_name, {})
    end
end
