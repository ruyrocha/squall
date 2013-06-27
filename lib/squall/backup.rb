module Squall
  # OnApp Backup
  class Backup < Base
    # Public: List VM backups
    #
    # id - ID of the virtual machine
    #
    # Returns an Array
    def list(id)
      response = request(:get, "/virtual_machines/#{id}/backups.json")
      response.collect { |i| i['backup'] }
    end

    # Public: List Disk backups
    #
    # id - ID of the virtual machine
    # disk_id - ID of the disk backed up
    #
    # Returns an Array
    def list(id, disk_id)
      response = request(:get, "/virtual_machines/#{id}/disks/#{disk_id}/backups.json")
      response.collect { |i| i['backup'] }
    end

    # Public: Creates a backup/snapshot of all VM disks
    #
    # id - ID of the virtual machine
    #
    # Returns a Hash
    def create(id)
      request(:post, "/virtual_machines/#{id}/backups.json")
    end

    # Public: Creates a new disk backup
    #
    # disk_id - ID of the disk backed up
    #
    # Returns a Hash
    def create_disk_backup(disk_id)
      request(:post, "/settings/disks/#{disk_id}/backups.json")
    end

    # Public: Convert a backup into a custom template
    #
    # backup_id - ID of the backup
    #
    # options - Params for the backup
    #   :label - String template label
    #   :min_disk_size - String minimum disk size required in GB
    #   :min_memory_size - String minimum RAM required for the template
    #
    # Returns a Hash
    def convert(backup_id, options = {})
      request(:post, "/backups/#{backup_id}/convert.json", default_params(options))
    end

    # Public: Delete a disk backup
    #
    # backup_id - ID of the backup
    #
    # Returns a Hash
    def delete(backup_id)
      request(:delete, "/backups/#{backup_id}.json")
    end

    # Public: Restore a disk from a backup
    #
    # backup_id - ID of the backup
    #
    # Returns a Hash
    def delete(backup_id)
      request(:post, "/backups/#{backup_id}/restore.json")
    end
  end
end
