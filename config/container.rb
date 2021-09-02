require 'dry-container'

Container = Dry::Container.new

Container.register(:item_repo) { Repos::ItemRepo.new(resolve(:rom)) }
