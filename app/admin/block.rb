ActiveAdmin.register Block do
#params permitted for blocks
permit_params :title, :show_title, :body, :position,:display, :class_suffix, :order, :is_published
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
	#columns to be shown
	index do
		column :id
		column :title, :sortable => :title
		column :position, :sortable => :position
		column :display, :sortable => :display
		column :created_at, :sortable => :created_at
		column :oder
		actions
	end
	#edit form for blocks, add html editor for body
	form do |f|
	f.inputs "Details" do
		f.input :title, :label =>'Title'
		f.input :show_title, :label => 'Show Title'
		f.input :position, :label => 'Position', :as => :select, :collection => [["Jumbotron", "jumbotron"], ["Block", "block"]]
		f.input :display, :label => 'Display', :as => :select, :collection => [["All pages", "all"], ["Homepage Only", "home"], ["All but Homepage", "nohome"]]
		f.input :body, as: :html_editor, :label => 'Body'
		f.input :order, :label => 'Order'
		f.input :class_suffix, :label => 'Class Suffix'
		f.input :is_published, :label => 'Published'
		f.actions
	end
end

end