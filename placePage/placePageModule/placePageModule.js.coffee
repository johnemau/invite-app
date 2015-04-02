#= require angular
#= require angular-resource
#= require angular-animate
#= require invitations/invitationResourceFactory
#= require events/eventResourceFactory
#= require places/placeResourceFactory
#= require invitations/placeEventListDirective/placeEventListDirectiveModule
#= require_directory .

placePageModule = angular.module 'placePageModule', ['ngResource',
                                                     'ngAnimate',
                                                     'placeEventListDirectiveModule']
  .factory 'eventResourceFactory', ['$resource', window.igniite.eventResourceFactory]
  .factory 'invitationResource', ['$resource', window.igniite.invitationResourceFactory]
  .service 'placeEventModelMapper', ['placeEventModelFactory', window.igniite.PlaceEventModelMapper]
  .controller 'placePageCtrl', ['$scope',
                                '$q',
                                'invitationConstants',
                                'eventResourceFactory',
                                'invitationResource',
                                'placeEventModelMapper',
                                window.igniite.placePageCtrl]

# TODO: Find a better way to export dependencies
window.igniite.placePageModule = placePageModule