class ContentsController < ApplicationController

  def index
    content = Content.all
    @curated_content = content.where(curated: true)
  end

  def show
    @content = Content.find(params[:id])
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

private
    def content_params
      params.require(:content).permit(:source, :title, :media_url, :description)
    end
end
