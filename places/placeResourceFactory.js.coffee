# TODO: Inject resource urls from a configuration
placeResourceFactory = ($resource) -> $resource '/places/:id.json', {id: '@id'}

# TODO: Find a better way to export dependencies
window.igniite.placeResourceFactory = placeResourceFactory