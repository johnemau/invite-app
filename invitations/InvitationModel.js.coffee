class InvitationModel
  constructor: (@inviteSaver, @invite) ->
    @status = invite.status if invite?
  saveStatus: =>
    @invite.status = @status
    @inviteSaver.save @invite

# TODO: Find a better way to export dependencies
window.igniite.InvitationModel = InvitationModel