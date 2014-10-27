class PdfReport < Prawn::Document

  # Often-Used Constants
  TABLE_ROW_COLORS = ["FFFFFF","DDDDDD"]
  TABLE_FONT_SIZE = 9
  TABLE_BORDER_STYLE = :grid

  def initialize(default_prawn_options={})
    super(default_prawn_options)
    font_size 10
  end

  def header
    #image "#{Rails.root}/public/logo.png", height: 30
    text "Negotiation Styles Inventory Results", size: 18, style: :bold, align: :center
    move_down 20
    text "Your results are broken into two sets, one for when you are calm and one for when the situation is more stressful.  A higher score means you are more likely to use that style.  Your highest scores indicate your more preferred styles of negotiation.  Look at the definitions of the various styles and see note the key features of each one.  Are you satisfied with your negotiation styles, or do you think you need to broaden your capacity for one or several of the styles?", size: 12
  end

  def footer
    # ...
  end

  # ... More helpers
end