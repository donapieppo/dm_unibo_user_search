module DmUniboUserSearch
  class NoUser       < RuntimeError
    def to_s
      I18n.t 'dm_unibo_user_search.nouser'
    end
  end
  class TooManyUsers < RuntimeError
    def to_s
      I18n.t 'dm_unibo_user_search.too_many_users'
    end
  end
end

