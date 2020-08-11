class DoctorprofilesController < ApplicationController
  before_action :set_doctorprofile, only: [:show, :edit, :update, :destroy]
#only admin can edit or delete doctor
  #before_filter :authenticate_user! before_filter :ensure_admin, :only
#=> [:edit, :destroy]
#Got error for above(syntax error unexpected '\n') so using below
#before_action :ensure_current_user

def ensure_admin
unless current_user && current_user.admin?
render :text => "Access Error Message", :status => :unauthorized
 end
end

def signedinuserprofile doctorprofile =
Doctorprofile.find_by_user_id(current_user.id) 

if doctorprofile.nil?
redirect_to "/doctorprofiles/new"
else
#@doctorprofile = Doctorprofile.find_by_user_id(current_user.id) redirect_to
#"/doctorprofiles/#{@doctorprofile.id}" 
redirect_to root_path
end
end



  # GET /doctorprofiles
  # GET /doctorprofiles.json
  def index
    @doctorprofiles = Doctorprofile.all
if params[:search]
    @doctorprofiles = Doctorprofile.search(params[:search]).order("created_at DESC")
  else
    @doctorprofiles = Doctorprofile.all.order("created_at DESC")
  end
  end

  # GET /doctorprofiles/1
  # GET /doctorprofiles/1.json
  def show
  end

  # GET /doctorprofiles/new
  def new
      @doctorprofile = Doctorprofile.new
      puts current_user.id

      respond_to do |format|
          format.html #new.html.erb
          format.json {
              render json: @doctorprofile
           }
       end
   end

  # GET /doctorprofiles/1/edit
  def edit
  end

  # POST /doctorprofiles
  # POST /doctorprofiles.json
  def create
    @doctorprofile = Doctorprofile.new(doctorprofile_params)

    respond_to do |format|
      if @doctorprofile.save
        format.html { redirect_to @doctorprofile, notice: 'Doctorprofile was successfully created.' }
        format.json { render :show, status: :created, location: @doctorprofile }
      else
        format.html { render :new }
        format.json { render json: @doctorprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctorprofiles/1
  # PATCH/PUT /doctorprofiles/1.json
  def update
    respond_to do |format|
      if @doctorprofile.update(doctorprofile_params)
        format.html { redirect_to @doctorprofile, notice: 'Doctorprofile was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctorprofile }
      else
        format.html { render :edit }
        format.json { render json: @doctorprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctorprofiles/1
  # DELETE /doctorprofiles/1.json
  def destroy
    @doctorprofile.destroy
    respond_to do |format|
      format.html { redirect_to doctorprofiles_url, notice: 'Doctorprofile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctorprofile
      @doctorprofile = Doctorprofile.find(params[:id])
    end

    
    def doctorprofile_params
      params.require(:doctorprofile).permit(:name, :contactNumber, :address, :user_id)
    end
end
