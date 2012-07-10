namespace :spree_sunspot do
  desc "Reindex all products"
  task :reindex => :environment do
    Product.remove_all_from_index!
    Product.reindex
    Sunspot.commit
  end
end
