class PodsController < ApplicationController
  before_action :set_pod, only: %i[ show edit update destroy ]
  before_action :set_brand_options, only: [:new, :create, :edit, :update]

  # GET /pods or /pods.json
  def index
    @pods = Pod.all
  end

  # GET /pods/1 or /pods/1.json
  def show
  end

  # GET /pods/new
  def new
    @pod = Pod.new
  end

  # GET /pods/1/edit
  def edit
  end

  # POST /pods or /pods.json
  def create
    @pod = Pod.new(pod_params)

    respond_to do |format|
      if @pod.save
        format.html { redirect_to pod_url(@pod), notice: "Pod was successfully created." }
        format.json { render :show, status: :created, location: @pod }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pods/1 or /pods/1.json
  def update
    respond_to do |format|
      if @pod.update(pod_params)
        format.html { redirect_to pod_url(@pod), notice: "Pod was successfully updated." }
        format.json { render :show, status: :ok, location: @pod }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pods/1 or /pods/1.json
  def destroy
    @pod.destroy

    respond_to do |format|
      format.html { redirect_to pods_url, notice: "Pod was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
   
    def set_brand_options
      @brand_options = Brand.all.pluck(:description, :id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_pod
      @pod = Pod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pod_params
      params.require(:pod).permit(:flavor, :brand_id, :description, :url_image)
    end
end
