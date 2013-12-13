ActiveAdmin.register Person do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  permit_params :name, :email, :bio, :company, :github, :twitter, :linkedin, :image, :tag_list

  controller do
    def permitted_params
      params.permit!
    end
  end

  around_filter do |controller, action|
    Person.class_eval do
      alias :__active_admin_to_param :to_param
      def to_param() id.to_s end
    end

    begin
      action.call
    ensure
      Person.class_eval do
        alias :to_param :__active_admin_to_param
      end
    end
  end

  index do
    column :photo do |p|
      if p.photo
        image_tag p.photo.url, size: '100x80'
      end
    end
    column :name
    column :tag_list
    column :email
    column :bio do |p|
      truncate p.bio
    end
    column :company
    column :github
    column :twitter
    column :linkedin
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name, :label => "Name"
      f.input :email, :label => "Email"
      f.input :bio, :label => "Bio"
      f.input :company, :label => "Company"
      f.input :github, :label => "Github"
      f.input :twitter, :label => "Twitter"
      f.input :linkedin, :label => "Linkedin"
      f.input :slug, :label => "Slug"
      f.input :tag_list, :label => "Tags"
      f.input :photo, :label => "Photo", :as => :file
    end
    f.actions do
      f.action :submit, :as => :button
    end
  end

end
