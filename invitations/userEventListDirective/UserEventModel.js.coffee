#= require invitations/InvitationModel

# TODO: use mixins in place of inheritance
class UserEventModel extends window.igniite.InvitationModel
  constructor: (inviteSaver, invite) ->
    super inviteSaver, invite
    @eventId = -1
    @eventName = ''
    @date = new Date()
    @tags = ''
    @placeId = -1
    @placeName = ''
    @color = ''

# TODO: Find a better way to export dependencies
window.igniite.UserEventModel = UserEventModel