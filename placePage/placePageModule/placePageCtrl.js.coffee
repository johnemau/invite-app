#= jquery
#= require underscore

placePageCtrl = ($scope,
                 $q,
                 constants,
                 eventResource,
                 inviteResource,
                 placeEventModelMapper) ->
  # Using jQuery for data injection, possibly switch to rails rendered services
  # http://spin.atomicobject.com/2013/11/22/pass-rails-data-angularjs/
  dataObj = jQuery '[data-ng-controller="placePageCtrl"]'
  userId  = dataObj.data 'user-id'
  placeId = dataObj.data 'place-id'

  createInvite = (eventId) -> new inviteResource
    user_id: userId, place_id: placeId, event_id: eventId, status: constants.NOT_ATTENDING

  events = eventResource.query place_id: placeId

  if userId? # user must be logged in
    invites = inviteResource.query {user_id: userId}
    $q.all [events.$promise, invites.$promise]
      .then (results) ->
        events = results[0]
        invites = results[1]
        # fill in gap for missing invites...
        eventIds = _.pluck events, 'id'
        attendingEventIds = _.pluck invites, 'event_id'
        missingEventIds = _.difference eventIds, attendingEventIds
        missingInvites = _.map missingEventIds, createInvite
        allInvites = invites.concat missingInvites
        viewModels = placeEventModelMapper.mapMany allInvites, events
        $scope.events = _.object _.map viewModels, (vm) -> [vm.eventId, vm]
  else
    events.$promise.then (events) ->
      viewModels = placeEventModelMapper.mapMany [], events
      $scope.events = _.object _.map viewModels, (vm) -> [vm.eventId, vm]

# TODO: Find a better way to export dependencies
window.igniite.placePageCtrl = placePageCtrl