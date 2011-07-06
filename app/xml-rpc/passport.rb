namespace :passport do
  
  help "List users by substring"
  
  signature :array, :string
  
  task :listUsers do |query|
    User.all(:conditions => ["`first_name` LIKE :query OR `last_name` LIKE :query OR `middle_name` LIKE :query OR `nickname` LIKE :query OR `email` LIKE :query", { :query => "%#{query}%" }]).collect do |user|
      [:id, :first_name, :middle_name, :last_name, :nickname, :email].inject({}) do |container, name|
        container[name] = user.try(name) || ""
        container
      end
    end
  end
  
  help "Set S4 user key for passport user"
  
  signature :boolean, :string, :string
  
  task :setUserKey do |id, key|
    user = User.find(id)
    user.s4_relation ||= user.build_s4_relation
    user.s4_relation.s4_key = key
    user.s4_relation.save
  end
  
end

namespace :futures do
  
  help "Insert new publication"
  
  signature :integer, :structure
  
  task :addPublication do |data|
    return 12345
  end
  
end