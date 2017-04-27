class Spree::PageImage < Spree::Asset
  attr_accessor :slide_video_url, :slide_position, :slide_image_url
  after_initialize :set_default_properties
  
  has_attached_file :attachment,
    :styles => Proc.new{ |clip| clip.instance.attachment_sizes },
    :default_style => :original,
    :url => '/spree/pages/:id/:style/:basename.:extension',
    :path => ':rails_root/public/spree/pages/:id/:style/:basename.:extension'

  validates_attachment_content_type :attachment, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :attachment, attachment_presence: true

  def image_content?
    attachment_content_type.to_s.match(/\/(jpeg|png|gif|tiff|x-photoshop)/)
  end

  def attachment_sizes
    sizes = {}
    if image_content?
      sizes.merge!(mini: '48x48>', small: '150x150>', medium: '420x300>', large: '900x650>')
      sizes.merge!(slide: '950x250#') if viewable.respond_to?(:root?) && viewable.root?
    end
    sizes
  end

  def slide_image_url
    image_sizes = Spree::Frontend::ImagesHelper::IMAGE_SIZES
    dynamic_attachment_url(image_sizes[:landing])
  end

  def slide_video_url=(url)
    properties["slide_video_url"] = url
  end

  def slide_position=(slide_position)
    properties["slide_position"]  = slide_position
  end

  def slide_video_url
    properties["slide_video_url"]
  end

  def slide_position
    properties["slide_position"]
  end

  private
    def set_default_properties
      self.properties ||= {slide_video_url: '', slide_position: 0}
    end
end
