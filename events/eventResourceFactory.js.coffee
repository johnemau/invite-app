# TODO: Inject resource urls from a configuration
eventResourceFactory = ($resource) -> $resource '/events/:id.json', {id: '@id'}

# TODO: Find a better way to export dependencies
window.igniite.eventResourceFactory = eventResourceFactory