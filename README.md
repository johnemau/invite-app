# invite-app

A collection of front-end coffee script and erb templates showcasing work done for [igniite.com](http://igniite.com).

## Example angular controller for the [user homepage](invite-app/homePage/homePageCtrl.js.coffee)
fetching data from RESTful web service and placing on the scope
```coffee
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
```

## Example angular directive for a [user event list](invite-app/invitations/userEventListDirective/userEventListDirectiveFactory.js.coffee.erb)
users may remove events from the list by clicking a _remove_ button
```coffee
#= require underscore
#= depend_on_asset "invitations/userEventListDirective/templates/user-event-list.html"

userEventListDirectiveFactory = (constants) ->
  listCrtl = ($scope) ->
    $scope.isAttending = (invite) ->
        invite.status is constants.ATTENDING

    $scope.removeInvite = (invite) ->
        invite.status = constants.NOT_ATTENDING
        invite.saveStatus()

    $scope.noAttendingInvites = ->
        _.every @eventInvites, (invite) -> invite.status is constants.NOT_ATTENDING
  restrict: 'E'
  scope:
    eventInvites: '='
  controller: ['$scope', listCrtl]
  # TODO: Inject template url
  templateUrl: '<%= asset_path('invitations/userEventListDirective/templates/user-event-list.html') %>'

# TODO: Find a better way to export dependencies
window.igniite.userEventListDirectiveFactory = userEventListDirectiveFactory
```

## Example angular directive for an [invitation button](invite-app/invitations/inviteToggleDirective/inviteToggleDirectiveFactory.js.coffee.erb)
the button's actions are defined as methods on the $scope
```coffee
#= depend_on_asset "invitations/inviteToggleDirective/templates/invite-toggle.html"
#= depend_on_asset "invitations/inviteToggleDirective/templates/confirm-modal.html"

# TODO: Inject template url
inviteTemplateUrl = '<%= asset_path('invitations/inviteToggleDirective/templates/invite-toggle.html') %>'
modalTemplateUrl = '<%= asset_path('invitations/inviteToggleDirective/templates/confirm-modal.html') %>'

inviteToggleDirectiveFactory = ($modal, constants, buttonTextProvider, invitationSaver) ->
    ctrl = ($scope) ->
        # initialize scope models
        $scope.isAttending = ->
            @invite? and @invite.status is constants.ATTENDING

        # Update button text based on status
        $scope.$watch 'invite.status', (status) ->
            $scope.buttonText = buttonTextProvider.get status

        saveStatusTo = (newStatus) =>
            $scope.invite.status = newStatus
            invitationSaver.save $scope.invite

        confirmNotAttending = ->
            $modal.open(templateUrl: modalTemplateUrl, size: 'sm')
            .result.then -> saveStatusTo constants.NOT_ATTENDING

        $scope.toggleStatus = ->
            if @isAttending()
            then confirmNotAttending()
            else saveStatusTo constants.ATTENDING
    restrict: 'A'
    replace: true
    scope:
        invite: '='
    controller: ['$scope', ctrl]
    templateUrl: inviteTemplateUrl

# TODO: Find a better way to export dependencies
window.igniite.inviteToggleDirectiveFactory = inviteToggleDirectiveFactory
```

