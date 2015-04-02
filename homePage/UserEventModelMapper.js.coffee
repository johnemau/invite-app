#= require underscore

class UserEventModelMapper
  constructor: (@viewModelFactory) ->
  getColor: ->
    _.sample ['ff0000,128/000,255', '666666,128/AC54AA,255', '6DD0F2,128/F59ABE,255']
  map: (invite, event, place) =>
    vm = @viewModelFactory.create invite
    vm.eventId = event.id
    vm.eventName = event.name
    vm.date = new Date event.start_time
    vm.tags = event.tags.split ' '
    vm.placeId = place.id
    vm.placeName = place.name
    vm.color = @getColor()
    vm
  mapMany: (invites, events, places) =>
    results = []
    for invite in invites
      do (invite) =>
        event = _.findWhere events, id: invite.event_id
        place = _.findWhere places, id: event.place_id
        results.push @map invite, event, place
    results

# TODO: Find a better way to export dependencies
window.igniite.UserEventModelMapper = UserEventModelMapper