class ResultsReportPdf < PdfReport
  require 'prawn/table'

  TABLE_WIDTHS = [40, 40, 40, 40, 40, 40, 40]
  TABLE_HEADERS = ["Collaborate", "Compete", "Compromise", "Abstain", "Accommodate", "Status Quo", "Impose"]

  def initialize(respondent)
    super()
    @respondent = respondent

    header

    move_down 20
    text 'Unstressed Results', size: 15, style: :bold
    move_down 10
    display_results_table('unstressed')

    move_down 20
    text 'Stressed Results', size: 15, style: :bold
    move_down 10
    display_results_table('stressed')

    start_new_page
    preferred_styles("unstressed")

    start_new_page
    least_preferred_styles("unstressed")

    start_new_page
    preferred_styles("stressed")

    start_new_page
    least_preferred_styles("stressed")

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

  def preferred_styles(stress_level)

    if stress_level == "unstressed"
      text 'Preferred Low Stress Styles', size: 16, style: :bold
    elsif stress_level == "stressed"
      text 'Preferred High Stress Styles', size: 16, style: :bold
    end
    move_down 20

    if @respondent.calculate_score('Abstain', stress_level) >= 8
      draw_abstain
      move_down 20
    end
    if @respondent.calculate_score('Accomodate', stress_level) >= 8
      draw_accomodate
      move_down 20
    end
    if @respondent.calculate_score('Compromise', stress_level) >= 8
      draw_compromise
      move_down 20
    end
    if @respondent.calculate_score('Compete', stress_level) >= 8
      draw_compete
      move_down 20
    end
    if @respondent.calculate_score('Collaborate', stress_level) >= 8
      draw_collaborate
      move_down 20
    end
    if @respondent.calculate_score('Status Quo', stress_level) >= 8
      draw_status_quo
      move_down 20
    end
    if @respondent.calculate_score('Impose', stress_level) >= 8
      draw_impose
      move_down 20
    end
  end

  def least_preferred_styles(stress_level)
    if stress_level == "unstressed"
      text 'Least Preferred Low Stress Styles', size: 16, style: :bold
    elsif stress_level == "stressed"
      text 'Least Preferred High Stress Styles', size: 16, style: :bold
    end
    move_down 20

    if @respondent.calculate_score('Abstain', stress_level) < 8
      draw_abstain
      move_down 20
    end
    if @respondent.calculate_score('Accomodate', stress_level) < 8
      draw_accomodate
      move_down 20
    end
    if @respondent.calculate_score('Compromise', stress_level) < 8
      draw_compromise
      move_down 20
    end
    if @respondent.calculate_score('Compete', stress_level) < 8
      draw_compete
      move_down 20
    end
    if @respondent.calculate_score('Collaborate', stress_level) < 8
      draw_collaborate
      move_down 20
    end
    if @respondent.calculate_score('Status Quo', stress_level) < 8
      draw_status_quo
      move_down 20
    end
    if @respondent.calculate_score('Impose', stress_level) < 8
      draw_impose
      move_down 20
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

  def draw_style (title, params)
    text title, size: 14, style: :bold
    move_down 10
    text "(Shadow side: #{params[:shadow_side]})", :indent_paragraphs => 30
    move_down 10
    text "Appropriate strategy when:"
    text "Issue:  #{params[:issue]}", :indent_paragraphs => 30
    text "Resources:  #{params[:resources]}", :indent_paragraphs => 30
    text "Relationship:  #{params[:relationship]}", :indent_paragraphs => 30
    move_down 10
    text params[:description]

    move_down 20
    bounding_box([10, cursor], :width => 440, :position => :center) do
      pad(20) {
        bounding_box([cursor, cursor], :width => 400, :height => 80, :position => :center) do
          text_box params[:example], :at => [20, cursor]
          #text "Tom, I’d like to start ordering supplies from Company Reliable from now on.", :indent_paragraphs => 10
          #text "Will it cost any more? Can they deliver when we need supplies?", :indent_paragraphs => 10
          #move_down 10
          #text 'You may ask yourself “Why am I involved in this decision?”, because neither issue nor relationship to your supplier is important to you, so you appropriately abstain from this decision and allow those affected to be more empowered to decide.', :indent_paragraphs => 10
        end
        transparent(0.5) { stroke_bounds }
      }
    end
    
    text params[:outcome]
  end

  def draw_abstain

    style_params = { 
      shadow_side: "Avoid",
      issue: "Unimportant",
      resources: "Adequate",
      relationship: "Unimportant",
      description: "If neither the issue, nor the relationships are particularly important, it is unlikely you will want to engage in negotiations. This can be appropriate, for example, if the outcome of the decision will have little impact on your business.",
      example: '"Tom, I’d like to start ordering supplies from Company Reliable from now on."
  "Will it cost any more? Can they deliver when we need supplies?"
  
  You may ask yourself "Why am I involved in this decision?", because neither issue nor relationship to your supplier is important to you, so you appropriately abstain from this decision and allow those affected to be more empowered to decide.',
      outcome: "However, if you find you routinely avoid conflict or decisions, and this is your default or most comfortable style of negotiation, you need to be aware that when issues or relationships are important, your avoidance of the concern will be experienced by others as if they, and what matters to them, are unimportant to you.  If this is your default style then you have many unsolved problems and broken, weak or unhealthy relationships."
    }

    draw_style "Abstain", style_params
  end

  def draw_accomodate

    style_params = { 
      shadow_side: "Resignation",
      issue: "Unimportant",
      resources: "Adequate",
      relationship: "Important",
      description: "This strategy is best used when the relationship is more important to you than the issue, and there are adequate resources to accommodate.  The outcomes from this strategy can be satisfying when there is equality in accommodation over time, and many issues.",
      example: 'A long-term staff member wants to change his holidays and this means your holidays will have to change. You appreciate his concern, and, as you haven’t yet made plans, you can accommodate his request.',
      outcome: "However, if you find you routinely resign yourself to the other’s wishes during negotiations, and this is your default or most comfortable style of negotiation, you need to be aware that others will find you easy to get along with, but hard to know as your needs and wishes are rarely shared.  If this is your default style then you feel like a welcome mat.  The solutions you participate in do not meet your needs and frustrate you."
    }

    draw_style "Accomodate", style_params
  end

  def draw_compromise

    style_params = { 
      shadow_side: "Settle",
      issue: "Important",
      resources: "Limited",
      relationship: "Important",
      description: 'This strategy is best used when you have limited time or capital, and both the issue and relationship are important to you. It is also effective when the issue and relationship matter somewhat, and you will be satisfied with a compromise, or moderately satisfying solution.  The outcomes from this strategy tend to be of lower quality than what is possible (which may be "good enough").',
      example: 'Your neighbor wants to put up a fence between your and her yard.  She is willing to put in the labour if you buy the materials.  She wants the high-end cedar fence and you would prefer a less expensive version.  You agree to pay for the more expensive material because it would cost more to hire someone else to put in the less expensive materials.',
      outcome: "However, if this is your primary negotiation strategy, over time others will be able to anticipate your response to their requests, but may not sense that you engage fully in the negotiations. You seem to care little about what they need and why, and they will feel like the relationship could be more satisfying.  If this is your default style then you are likely producing lower quality solutions, and having decent, or “okay” relationships."
    }

    draw_style "Compromise", style_params
  end

  def draw_compete

    style_params = { 
      shadow_side: "Battle",
      issue: "Important",
      resources: "Adequate",
      relationship: "Unimportant",
      description: "This strategy is useful when the issue at hand is more important than the relationship, or the other party is not able/interested in collaborating.  It is clear that competition assumes that the other party is of similar enough power and influence that they have a chance of winning.  See Impose for cases where one party has significantly more power.",
      example: 'A government contract is announced for bidding.  You and another company like yours have similar products that will fulfill the needs of the bid.  There is no benefit to forming a partnership and the other party, who has messed with your business in the past, has already started to angle for selection.    It is time to pull out all the stops and put your company ahead.',
      outcome: "However, others may find this style difficult to engage, particularly if the competition becomes combative. Strong individuals will fight back; weaker individuals will avoid direct confrontation. If this is your default conflict style, then you are likely producing lower quality solutions and weakened relationships."
    }

    draw_style "Compete", style_params
  end

  def draw_collaborate

    style_params = { 
      shadow_side: "Collude",
      issue: "Important",
      resources: "Adequate",
      relationship: "Important",
      description: "This negotiation style is particularly useful when both the issue and relationship are important, and the concern is important enough that it is worth spending time, energy and other resources on building a great solution that is sustainable.",
      example: 'You hear your staff complaining about a new person you just hired.  You think the new person is great for the job but are concerned about the needs of the current staff.   It is time to find out what is going on, and work with both the current and new staff to find a way to resolve the problems.',
      outcome: "Others will find this style respectful and meaningful, although it can feel like hard work. The rewards are positive, sustainable outcomes. If this is your default style then you spend a lot of time and energy solving problems, and have strong solutions and good relationships.
      
Collaboration can require a great deal of skills and training that is not common. Engaging skilled negotiators to assist you as you build skill sets and competencies is a good investment when issues and concerns warrant good outcomes."
    }

    draw_style "Collaborate", style_params
  end

  def draw_status_quo

    style_params = { 
      shadow_side: "Inert",
      issue: "None",
      resources: "Stable",
      relationship: "Stable",
      description: "",
      example: 'Paula didn’t think it mattered how the dishes were cleaned as long as they were done right after dinner, so she continued to assign staff to do it based on the old strategy of asking the servers to stay late.',
      outcome: "It is appropriate to maintain the status quo when there are no issues or concerns to negotiate.  However, be aware that if others think the issue is important, they will view this strategy as being inflexible and unwilling to change."
    }

    draw_style "Status Quo", style_params
  end

  def draw_impose

    style_params = { 
      shadow_side: "Oppress",
      issue: "Important",
      resources: "Irrelevant or resources external to the conflict have overwhelming importance",
      relationship: "Irrelevant or relationships external to the conflict have overwhelming importance",
      description: "When an issue or concern is so overwhelmingly important that relationships or resources are irrelevant, it is appropriate to impose your decision.  To apply this style appropriately, care for impact on those affected will be a key ingredient and applying resources to mitigating impact will go a long way.  It is most successfully implemented by those who have more influence, power and resource. It is important to note that a key difference between an appropriate use of imposition and an unhealthy use is how you follow the expected expression of coercion in the context of the imposition. IE if you play by the rules, then it will be much less likely to destroy relationship than if you break the expected rules.",
      example: 'George knew exactly what Tom was going to complain about when he saw George holding his harness in the office. Yes, Tom had worked for many years roofing without the use of safety equipment (and hadn’t had an accident yet). George also knew it was important for everyone’s wellbeing, as well as for the company’s liability coverage, that the full gear be worn on every job. He was going to insist Tom begin using safety gear or face discipline.',
      outcome: "However, if you regularly impose your will on others without consideration for the consequences to relationships and resources, others will experience this as oppression."
    }

    draw_style "Impose", style_params
  end

end