#= require underscore

class PlaceEventModelMapper
  constructor: (@viewModelFactory) ->
  map: (invite, event) =>
    vm = @viewModelFactory.create invite
    vm.eventId = event.id
    vm.name = event.name
    vm.date = new Date event.start_time
    vm
  mapMany: (invites, events) =>
    results = []
    for event in events
      do (event) =>
        invite = _.findWhere invites, event_id: event.id
        results.push @map invite, event
    results

# TODO: Find a better way to export dependencies
window.igniite.PlaceEventModelMapper = PlaceEventModelMapper