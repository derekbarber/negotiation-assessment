# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

organization = Organization.create(name: "Test")

assessment = Assessment.create(organization_id: organization.id, name: "7 Negotiation Styles Inventory", overview: "This inventory has not been scientifically proven; it is, however, an excellent tool to begin exploring your own preferred negotiation style.  You will learn more about how you approach negotiation and what other options, or styles, can be available to you.",  instructions: "Consider your response in situation when you want something different than another person.  Note that the first section is deals with those situations where you are at a normal level of energy (you are ok).  The second deals with situations where you are at a higher level of emotional engagement in the negotiation (you are starting to feel strongly about the negotiation).  Rate each statement as being very characteristic for you, or as not at all characteristic, or somewhere in between.", status: "enabled")

section1 = Section.create(assessment_id: assessment.id, title: "When I become aware that I want something different than those around me . . .", display_order: 1)

questionA = Question.create(section_id: section1.id, assessment_style: "Collaborative", question_text: "I try to encourage everyone involved to share their perspective even if there is disagreement about what should happen.", question_type: "slider", display_order: 1)
questionB = Question.create(section_id: section1.id, assessment_style: "Compete", question_text: "I will do everything I can to get my way, but I don’t break the rules.", question_type: "slider", display_order: 2)
questionC = Question.create(section_id: section1.id, assessment_style: "Compromise", question_text: "I quickly try to identify a middle ground where everyone gets some of what they want.", question_type: "slider", display_order: 3)
questionD = Question.create(section_id: section1.id, assessment_style: "Abstain", question_text: "I focus on ways to get out of the situation or to minimize the problem.", question_type: "slider", display_order: 4)
questionE = Question.create(section_id: section1.id, assessment_style: "Accommodate", question_text: "I look to meet the needs of others first before seeking to meet my own.", question_type: "slider", display_order: 5)
questionF = Question.create(section_id: section1.id, assessment_style: "Status Quo", question_text: "I deal with it the same way I have always dealt with it.", question_type: "slider", display_order: 6)
questionG = Question.create(section_id: section1.id, assessment_style: "Impose", question_text: "My solution is best and I will sacrifice anything to get it.", question_type: "slider", display_order: 7)
questionH = Question.create(section_id: section1.id, assessment_style: "Accommodate", question_text: "I pay closest attention to maintaining the relationships and let go of what I want fairly easily.", question_type: "slider", display_order: 8)
questionI = Question.create(section_id: section1.id, assessment_style: "Collaborative", question_text: "I pay attention the needs and wants of others while encouraging them to do the same for me.", question_type: "slider", display_order: 9)
questionJ = Question.create(section_id: section1.id, assessment_style: "Compete", question_text: "I prioritize what I want and only engage with the others as much as I need to get their agreement.", question_type: "slider", display_order: 10)
questionK = Question.create(section_id: section1.id, assessment_style: "Abstain", question_text: "I find that most differences are best left alone as dealing with them only causes more problems.", question_type: "slider", display_order: 11)
questionL = Question.create(section_id: section1.id, assessment_style: "Compromise", question_text: "I look for tradeoffs and ways that everyone can give up a bit to make sure everyone gets the same amount of what they want.", question_type: "slider", display_order: 12)
questionM = Question.create(section_id: section1.id, assessment_style: "Status Quo", question_text: "I remind everyone of the rules about who gets what and make sure we follow them.", question_type: "slider", display_order: 13)
questionN = Question.create(section_id: section1.id, assessment_style: "Impose", question_text: "I get things done my way, regardless of what those around me want, even if I have to break the rules.", question_type: "slider", display_order: 14)

section2 = Section.create(assessment_id: assessment.id, title: "When it is really obvious that people want something different than me and what I want is important to me . . .", display_order: 2)

questionO = Question.create(section_id: section2.id, assessment_style: "Collaborative", question_text: "I commit the time and energy needed to make sure everyone has a say in what gets decided.", question_type: "slider", display_order: 1)
questionP = Question.create(section_id: section2.id, assessment_style: "Compromise", question_text: "I reduce my expectations of what I will get, but make sure I get something of what I want.", question_type: "slider", display_order: 2)
questionQ = Question.create(section_id: section2.id, assessment_style: "Compete", question_text: "I work hard to convince others that what I want is really important and it will be better for everyone if I got my way.", question_type: "slider", display_order: 3)
questionR = Question.create(section_id: section2.id, assessment_style: "Abstain", question_text: "I try to get what I want in other ways and to stay out of the situation as much as I can.", question_type: "slider", display_order: 4)
questionS = Question.create(section_id: section2.id, assessment_style: "Accommodate", question_text: "I suppress my own needs and desires to meet the needs and desires of the others.", question_type: "slider", display_order: 5)
questionT = Question.create(section_id: section2.id, assessment_style: "Status Quo", question_text: "I bring in someone who has authority to make sure the rules are followed and everyone gets what they are entitled to.", question_type: "slider", display_order: 6)
questionU = Question.create(section_id: section2.id, assessment_style: "Impose", question_text: "I don’t really care if others agree with me or like me as long as they do what I want them to.", question_type: "slider", display_order: 7)
questionV = Question.create(section_id: section2.id, assessment_style: "Avoid", question_text: "I find myself withdrawing from the situation and look for a safer place to be.", question_type: "slider", display_order: 8)
questionW = Question.create(section_id: section2.id, assessment_style: "Compete", question_text: "I push harder to get what I want and will mend fences once I get it.", question_type: "slider", display_order: 9)
questionX = Question.create(section_id: section2.id, assessment_style: "Accommodate", question_text: "I do my best to make sure the others get what they want so there is less friction.", question_type: "slider", display_order: 10)
questionY = Question.create(section_id: section2.id, assessment_style: "Collaborative", question_text: "I pay close attention to the what and why of other’s needs, and make sure they do the same for me.", question_type: "slider", display_order: 11)
questionZ = Question.create(section_id: section2.id, assessment_style: "Compromise", question_text: "I remind everyone that we need to give a little to get a little, and look for a 50-50 solution.", question_type: "slider", display_order: 12)
questionAA = Question.create(section_id: section2.id, assessment_style: "Impose", question_text: "I shape the situation so that there is no other option but the one that I want, and ensure the others comply.", question_type: "slider", display_order: 13)
questionBB = Question.create(section_id: section2.id, assessment_style: "Status Quo", question_text: "I follow the policies and procedures that are appropriate to the situation as a way to resolve the differences.", question_type: "slider", display_order: 14)


