ActiveAdmin.register AdminUser do
  form do |f|
    f.inputs "Admin user" do
      f.input :email
      f.input :password
      f.buttons
    end
  end
  #configure index view page
  index do
    column :email
    column :created_at
  end
end
