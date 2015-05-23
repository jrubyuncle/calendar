class CalendersController < ApplicationController
  before_action :set_calender, only: [:edit, :update, :destroy, :events, :update_events]
  before_action :authenticate_user!, only: [:new]

  # GET /calenders
  # GET /calenders.json
  def index
    @calenders = Calender.visiable.where('name like ?', "%#{params[:q]}%").all
  end

  # GET /calenders/1
  # GET /calenders/1.json
  def show
    @calender = Calender.find(params[:id])
  end

  # GET /calenders/new
  def new
    @calender = current_user.calenders.new
  end

  # GET /calenders/1/edit
  def edit
  end

  # POST /calenders
  # POST /calenders.json
  def create
    @calender = current_user.calenders.new(calender_params)

    respond_to do |format|
      if @calender.save
        format.html { redirect_to user_path(current_user), notice: 'Calender was successfully created.' }
        format.json { render :show, status: :created, location: @calender }
      else
        format.html { render :new }
        format.json { render json: @calender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calenders/1
  # PATCH/PUT /calenders/1.json
  def update
    respond_to do |format|
      if @calender.update(calender_params)
        format.html { redirect_to @calender, notice: 'Calender was successfully updated.' }
        format.json { render :show, status: :ok, location: @calender }
      else
        format.html { render :edit }
        format.json { render json: @calender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calenders/1
  # DELETE /calenders/1.json
  def destroy
    @calender.archive
    respond_to do |format|
      format.html { redirect_to calenders_url, notice: 'Calender was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /calendars/:calender_id/events
  def events
  end

  # PUT /calendars/:calender_id/events
  def update_events
    _params = params.require(:calender).permit(events_attributes: [:id, :title, :start, :end, :all_day, :_destroy])
    if @calender.update(_params)
      redirect_to @calender, notice: '更新成功！'
    else
      render :events
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calender
      @calender = current_user.calenders.find(params[:id] || params[:calender_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calender_params
      params.require(:calender).permit(:user_id, :name, :public)
    end
end
