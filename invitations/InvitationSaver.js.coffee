class InvitationSaver
  constructor: (@isValidId) ->
  save: (invite) ->
    # only invites created on the server will have an id
    if @isValidId invite.id then invite.$update() else invite.$save()

# TODO: Find a better way to export dependencies
window.igniite.InvitationSaver = InvitationSaver