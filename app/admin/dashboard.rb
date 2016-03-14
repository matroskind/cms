ActiveAdmin.register_page "Dashboard" do
    #what's to be displayed in dashboard
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

    content title: proc{ I18n.t("active_admin.dashboard") } do
        #display recent pages
        section "Recent Pages", :priority => 1 do
            table_for Page.order("id desc").limit(20) do
                column :id
                column "Page Title", :title do |page|
                    link_to page.title, [:admin, page]
                end
                column :section, :sortable => :section
                column :created_at
            end
        end
        # display recent sections
        section "Recent Sections", :priority => 1 do
            table_for Section.order("id desc").limit(20) do
                column :id
                column "Section Name", :name do |section|
                    link_to section.name, [:admin, section]
                end
                column :created_at
            end
        end
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end