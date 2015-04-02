#= require angular
#= require angular-animate
#= require invitations/invitationModule
#= require invitations/inviteToggleDirective/inviteToggleDirectiveModule
#= require_directory .

placeEventListDirectiveModule = angular.module 'placeEventListDirectiveModule', ['ngAnimate',
                                                                                 'invitationModule'
                                                                                 'inviteToggleDirectiveModule']
  .constant 'PlaceEventModel', window.igniite.PlaceEventModel
  .service 'placeEventModelFactory', ['PlaceEventModel',
                                     'invitationSaver',
                                     window.igniite.InvitationModelFactory]
  .directive 'igPlaceEventList', ['invitationConstants',
                                       window.igniite.placeEventListDirectiveFactory]

# TODO: Find a better way to export dependencies
window.igniite.placeEventListDirectiveModule = placeEventListDirectiveModule