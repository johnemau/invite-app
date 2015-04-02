#= jquery
#= require underscore

eventsPageCtrl = ($scope, constants, invitationResource, invitationValidator) ->
  # Using jQuery for data injection, possibly switch to rails rendered services
  # http://spin.atomicobject.com/2013/11/22/pass-rails-data-angularjs/
  dataObj = jQuery '[data-ng-controller="eventsPageCtrl"]'
  userId  = dataObj.data 'user-id'
  eventIds = dataObj.data 'event-ids'

  # initialize scope models
  $scope.invites = {}
  $scope.validator = invitationValidator

  createInvite = (eventId) -> new invitationResource
    user_id: userId, event_id: eventId, status: constants.NOT_ATTENDING

  # Attach invites to scope
  # TODO: Error handling
  invites = invitationResource.query {user_id: userId}, ->
    # Do some crazy array juggling to get all invites..
    attendingEventIds = _.pluck invites, 'event_id'
    missingEventIds = _.difference eventIds, attendingEventIds
    missingInvites = _.map missingEventIds, createInvite
    allInvites = invites.concat missingInvites
    # http://stackoverflow.com/questions/17802140
    $scope.invites = _.object _.map allInvites, (invite) -> [invite.event_id, invite]

# TODO: Find a better way to export dependencies
window.igniite.eventsPageCtrl = eventsPageCtrl