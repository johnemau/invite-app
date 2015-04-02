#= require angular
#= require angular-animate
#= require invitations/invitationModule
#= require_directory .

userEventListDirectiveModule = angular.module 'userEventListDirectiveModule', ['ngAnimate', 'invitationModule']
  .constant 'UserEventModel', window.igniite.UserEventModel
  .service 'userEventModelFactory', ['UserEventModel',
                                     'invitationSaver',
                                     window.igniite.InvitationModelFactory]
  .directive 'igUserEventList', ['invitationConstants',
                                       window.igniite.userEventListDirectiveFactory]

# TODO: Find a better way to export dependencies
window.igniite.userEventListDirectiveModule = userEventListDirectiveModule