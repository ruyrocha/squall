module Squall
  # OnApp AutobackupPreset
  class AutobackupPreset < Base
    # Public: List available autobackup presets
    #
    # Returns an Array
    def list
      response = request(:get, "/autobackup_presets.json")
      response.collect { |c| c['autobackup_template'] }
    end

    # Public: Updates an existing autobackup preset
    #
    # id      - ID of the autobackup preset
    # options - Params for the autobackup preset
    #   :duration - String number to specify how often a backup should be taken
    #   :enabled  - Boolean value. Set true if autobackup preset is enabled,
    #               otherwise set false
    #
    # Returns a Hash.
    def edit(id, options = {})
      request(:put, "/autobackup_presets/#{id}.json", default_params(options))
    end

    # Public: Retrieves autobackup preset info
    #
    # id - The id of the autobackup preset
    #
    # Returns an Array
    def show(id)
      response = request(:get, "/autobackup_presets/#{id}.json")
      response.collect { |c| c['autobackup_template'] }
    end
  end
end
