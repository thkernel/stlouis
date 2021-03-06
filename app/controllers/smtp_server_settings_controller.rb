class SmtpServerSettingsController < ApplicationController
  before_action :set_smtp_server_setting, only: %i[ show edit update destroy ]

  # GET /smtp_server_settings or /smtp_server_settings.json
  def index
    @smtp_server_settings = SmtpServerSetting.all
  end

  # GET /smtp_server_settings/1 or /smtp_server_settings/1.json
  def show
  end

  # GET /smtp_server_settings/new
  def new
    @smtp_server_setting = SmtpServerSetting.new
  end

  # GET /smtp_server_settings/1/edit
  def edit
  end

  # POST /smtp_server_settings or /smtp_server_settings.json
  def create
    @smtp_server_setting = SmtpServerSetting.new(smtp_server_setting_params)

    respond_to do |format|
      if @smtp_server_setting.save
        format.html { redirect_to smtp_server_setting_url(@smtp_server_setting), notice: "Smtp server setting was successfully created." }
        format.json { render :show, status: :created, location: @smtp_server_setting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @smtp_server_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /smtp_server_settings/1 or /smtp_server_settings/1.json
  def update
    respond_to do |format|
      if @smtp_server_setting.update(smtp_server_setting_params)
        format.html { redirect_to smtp_server_setting_url(@smtp_server_setting), notice: "Smtp server setting was successfully updated." }
        format.json { render :show, status: :ok, location: @smtp_server_setting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @smtp_server_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smtp_server_settings/1 or /smtp_server_settings/1.json
  def destroy
    @smtp_server_setting.destroy

    respond_to do |format|
      format.html { redirect_to smtp_server_settings_url, notice: "Smtp server setting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smtp_server_setting
      @smtp_server_setting = SmtpServerSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def smtp_server_setting_params
      params.require(:smtp_server_setting).permit(:uid, :host_name, :user_name, :user_password, :domain, :port, :authentication, :enable_starttls_auto, :ssl, :account_id)
    end
end
