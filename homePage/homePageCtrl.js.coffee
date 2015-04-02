#= jquery
#= require underscore

homePageCtrl = ($scope,
                invitationResource,
                eventResource,
                placeResource,
                userEventModelMapper) ->
  # Using jQuery for data injection, possibly switch to rails rendered services
  # http://spin.atomicobject.com/2013/11/22/pass-rails-data-angularjs/
  userId = jQuery('[data-ng-controller="homePageCtrl"]').data('user-id')

  # TODO: Error handling
  invites = invitationResource.query {user_id: userId}, ->
    $scope.invites = invites

  $scope.$watchCollection 'invites', (invites) ->
    if invites?
      events = eventResource.query {'id[]': _.pluck invites, 'event_id'}, ->
        $scope.events = events

  $scope.$watchCollection 'events', (events) ->
    if events?
      places = placeResource.query  {'id[]': _.pluck events, 'place_id'}, ->
        $scope.places = places

  # TODO: use $watchGroup when angularjs-rails supports latest version
  $scope.$watch 'places', (places) ->
    if places?
      $scope.eventInvites = userEventModelMapper.mapMany $scope.invites, $scope.events, places

# TODO: Find a better way to export dependencies
window.igniite.homePageCtrl = homePageCtrl