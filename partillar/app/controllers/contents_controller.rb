class ContentsController < ApplicationController
  include Geokit::Geocoders

  def index
    content = Content.all
    @curated_content = content.where(curated: true)
    @content = Content.new
  end

  def show
    @content = Content.find(params[:id])
  end

  def new
    @content = Content.new
  end

  def create
    @category = Category.all
    @content = Content.new(content_params)
    check_location(params[:content][:location])
    respond_to do |format|
      if verify_recaptcha(model: @content) && @content.save
           format.html { redirect_to @content, notice: 'Content was successfully created.' }
           flash[:notice] = "Content created succesfully"
         else
           format.html { render :new }
           flash.now[:alert] = "Error!!!!"
         end
     end
  end

private
    def content_params
      params.require(:content).permit(:source, :title, :media_url, :description, :category_id)
    end

    def check_location(location)
      geo_location = GoogleGeocoder.geocode(location)
       if geo_location.success
          @content.build_location(
            name: geo_location.city,
            latitude: geo_location.lat,
            longitude: geo_location.lng)
       end
    end
end
