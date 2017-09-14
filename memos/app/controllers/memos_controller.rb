class MemosController < ApplicationController
  before_action :set_memo, only: [:show, :edit, :update, :destroy]

  # GET /memos
  # GET /memos.json
  def index
    @memos = Memo.memo_list_all
  end

  # GET /memos/1
  # GET /memos/1.json
  def show
    #@documents = @memo.documents.all
  end

  # GET /memos/new
  def new
    @memo = Memo.new
    #@document = @memo.documents.build
  end

  # GET /memos/1/edit
  def edit
  end
#rails generate scaffold document memo_id:integer document:string
  # POST /memos
  # POST /memos.json
  def create
    @memo = Memo.new(memo_params)
    respond_to do |format|
      if @memo.save
        format.html { redirect_to @memo, notice: 'Memo was successfully created.' }
        format.json { render :show, status: :created, location: @memo }
      else
        format.html { render :new }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memos/1
  # PATCH/PUT /memos/1.json
  def update
    respond_to do |format|
      if @memo.update(memo_params)
        format.html { redirect_to @memo, notice: 'Memo was successfully updated.' }
        format.json { render :show, status: :ok, location: @memo }
      else
        format.html { render :edit }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memos/1
  # DELETE /memos/1.json
  def destroy
    @memo.update_attributes({:is_deleted=>true})
    respond_to do |format|
      format.html { redirect_to memos_url, notice: 'Memo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def download
        send_data("#{Rails.root}#{params[:download_str]}",
                   filename: params[:download_str].split("/").last,
                   disposition: 'attachment',
                   type: "application/pdf", stream: 'true', buffer_size: '4096')
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memo
      @memo = Memo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memo_params
      params.require(:memo).permit(:country, :memo,:description,:is_deleted,:name)
    end
end
