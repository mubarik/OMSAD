OSMAD::Application.routes.draw do

  root :to =>"welcome#index"
  match 'faculty/facultycourses/populate_courses' => 'faculty/facultycourses#populate_courses'
  resources :teammembers
  namespace :faculty do
     resources :researchgrants do
       collection do
         get "edit"
         post "edit"
       end
     end
     resources :facultymembers do
       collection do
         get "edit"
         post "edit"
       end
     end
     resources :journalpublications do
       collection do
         get "edit"
         post "edit"
         get "import_data"
         post "import_data"
         get "importbibtex"
         post "importbibtex"
       end
     end
     resources :conferencepublications do
       collection do
         get "edit"
         post "edit"
         get "import_data"
         post "import_data"
         get "importbibtex"
         post "importbibtex"
       end
     end
     resources :workshoppublications do
       collection do
         get "edit"
         post "edit"
         get "import_data"
         post "import_data"
         get "importbibtex"
         post "importbibtex"
       end
     end
     resources :bookpublications do
       collection do
         get "edit"
         post "edit"         
         get "import_data"
         post "import_data"
         get "importbibtex"
         post "importbibtex"
       end
     end
     resources :publications
     resources :bookchapterpublications do
       collection do
         get "edit"
         post "edit"
         get "import_data"
         post "import_data"
         get "importbibtex"
         post "importbibtex"
       end
     end
     resources :technicalreportpublications do
       collection do
         get "edit"
         post "edit"
         get "import_data"
         post "import_data"
         get "importbibtex"
         post "importbibtex"
       end
     end
     resources :facultyreports do
       collection do
         get "professionalinformation"
         get "researchgrants"
       end
     end
     
     resources :facultycourses
     resources :scholarlyreport
     resources :projectconfs
     resources :staticpages
  end

  #root :to => "GraduateStudents/students#index"
  match '*students/:id/students' => 'GraduateStudents/students#routing'
  match '*courses/:id/courses' => 'GraduateStudents/courses#routing'
  match '*semesters/:id/semesters' => 'GraduateStudents/semesters#routing'
  match 'GraduateStudents/independent_studies/create' => 'GraduateStudents/independent_studies#create'
  match 'GraduateStudents/independent_studies/destroy' => 'GraduateStudents/independent_studies#destroy'
  match 'GraduateStudents/student_courses/populate_courses' => 'GraduateStudents/student_courses#populate_courses'
  namespace :GraduateStudents do
    
    resources :students do
      collection do
         get "csv_import"
         post "csv_import"
         post "uploadstudentsemester"
         post "uploadphd"
         post "uploadfile"
         post "uploadthesis"
         post "uploadstudy"
      end
    end
    resources :courses do
       collection do
         get "csv_import"
#         post "csv_import"
#         get "uploadfile"
         post "uploadfile"
       end
    end
    resources :semesters  do
       collection do
         get "csv_import"
        # post "csv_import"
#         get "uploadfile"
         post "uploadfile"
       end
    end
    resources :financial_aids
    resources :milestones do
       collection do
        post "uploadfile"
       end
    end
    resources :reports
    resources :student_semesters do
       collection do
       #  get "uploadfile"
         post "uploadfile"
       end
    end
    resources :student_courses
    resources :semester_courses
    resources :ms_courses do
       collection do
        post "uploadfile"
       end
    end
    resources :independent_studies do
       collection do
        post "uploadfile"
       end
    end

    resources :projectconfs
  end

  match '*roomdetails/:id/roomdetails' => 'inventory/roomdetails#routing'
  match '*inventories/:id/inventories' => 'inventory/inventories#routing'
  match '*tassistants/:id/tassistants' => 'inventory/tassistants#routing'
  match '*researchassistants/:id/researchassistants' => 'inventory/researchassistants#routing'
  match '*astaffs/:id/astaffs' => 'inventory/astaffs#routing'
  match '*ustudents/:id/ustudents' => 'inventory/ustudents#routing'
  match 'inventory/inventories/populate_locations' => 'inventory/inventories#populate_locations'
  match 'inventory/tacourses/populate_courses' => 'inventory/tacourses#populate_courses'
  match 'inventory/inventories/populate_inventory_allocation' => 'inventory/inventories#populate_inventory_allocation'
  
  namespace :inventory do
    resources :inventories do
      collection do
        
#        post "edit"
#        get "edit"
#        post "update"

       post "popuphistory"
       get  "popuphistory"

       post "popupindexhistory"
       get  "popupindexhistory"

       post "add_ownership_history"
       get  "add_ownership_history"


       post "add_indexownership_history"
       get  "add_indexownership_history"

       get  "csv_import"
       post "csv_import"

       get  "data_import"
       post "data_import"

       get  "inventory_allocation"
       post "inventory_allocation"

       get  "inventory_allocation_edit"
       post "inventory_allocation_edit"

       get  "configuration"
       post "configuration"

       get  "testt"
       post "testt"
      end
    end
    resources :locationreports
    resources :inventoryreports do
       collection do
         get "invallocation"
         get "invhistory"
         get "invtype"
       end
     end
    resources :lcds do
    collection do
         get "index"
         post "index"
     end
    end
    resources :cpus
    resources :scanners
    resources :printers do
    collection do
         post "new"
     end
    end
    resources :locations
    resources :ustudents
    resources :astaffs
    resources :tacourses
    resources :tassistants do
      collection do
        get "csv_import"
        post "csv_import"
#      get "index"
#      get "new"
#      post "edit"
#      get "edit"
#      post "update"
      end
    end
    
    resources :researchassistants do
      collection do
#      get "index"
#      get "new"
#      post "edit"
#      get "edit"
#      post "update"
      end
    end
     resources :rareports do
       
     end
     resources :tareports do

     end
#      resources :teacherassistants do
#      get "index"
#      get "new"
#      post "create"
#      get "new"
#    end
resources :roomdetails do
   collection do
       get "index"
       post "create"
#        post "edit"
#        get "edit"
#        post "update"
      post "map_room"
       get "map_room"
        post "newmap"
       get "newmap"
       post "maploc"
       post "popupassignloc"
       get "popupassignloc"
       get "assignlocation"
       post "assignlocation"
    end
   end

  end
  #match '*a', :to => 'errors#routing'
#


  # The priority is based upon order of creation:
  # first created -> highest priority.
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
