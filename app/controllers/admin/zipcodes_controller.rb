class Admin::ZipcodesController < Admin::BaseController
  resource_controller
  
  belongs_to :country
  before_filter :load_data
  
  index.response do |wants|
    wants.html
    wants.js do
      render :partial => 'zipcode_list.html.erb'
    end
  end
  
  create.wants.html { redirect_to admin_country_zipcodes_url(@country) } 
  update.wants.html { redirect_to admin_country_zipcodes_url(@country) } 

  private 
  
    def collection 
      @collection ||= end_of_association_chain.order_by_code 
    end  
    
    def load_data
      @countries = Country.order_by_name
    end
end
