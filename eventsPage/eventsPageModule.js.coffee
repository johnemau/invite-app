#= require angular
#= require angular-resource
#= require invitations/inviteToggleDirective/inviteToggleDirectiveModule
#= require invitations/invitationResourceFactory
#= require eventsPage/eventsPageCtrl

eventsPageModule = angular.module 'eventsPageModule', ['ngResource', 'ngAnimate', 'inviteToggleDirectiveModule']
  .factory 'invitationResource', ['$resource', window.igniite.invitationResourceFactory]
  .controller 'eventsPageCtrl', ['$scope',
                                 'invitationConstants',
                                 'invitationResource',
                                 'invitationValidator', window.igniite.eventsPageCtrl]

# TODO: Find a better way to export dependencies
window.igniite.eventsPageModule = eventsPageModule