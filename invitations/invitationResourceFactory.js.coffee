# TODO: Inject resource urls from a configuration
invitationResourceFactory = ($resource) -> $resource '/invitations/:id', {id: '@id'}, {update: {method: 'PUT'}}

# TODO: Find a better way to export dependencies
window.igniite.invitationResourceFactory = invitationResourceFactory