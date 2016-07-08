module DmUniboUserSearch
  class User
    attr_reader :name, :sn, :employee_id, :id_anagrafica_unica, :birthday, :cf, :upn, :sam_account_name
    
    def initialize(h)
      @id_anagrafica_unica = h[:user_id].to_i
      @upn                 = h[:user_principal_name].downcase
      @name                = h[:given_name]
      @sn                  = h[:family_name]
      @sam_account_name    = h[:sam_account_name]
      @employee_id         = h[:employee_id]
      @cf                  = h[:national_pin]
      @birthday            = h[:birthday]
    end

    def surname
      @sn
    end

    def email
      @upn
    end
  end
end

