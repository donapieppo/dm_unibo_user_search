module DmUniboUserSearch
  class Client
    def initialize(wsdl_file = "/etc/dm_unibo_user_search/DSASearch.wsdl.xml")
      @savon_client = Savon.client do
        wsdl wsdl_file
        ssl_verify_mode :none
        basic_auth [ENV["DSA_SEARCH_USERNAME"], ENV["DSA_SEARCH_PASSWORD"]]
        convert_request_keys_to :camelcase
        log_level :warn
        # log_level :debug
        # pretty_print_xml true
      end
    end

    def find_user(str, select_proc = nil)
      return [] unless @savon_client # waiting for new implementations

      # {:find_state=>"Ok", :count=>"1", :values=>{:user_account_found=>{:user_principal_name=>"name.Surname@unibo.it", :authentication_state=>"NotDefined", :user_state=>"MustChangePassword", :sam_account_name=>"name.Surname", :national_pin=>"NNAPTR00A25F444A", :given_name=>"name", :family_name=>"Surname", :gender=>"M", :birthday=>#<DateTime: 1900-01-01T00:00:00+01:00 ((2440611j,82800s,0n),+3600s,2299161j)>, :birthplace=>"Milano;MI;IT", :employee_id=>"11111", :user_id=>"1111111", :unibo_id=>"111111111-111-1111-af3d-b1d229ef6b15"}}}
      res = @savon_client.call(:find_user) do
        message search_string: str
      end.body[:find_user_response][:find_user_result]
      FindResult.new(res, select_proc)
    end

    def show_parms
      @savon_client.call(:get_user_parm) do
        message({})
      end.body
    end

    def operations
      @savon_client.operations
    end
  end
end
