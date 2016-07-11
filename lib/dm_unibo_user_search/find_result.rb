module DmUniboUserSearch
  class FindResult
    def initialize(h)
      @res = h
    end

    def find_state
      @res[:find_state]
    end

    def ok?
      find_state == "Ok"
    end

    def count
      @res[:count].to_i
    end

    def users
      return [] unless self.ok?
      found = @res[:values][:user_account_found]
      if found.is_a? Array
        found.map{|xml| User.new(xml)}
      else
        [User.new(found)]
      end
    end
  end
end


