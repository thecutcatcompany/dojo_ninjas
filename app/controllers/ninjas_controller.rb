class NinjasController < ApplicationController
  before_action :set_ninja, only: [:show, :edit, :update, :destroy]

  # GET /ninjas
  # GET /ninjas.json
  def index
    @ninjas = Ninja.all
  end

  # GET /ninjas/1
  # GET /ninjas/1.json
  def show
  end

  # GET /ninjas/new
  def new
    @ninja = Ninja.new
  end

  # GET /ninjas/1/edit
  def edit
  end

  # POST /ninjas
  # POST /ninjas.json
  def create
    @ninja = Ninja.new(ninja_params)

    respond_to do |format|
      if @ninja.save
        format.html { redirect_to @ninja, notice: 'Ninja was successfully created.' }
        format.json { render :show, status: :created, location: @ninja }
      else
        format.html { render :new }
        format.json { render json: @ninja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ninjas/1
  # PATCH/PUT /ninjas/1.json
  def update
    respond_to do |format|
      if @ninja.update(ninja_params)
        format.html { redirect_to @ninja, notice: 'Ninja was successfully updated.' }
        format.json { render :show, status: :ok, location: @ninja }
      else
        format.html { render :edit }
        format.json { render json: @ninja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ninjas/1
  # DELETE /ninjas/1.json
  def destroy
    @ninja.destroy
    respond_to do |format|
      format.html { redirect_to ninjas_url, notice: 'Ninja was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ninja
      @ninja = Ninja.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ninja_params
      params.require(:ninja).permit(:dojo_id, :first_name, :last_name)
    end
end
