module ExternalResourcesHelper
  def resources_as_options
    options = [['en première position', 1]]
    options.concat(ExternalResource.order(:rank).map { |er| ["après '#{er.name}'", er.rank + 1] })
  end
end
