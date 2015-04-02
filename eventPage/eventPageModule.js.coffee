#= require angular
#= require angular-resource
#= require invitations/inviteToggleDirective/inviteToggleDirectiveModule
#= require invitations/invitationResourceFactory
#= require eventPage/eventPageCtrl
#= require validators/IdPropertyValidatorModule

eventPageModule = angular.module 'eventPageModule', ['ngResource', 'ngAnimate', 'inviteToggleDirectiveModule', 'IdPropertyValidatorModule']
  .factory 'invitationResource', ['$resource', window.igniite.invitationResourceFactory]
  .controller 'eventPageCtrl', ['$scope',
                                'invitationConstants',
                                'invitationResource',
                                'invitationValidator',
                                'isValidId', window.igniite.eventPageCtrl]

# TODO: Find a better way to export dependencies
window.igniite.eventPageModule = eventPageModule