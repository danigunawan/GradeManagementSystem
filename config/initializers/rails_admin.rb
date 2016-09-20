RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)

  ## == Cancan ==
   config.authorize_with :cancan
   config.label_methods.unshift(:display_name)

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  
  
  # other sections will show all fields if not noted
  
  config.model User do 
    list do 
      include_all_fields
      exclude_fields :created_at, :updated_at
    end
  end
  
  config.model Role do
    list do 
      include_all_fields
      exclude_fields :created_at, :updated_at
    end
  end
  
  config.model Subject do
    list do 
      include_all_fields
      exclude_fields :created_at, :updated_at
    end
  end
  
  config.model Section do
    list do
      include_all_fields
      field :subject do
        searchable :course_name
        pretty_value do
          value.try(:course_name)
        end
      end
      exclude_fields :created_at, :updated_at
    end

    edit do
      include_all_fields
      field :subject, :belongs_to_association
    end
  end
  
  config.model Registration do
    list do
      field :id
      field :user, :belongs_to_association
      field :grade
      field :section, :belongs_to_association
    end

    show do
      field :id
      field :user, :belongs_to_association
      field :grade
      field :section, :belongs_to_association
    end
  end
end
