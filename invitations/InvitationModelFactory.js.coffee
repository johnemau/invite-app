class InvitationModelFactory
  constructor: (@Model, @inviteSaver) ->
  create: (invite) =>
    new @Model @inviteSaver, invite

# TODO: Find a better way to export dependencies
window.igniite.InvitationModelFactory = InvitationModelFactory