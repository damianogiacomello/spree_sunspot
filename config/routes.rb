Rails.application.routes.draw do
  match "/q" => "home#filter"
  match "/products/q" => "products#filter"
  match "/:id/q" => "taxons#filter", :constraints => { :id => Regexp.new('(' + Taxon.all.collect { |b| b.linkname rescue b.permalink }.join('|') + ')') }
end
