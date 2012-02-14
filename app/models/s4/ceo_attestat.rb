module S4
  
  class CEO_Attestat < S4::Resource
    
    self.resource_type = :ceo_attestat

    def self.create_xml(rowset)
      resources = []
      cnt = 1
      
      rowset.collect do |row|
        properties = []
        properties << {:attrs => {:name => 'ceo.id', :ref_id => -1 * row.parent_id.to_i, :ref_resource => :ceo}, :value => -1 * row.parent_id.to_i}

        # qualification
        qualifications = Organizations::Attestatadd.qualification_select
        qualificationsRow = []
        qualificationsRow = row[:qualification][1..-2].split(",").collect!{|x| x.to_sym} if !row[:qualification].nil?

        qualifications.collect do |q|
          properties << {:attrs => {:name => :"activity_#{q.to_s}"}, :value => (qualificationsRow.index(q).nil? ? nil : 1)}
        end

        # activity
        activities = Organizations::Attestatadd.activity_select
        activitiesRow = []
        activitiesRow = row[:activity][1..-2].split(",").collect!{|x| x.to_sym} if !row[:activity].nil?
        activities.collect do |a|
          properties << {:attrs => {:name => :"qualification_#{a.to_s}"}, :value => (activitiesRow.index(a).nil? ? nil : 1)}
        end
        
        toParse = row.attributes.select {|i, k| !['id', 'qualification', 'parent_id', 'activity', 'display_activity'].include?(i)}
        toParse << ['id', "#{(-1 * cnt)}"]
        toParse.collect do |col, value|
          attrs = {:name => col}
          properties << {:attrs => attrs, :value => value}
        end

        cnt+=1
        resources << {:properties => properties}
      end

      S4::Card.build_xml('ceo_attestat', resources)
    end
  end
  
end
