# TODO: Kill this validator
class InvitationValidator
  constructor: (@idPropertyValidator) ->
  isValid: (invite) ->
    invite? and @idPropertyValidator.isValid invite, ['user_id', 'event_id']

# TODO: Find a better way to export dependencies
window.igniite.InvitationValidator = InvitationValidator