class ResultsReportPdf < PdfReport
  require 'prawn/table'
  
  TABLE_WIDTHS = [40, 40, 40, 40, 40, 40, 40]
  TABLE_HEADERS = ["Collaborate", "Compete", "Compromise", "Abstain", "Accommodate", "Status Quo", "Impose"]

  def initialize(respondent)
    super()
    @respondent = respondent

    header

    move_down 20
    text 'Unstressed Results', size: 14, style: :bold
    move_down 10
    display_results_table('unstressed')

    move_down 20
    text 'Stressed Results', size: 14, style: :bold
    move_down 10
    display_results_table('stressed')

    move_down 30
    text 'Negotiation Styles', size: 16, style: :bold
    move_down 20

    abstain_style

    footer
  end

  private

  def display_results_table(type)
    case (type)
    when "unstressed"
      table_data = unstressed_data
    when "stressed"
      table_data = stressed_data
    else
      table_data = []
    end

    Rails.logger.info(table_data)

    if table_data.empty?
      text "No data Found"
    else
      table table_data,
        header: true
    end
  end


  def unstressed_data
    [["Collaborate", "Compete", "Compromise", "Abstain", "Accommodate", "Status Quo", "Impose"],
     [
      @respondent.calculate_score('Collaborative', 'unstressed'),
      @respondent.calculate_score('Compete', 'unstressed'),
      @respondent.calculate_score('Compromise', 'unstressed'), 
      @respondent.calculate_score('Abstain', 'unstressed'), 
      @respondent.calculate_score('Accommodate', 'unstressed'), 
      @respondent.calculate_score('Status Quo', 'unstressed'), 
      @respondent.calculate_score('Impose', 'unstressed')
      ]]

    #@table_data ||= @respondent.responses.map { |e| [e.id, e.name, e.created_at.strftime("%m/%d/%y"), e.created_by.try(:full_name)] }
  end

  def stressed_data
    [["Collaborate", "Compete", "Compromise", "Abstain", "Accommodate", "Status Quo", "Impose"],
     [
      @respondent.calculate_score('Collaborative', 'stressed'),
      @respondent.calculate_score('Compete', 'stressed'),
      @respondent.calculate_score('Compromise', 'stressed'), 
      @respondent.calculate_score('Abstain', 'stressed'), 
      @respondent.calculate_score('Accommodate', 'stressed'), 
      @respondent.calculate_score('Status Quo', 'stressed'), 
      @respondent.calculate_score('Impose', 'stressed')
      ]]
  end

  def abstain_style
    text "Abstain", size: 14, style: :bold
    move_down 10
    text "(Shadow side: Avoid)", :indent_paragraphs => 40
    move_down 10
    text "Appropriate strategy when:"
    text "Issue: Unimportant", :indent_paragraphs => 40
    text "Resources: Adequate", :indent_paragraphs => 40
    text "Relationship: Unimportant", :indent_paragraphs => 40
    move_down 10
    text "If neither the issue, nor the relationships are particularly important, it is unlikely you will want to engage in negotiations. This can be appropriate, for example, if the outcome of the decision will have little impact on your business."

    move_down 20
    bounding_box([10, cursor], :width => 440, :position => :center) do
      pad(10) {
        bounding_box([cursor, cursor], :width => 400, :position => :center) do
          text "Tom, I’d like to start ordering supplies from Company Reliable from now on.", :indent_paragraphs => 10
          text "Will it cost any more? Can they deliver when we need supplies?", :indent_paragraphs => 10
          move_down 10
          text 'You may ask yourself “Why am I involved in this decision?”, because neither issue nor relationship to your supplier is important to you, so you appropriately abstain from this decision and allow those affected to be more empowered to decide.', :indent_paragraphs => 10
        end
        transparent(0.5) { stroke_bounds }
      }
    end
    
    text "However, if you find you routinely avoid conflict or decisions, and this is your default or most comfortable style of negotiation, you need to be aware that when issues or relationships are important, your avoidance of the concern will be experienced by others as if they, and what matters to them, are unimportant to you.  If this is your default style then you have many unsolved problems and broken, weak or unhealthy relationships."
  end

end