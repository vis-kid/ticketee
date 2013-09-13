require 'spec_helper'

feature 'Viewing tickets' do
	before do
		textmate_2_project = create_project('TextMate 2')

		create_ticket(project: textmate_2_project,
									title: 'Make it shiny!',
		              description: 'Gradients! Oh my!')

		internet_explorer_project = create_project('Internet Explorer')
		
		create_ticket(project: internet_explorer_project,
									title: 'Standards Compliance',
		              description: 'Is not a joke')

		visit '/'
	end

	scenario 'Viewing tickets for a given project' do
		click_link 'TextMate 2'
		
		expect(page).to have_content('Make it shiny!')
		expect(page).to_not have_content('Standars Compliance')

		click_link 'Make it shiny!'
		within('#ticket h2') do
			expect(page).to have_content('Make it shiny!')
		end
		
		expect(page).to have_content('Gradients! Oh my!')
	end

	private

	def create_project(name)
		FactoryGirl.create(:project, name: name)
	end

	def create_ticket(attr = {})
		FactoryGirl.create(:ticket,
											 project:     attr[:project],
											 title:       attr[:title],
											 description: attr[:description])
	end
end
