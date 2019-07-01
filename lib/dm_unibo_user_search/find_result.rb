module DmUniboUserSearch
  class FindResult
    def initialize(h, select_proc = nil)
      @res = h
      @select_proc = select_proc
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
      res = if found.is_a? Array
        found.map{|xml| User.new(xml)}
      else
        [User.new(found)]
      end
      @select_proc ? res.select{|u| @select_proc.call(u)} : res
    end
  end
end

# {:find_state=>"Ok", :count=>"6", :values=>{:user_account_found=>[{:user_principal_name=>"valen.montemmaggiori@studio.unibo.it", :authentication_state=>"NotDefined", :user_state=>"MustChangePassword", :sam_account_name=>"valen.montemmaggiori", :national_pin=>"MNTVNT82H66H294M", :given_name=>"Valentina", :family_name=>"Montemaggiori", :gender=>"F", :birthday=>#<DateTime: 1982-06-26T00:00:00+02:00 ((2445146j,79200s,0n),+7200s,2299161j)>, :birthplace=>"Rimini;RN;IT", :employee_id=>"0000155695", :user_id=>"418691", :unibo_id=>"fa3e6059-19d8-415a-9649-f9ff850fa188"}, {:user_principal_name=>"valero.montesdeoca@studio.unibo.it", :authentication_state=>"NotDefined", :user_state=>"MustChangePassword", :sam_account_name=>"valero.montesdeoca", :national_pin=>"MNTVRJ70H62Z131A", :given_name=>"Valero Juana Maria", :family_name=>"Montes De Oca", :gender=>"F", :birthday=>#<DateTime: 1970-06-22T00:00:00+02:00 ((2440759j,79200s,0n),+7200s,2299161j)>, :birthplace=>"Santa Cruz De Tenerife;ES", :employee_id=>"1308010437", :user_id=>"64978", :unibo_id=>"033763f3-8de3-40f2-a1bb-d7dec2d2f734"}, {:user_principal_name=>"valentin.montevecchi@studio.unibo.it", :authentication_state=>"NotDefined", :user_state=>"MustChangePassword", :sam_account_name=>"valentin.montevecchi", :national_pin=>"MNTVNT75P44A944V", :given_name=>"Valentina", :family_name=>"Montevecchi", :gender=>"F", :birthday=>#<DateTime: 1975-09-04T00:00:00+02:00 ((2442659j,79200s,0n),+7200s,2299161j)>, :birthplace=>"Bologna;BO;IT", :employee_id=>"5406000690", :user_id=>"149357", :unibo_id=>"2122274a-1947-4970-9680-98a5be20db5e"}, {:user_principal_name=>"valerio.monte@studio.unibo.it", :authentication_state=>"NotDefined", :user_state=>"MustChangePassword", :sam_account_name=>"valerio.monte", :national_pin=>"MNTVLR79M15D005G", :given_name=>"Valerio", :family_name=>"Monte", :gender=>nil, :birthday=>#<DateTime: 0001-01-01T00:00:00+01:00 ((1721423j,82800s,0n),+3600s,2299161j)>, :birthplace=>nil, :employee_id=>nil, :user_id=>nil, :unibo_id=>"717cbd57-2c38-408c-bb1b-e1690a1e13ef"}, {:user_principal_name=>"valeria.montesi3@unibo.it", :authentication_state=>"NotDefined", :user_state=>"MustChangePassword", :sam_account_name=>"valeria.montesi3", :national_pin=>"MNTVLR77D68A271Z", :given_name=>"Valeria", :family_name=>"Montesi", :gender=>"F", :birthday=>#<DateTime: 1977-04-28T00:00:00+02:00 ((2443261j,79200s,0n),+7200s,2299161j)>, :birthplace=>"Ancona;AN;IT", :employee_id=>"35105", :user_id=>"184360", :unibo_id=>"52075e74-e675-4c02-b920-012d55241539"}, {:user_principal_name=>"valeria.montesi4@unibo.it", :authentication_state=>"NotDefined", :user_state=>"MustChangePassword", :sam_account_name=>"valeria.montesi4", :national_pin=>"MNTVLR79C63L049M", :given_name=>"Valeria", :family_name=>"Montesi", :gender=>"F", :birthday=>#<DateTime: 1979-03-23T00:00:00+01:00 ((2443955j,82800s,0n),+3600s,2299161j)>, :birthplace=>"Taranto;TA;IT", :employee_id=>"42094", :user_id=>"364089", :unibo_id=>"db2da4b6-d645-467b-a3f2-fe0b015730f5"}]}}
