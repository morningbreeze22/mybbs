class ForumsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /forums
  # GET /forums.json
  def index
    @forums = Forum.all
  end

  # GET /forums/1
  # GET /forums/1.json

  def show
    @forum=Forum.find(params[:id])
    @articles = @forum.articles
    @result = [:forum=>@forum,:articles=>@articles]
  end


  # GET /forums/new
  def new
    @forum = Forum.new
  end

  # GET /forums/1/edit
  def edit
  end

  # POST /forums
  # POST /forums.json
  def create
    @forum = Forum.new(forum_params)

    respond_to do |format|
      if @forum.save
        format.html { redirect_to @forum, notice: '新建社区成功' }
        format.json { render :show, status: :created, location: @forum }
      else
        format.html { render :new }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forums/1
  # PATCH/PUT /forums/1.json
  def update
    respond_to do |format|
      if @forum.update(forum_params)
        format.html { redirect_to @forum, notice: '更新成功' }
        format.json { render :show, status: :ok, location: @forum }
      else
        format.html { render :edit }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1
  # DELETE /forums/1.json
  def destroy
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to forums_url, notice: '删除成功' }
      format.json { head :no_content }
    end
  end

  def favorforum
    @forum = Forum.find(params[:id])
    @forum.users <<  current_user
    redirect_to "/forums"
  end


  def unfavorforum
    @forum = Forum.find(params[:id])
    @forum.users.delete current_user
    redirect_to "/forums"
  end

  def unfavorinlist
    @forum = Forum.find(params[:id])
    @forum.users.delete current_user
    redirect_to "/myfavor"
  end


  def allfavor
    @forums = current_user.forums
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum
      @forum = Forum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_params
      params.require(:forum).permit(:name)
    end
end
