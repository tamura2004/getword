class NamesController < ApplicationController
  before_action :set_name, only: [:show, :edit, :update, :destroy]

  # GET /names
  # GET /names.json
  def index
    @names = Name.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = NamePdf.new(@names)
        send_data pdf.render,
          # filename: "#{@name.id}.pdf",
          type: "application/pdf",
          disposition: "inline"
      end
    end
  end

  # GET /names/1
  # GET /names/1.json
  def show
    @names = [@name]
    respond_to do |format|
      format.html
      format.pdf do
        pdf = NamePdf.new(@names)
        send_data pdf.render,
          # filename: "#{@name.id}.pdf",
          type: "application/pdf",
          disposition: "inline"
      end
    end
  end

  def sheet
    respond_to do |format|
      format.html
      format.pdf do
        pdf = SheetPdf.new
        send_data pdf.render,
          type: "application/pdf",
          disposition: "inline"
      end
    end
  end

  # GET /names/new
  def new
    @name = Name.new
  end

  # GET /names/1/edit
  def edit
  end

  # POST /names
  # POST /names.json
  def create
    @name = Name.new(name_params)

    respond_to do |format|
      if @name.save
        format.html { redirect_to @name, notice: 'Name was successfully created.' }
        format.json { render :show, status: :created, location: @name }
      else
        format.html { render :new }
        format.json { render json: @name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /names/1
  # PATCH/PUT /names/1.json
  def update
    respond_to do |format|
      if @name.update(name_params)
        format.html { redirect_to @name, notice: 'Name was successfully updated.' }
        format.json { render :show, status: :ok, location: @name }
      else
        format.html { render :edit }
        format.json { render json: @name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /names/1
  # DELETE /names/1.json
  def destroy
    @name.destroy
    respond_to do |format|
      format.html { redirect_to names_url, notice: 'Name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_name
      @name = Name.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def name_params
      params.require(:name).permit(:w1, :w2, :w3, :w4, :w5, :w6, :w7, :w8)
    end
end
