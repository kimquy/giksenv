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
    column :image do |p|
      image_tag p.image, size: '100x80'
    end
    column :name
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
end
