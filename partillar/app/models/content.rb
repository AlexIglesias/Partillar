class Content < ActiveRecord::Base
  has_attached_file :image,
              styles: { thumb: ["64x64#", :jpg],
                      original: ['500x500>', :jpg] },
              convert_options: { thumb: "-quality 75 -strip",
                                original: "-quality 85 -strip" }
              storage: :s3,
              s3_credentials: {access_key_id: ENV["AKIAILJD2EO27BOUG4KA"],
                secret_access_key: ENV["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"]},
              bucket: "partillar"

  validates_attachment :image,
      content_type: { content_type: ["image/jpeg", "image/png"] }


  validates :source, :title, :description, :category, :location, presence: true

  belongs_to :category
  belongs_to :location
  before_post_process :skip_for_audio

  def skip_for_audio
    ! %w(audio/ogg application/ogg).include?(asset_content_type)
  end

  def self.search(query)
    if query.capitalize.blank?
       where('curated = true')
    else
      where('title LIKE ? AND curated = true', "%#{query.capitalize}%")
    end
  end
end
