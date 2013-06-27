module Squall
  # OnApp Alert
  class Alert < Base
    # Public: List alerts on Zombie disks, data stores, VMs and transactions
    #
    # Returns an Array
    def list
      response = request(:get, "/alerts.json")
      response.collect { |r| r['alerts'] }
    end
  end
end


