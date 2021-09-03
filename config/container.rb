require 'dry-container'

Container = Dry::Container.new

Container.register(:item_repo, memoize: true) do
  Repos::ItemRepo.new(resolve(:rom))
end

Container.register(:lot_repo, memoize: true) do
  Repos::LotRepo.new(resolve(:rom))
end
