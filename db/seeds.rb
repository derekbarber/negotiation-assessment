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

questionA = Question.create(section_id: section1.id, style: "Collaborative", question: "I try to encourage everyone involved to share their perspective even if there is disagreement about what should happen.", type: "slider", display_order: 1)
questionB = Question.create(section_id: section1.id, style: "Compete", question: "I will do everything I can to get my way, but I don’t break the rules.", type: "slider", display_order: 2)
questionC = Question.create(section_id: section1.id, style: "Compromise", question: "I quickly try to identify a middle ground where everyone gets some of what they want.", type: "slider", display_order: 3)
questionD = Question.create(section_id: section1.id, style: "Abstain", question: "I focus on ways to get out of the situation or to minimize the problem.", type: "slider", display_order: 4)
questionE = Question.create(section_id: section1.id, style: "Accommodate", question: "I look to meet the needs of others first before seeking to meet my own.", type: "slider", display_order: 5)
questionF = Question.create(section_id: section1.id, style: "Status Quo", question: "I deal with it the same way I have always dealt with it.", type: "slider", display_order: 6)
questionG = Question.create(section_id: section1.id, style: "Impose", question: "My solution is best and I will sacrifice anything to get it.", type: "slider", display_order: 7)
questionH = Question.create(section_id: section1.id, style: "Accommodate", question: "I pay closest attention to maintaining the relationships and let go of what I want fairly easily.", type: "slider", display_order: 8)
questionI = Question.create(section_id: section1.id, style: "Collaborative", question: "I pay attention the needs and wants of others while encouraging them to do the same for me.", type: "slider", display_order: 9)
questionJ = Question.create(section_id: section1.id, style: "Compete", question: "I prioritize what I want and only engage with the others as much as I need to get their agreement.", type: "slider", display_order: 10)
questionK = Question.create(section_id: section1.id, style: "Abstain", question: "I find that most differences are best left alone as dealing with them only causes more problems.", type: "slider", display_order: 11)
questionL = Question.create(section_id: section1.id, style: "Compromise", question: "I look for tradeoffs and ways that everyone can give up a bit to make sure everyone gets the same amount of what they want.", type: "slider", display_order: 12)
questionM = Question.create(section_id: section1.id, style: "Status Quo", question: "I remind everyone of the rules about who gets what and make sure we follow them.", type: "slider", display_order: 13)
questionN = Question.create(section_id: section1.id, style: "Impose", question: "I get things done my way, regardless of what those around me want, even if I have to break the rules.", type: "slider", display_order: 14)

section2 = Section.create(assessment_id: assessment.id, title: "When it is really obvious that people want something different than me and what I want is important to me . . .", display_order: 2)

questionO = Question.create(section_id: section2.id, style: "Collaborative", question: "I commit the time and energy needed to make sure everyone has a say in what gets decided.", type: "slider", display_order: 1)
questionP = Question.create(section_id: section2.id, style: "Compromise", question: "I reduce my expectations of what I will get, but make sure I get something of what I want.", type: "slider", display_order: 2)
questionQ = Question.create(section_id: section2.id, style: "Compete", question: "I work hard to convince others that what I want is really important and it will be better for everyone if I got my way.", type: "slider", display_order: 3)
questionR = Question.create(section_id: section2.id, style: "Abstain", question: "I try to get what I want in other ways and to stay out of the situation as much as I can.", type: "slider", display_order: 4)
questionS = Question.create(section_id: section2.id, style: "Accommodate", question: "I suppress my own needs and desires to meet the needs and desires of the others.", type: "slider", display_order: 5)
questionT = Question.create(section_id: section2.id, style: "Status Quo", question: "I bring in someone who has authority to make sure the rules are followed and everyone gets what they are entitled to.", type: "slider", display_order: 6)
questionU = Question.create(section_id: section2.id, style: "Impose", question: "I don’t really care if others agree with me or like me as long as they do what I want them to.", type: "slider", display_order: 7)
questionV = Question.create(section_id: section2.id, style: "Avoid", question: "I find myself withdrawing from the situation and look for a safer place to be.", type: "slider", display_order: 8)
questionW = Question.create(section_id: section2.id, style: "Compete", question: "I push harder to get what I want and will mend fences once I get it.", type: "slider", display_order: 9)
questionX = Question.create(section_id: section2.id, style: "Accommodate", question: "I do my best to make sure the others get what they want so there is less friction.", type: "slider", display_order: 10)
questionY = Question.create(section_id: section2.id, style: "Collaborative", question: "I pay close attention to the what and why of other’s needs, and make sure they do the same for me.", type: "slider", display_order: 11)
questionZ = Question.create(section_id: section2.id, style: "Compromise", question: "I remind everyone that we need to give a little to get a little, and look for a 50-50 solution.", type: "slider", display_order: 12)
questionAA = Question.create(section_id: section2.id, style: "Impose", question: "I shape the situation so that there is no other option but the one that I want, and ensure the others comply.", type: "slider", display_order: 13)
questionBB = Question.create(section_id: section2.id, style: "Status Quo", question: "I follow the policies and procedures that are appropriate to the situation as a way to resolve the differences.", type: "slider", display_order: 14)


