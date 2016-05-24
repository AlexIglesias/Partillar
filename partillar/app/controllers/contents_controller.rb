class ContentsController < ApplicationController
  include Geokit::Geocoders

  def index
    content = Content.all
    @curated_content = content.where(curated: true)
    @content = Content.new
  end

  def search
    if params[:content][:title]
      @content = Content.search(params[:content][:title])
    else
      @content = Content.all
    end
  end

  def show
    @content = Content.find(params[:id])
  end

  def new
    @content = Content.new
    render :new
  end

  def create
    @category = Category.all
    @content = Content.new(content_params)
    @content.user = current_user
    check_location(params[:content][:location])
    respond_to do |format|
      if verify_recaptcha(model: @content) && @content.save
        flash[:success] = "El contenido se ha creado correctamente. En cuanto se verifique, estará disponible para todo el mundo"
        format.html { redirect_to '/'}
        format.json { render json: @content }
      else
        flash[:danger] = "Ups!! Parece que ha habido algún error. Revisa los campos del formulario"
        format.html { render :new }
      end
    end
  end

  private
  def content_params
    params.require(:content).permit(
      :source,
      :title,
      :media_url,
      :description,
      :image,
      :category_id)
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
