module Admin
  class CalendersController < Admin::ApplicationController
    before_action :set_admin_calender, only: [:show, :edit, :update, :destroy]

    # GET /admin/calenders
    # GET /admin/calenders.json
    def index
      @admin_calenders = Admin::Calender.all
    end

    # GET /admin/calenders/1
    # GET /admin/calenders/1.json
    def show
    end

    # GET /admin/calenders/new
    def new
      @admin_calender = Admin::Calender.new
    end

    # GET /admin/calenders/1/edit
    def edit
    end

    # POST /admin/calenders
    # POST /admin/calenders.json
    def create
      @admin_calender = Admin::Calender.new(admin_calender_params)

      respond_to do |format|
        if @admin_calender.save
          format.html { redirect_to @admin_calender, notice: 'Calender was successfully created.' }
          format.json { render :show, status: :created, location: @admin_calender }
        else
          format.html { render :new }
          format.json { render json: @admin_calender.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/calenders/1
    # PATCH/PUT /admin/calenders/1.json
    def update
      respond_to do |format|
        if @admin_calender.update(admin_calender_params)
          format.html { redirect_to @admin_calender, notice: 'Calender was successfully updated.' }
          format.json { render :show, status: :ok, location: @admin_calender }
        else
          format.html { render :edit }
          format.json { render json: @admin_calender.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/calenders/1
    # DELETE /admin/calenders/1.json
    def destroy
      @admin_calender.destroy
      respond_to do |format|
        format.html { redirect_to admin_calenders_url, notice: 'Calender was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_admin_calender
        @admin_calender = Admin::Calender.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def admin_calender_params
        params.require(:admin_calender).permit(:user_id, :name, :public)
      end
  end
end
