RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  RailsAdmin.config do |config|
    class RailsAdmin::Config::Fields::Types::Inet < RailsAdmin::Config::Fields::Base
      RailsAdmin::Config::Fields::Types::register(self)
    end
    config.authenticate_with do
      warden.authenticate! scope: :admin
    end
    config.current_user_method(&:current_admin)
  end

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

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
end
