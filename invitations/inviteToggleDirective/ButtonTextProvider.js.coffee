class ButtonTextProvider
  constructor: (@invitationConstants) ->
  get: (status) ->
    # TODO: Inject localization service and use keys
    if status is @invitationConstants.ATTENDING then "Attending" else "Attend?"

# TODO: Find a better way to export dependencies
window.igniite.ButtonTextProvider = ButtonTextProvider