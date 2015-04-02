#= require angular
#= require angular-resource
#= require angular-animate
#= require invitations/userEventListDirective/userEventListDirectiveModule.js.coffee
#= require invitations/invitationResourceFactory
#= require events/eventResourceFactory.js.coffee
#= require places/placeResourceFactory.js.coffee

# TODO: move into sub directory and use require directory
#= require homePage/homePageCtrl
#= require homePage/UserEventModelMapper

homePageModule = angular.module 'homePageModule', ['ngResource', 'ngAnimate', 'userEventListDirectiveModule']
  .service 'userEventModelMapper', ['userEventModelFactory', window.igniite.UserEventModelMapper]
  .factory 'eventResourceFactory', ['$resource', window.igniite.eventResourceFactory]
  .factory 'placeResourceFactory', ['$resource', window.igniite.placeResourceFactory]
  .factory 'invitationResource', ['$resource', window.igniite.invitationResourceFactory]
  .controller 'homePageCtrl', ['$scope',
                               'invitationResource',
                               'eventResourceFactory',
                               'placeResourceFactory',
                               'userEventModelMapper', window.igniite.homePageCtrl]

# TODO: Find a better way to export dependencies
window.igniite.homePageModule = homePageModule