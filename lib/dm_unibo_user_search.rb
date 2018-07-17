require "rails"
require "savon"
require "dm_unibo_user_search/errors"
require "dm_unibo_user_search/version"
require "dm_unibo_user_search/client"
require "dm_unibo_user_search/find_result"
require "dm_unibo_user_search/user"

module DmUniboUserSearch
  class Engine < Rails::Engine
  end
end
