#= jquery

eventPageCtrl = ($scope, constants, invitationResource, invitationValidator, isValidId) ->
  # Using jQuery for data injection, possibly switch to rails rendered services
  # http://spin.atomicobject.com/2013/11/22/pass-rails-data-angularjs/
  dataObj = jQuery '[data-ng-controller="eventPageCtrl"]'
  userId  = dataObj.data 'user-id'
  eventId = dataObj.data 'event-id'
  inviteId = dataObj.data 'invite-id'

  # initialize scope models
  $scope.invite = {}
  $scope.validator = invitationValidator

  # Attach invites to scope
  $scope.invite =
    if isValidId inviteId
    then invitationResource.get id: inviteId
    else new invitationResource
      user_id: userId
      event_id: eventId
      status: constants.NOT_ATTENDING

# TODO: Find a better way to export dependencies
window.igniite.eventPageCtrl = eventPageCtrl