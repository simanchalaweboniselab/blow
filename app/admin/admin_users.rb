ActiveAdmin.register AdminUser do
  #DONE customize the form of new admin user
  form do |f|
    f.inputs "Admin user" do
      f.input :email
      f.input :password
      f.buttons
    end
  end
  #DONE customize the index page of admin user
  index do
    column :id
    column :email
    column :created_at
    column "active" do |f|
      if f.active
        value = true
      else
        value = false
      end
      check_box_tag("active", value , f.active)
    end
    default_actions
  end

  controller do
    #TODO provide active/inactive options for
    def admin_actives
      id = params[:id].to_i
      active =  params[:active]
      logger.info "controller => admin_users action=> admin_actives==================================================================#{active.inspect}"
      if active == "true"
        active = false;
      else
        active = true;
      end
      logger.info "controller => admin_users action=> admin_actives==================================================================#{active.inspect}"
      admin_user = AdminUser.find(params[:id].to_i)
      logger.info "controller => admin_users action=> admin_actives==================================================================#{admin_user.inspect}"
      admin_user.active = active
      admin_user.save
      respond_to do |format|
        format.js
      end
    end
    def login
      logger.info "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      admin_user = AdminUser.find_for_database_authentication(:email => params[:email])
      if admin_user.valid_password?(params[:password])
        format.html { redirect_to admin_dashboard_path , notice: 'signed successfully' }
      else
        format.html { render action: "admin/login" }
      end
    end
  end
end
