Redmine::Plugin.register :redmine_project_attachments do
  name 'Redmine Project Attachments plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  permission :view_project_attachments,  :list_attachments => [:index]
  
  menu :project_menu,
       :list_attachments,
       {:controller => :list_attachments, :action => :index}, 
       :caption => :label_attachments_plural,
       :param => :project_id,
       :if => Proc.new{ |project| User.current.allowed_to?({:controller => :list_attachments, :action => :index}, project) }

end
