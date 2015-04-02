#= require invitations/InvitationModel

# TODO: use mixins in place of inheritance
class PlaceEventModel extends window.igniite.InvitationModel
  constructor: (inviteSaver, invite) ->
    super inviteSaver, invite
    @eventId = -1
    @name = ''
    @date = new Date()
    @tags = ''
    @color = ''

# TODO: Find a better way to export dependencies
window.igniite.PlaceEventModel = PlaceEventModel