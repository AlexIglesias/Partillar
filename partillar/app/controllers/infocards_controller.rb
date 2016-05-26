class InfocardsController < ApplicationController
  include Geokit::Geocoders

  def index

    infocard = Infocard.all
    @curated_infocard = infocard.where(curated: true)
    @infocard = Infocard.new
  end

  def search
      @infocard = Infocard.search(params[:infocards][:title])
  end

  def show
    @infocard = Infocard.find(params[:id])
    respond_to do |format|
      format.js{}
      format.html{}
    end
  end

  def new
    @infocard = Infocard.new
    render :new
  end

  def create
    @category = Category.all
    @infocard = Infocard.new(infocard_params)
    @infocard.user = current_user
    check_location(params[:infocard][:location])
    respond_to do |format|
      if verify_recaptcha(model: @infocard) && @infocard.save
        flash[:success] = "El contenido se ha creado correctamente. En cuanto se verifique, estará disponible para todo el mundo"
        format.html { redirect_to '/'}
        format.json { render json: @infocard }
      else
        flash[:danger] = "Ups!! Parece que ha habido algún error. Revisa los campos del formulario"
        format.html { render :new }
      end
    end
  end

  private
  def infocard_params
    params.require(:infocard).permit(
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
      @infocard.build_location(
        name: geo_location.city,
        latitude: geo_location.lat,
        longitude: geo_location.lng)
    end
  end
end
