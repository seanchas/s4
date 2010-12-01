require 'digest'

module Passport
  module Cyphers
    
    class SHA1
      
      class << self
        
        def token
          digest(Time.now, (1..10).map { rand.to_s })
        end
        
        def digest(*args)
          Digest::SHA1.hexdigest(args.flatten.join("::"))
        end
        
      end
      
    end
    
  end
end
