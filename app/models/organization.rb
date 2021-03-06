class Organization < ActiveRecord::Base
  belongs_to :parent, class_name:'Organization' 
  has_many :children, class_name:'Organization', foreign_key: 'parent_id'
  has_many :config_set_values
  
  def list_name
    "#{name}-#{city}"
  end

  
  def values_for(config_set)
    settings = config_set.default_values  
    current_org = self
    org_list = [ current_org ]
    while current_org.parent != nil 
      org_list << current_org.parent
      current_org = current_org.parent
    end    
    org_list.reverse.each do |org|
      ConfigSetValue.where(organization_id:org.id, config_set_id:config_set.id, status:[ConfigSetValue::STATUS_ENABLED,ConfigSetValue::STATUS_PENDING_DELETE]).each do |x|
         case x.config_set.config_type
           when 'list' 
             settings[x.key] ||= []   # defensive programming
             if x.value =~ /^-.*/ 
               settings[x.key].delete(x.value[1..-1])
             else
               settings[x.key] << x.value unless settings[x.key].member? x.value
             end
           else
             settings[x.key]=x.value
           end
      end
    end
    settings
  end
end
