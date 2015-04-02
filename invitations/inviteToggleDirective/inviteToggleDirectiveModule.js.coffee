#= require angular
#= require angular-animate
#= require angular-ui-bootstrap-tpls
#= require validators/IdPropertyValidatorModule
#= require invitations/invitationModule
#= require_directory .

inviteToggleDirectiveModule = angular.module 'inviteToggleDirectiveModule', ['ngAnimate', 'ui.bootstrap', 'invitationModule', 'IdPropertyValidatorModule']
  .constant 'invitationConstants', window.igniite.invitationConstants
  .service 'buttonTextProvider', ['invitationConstants', window.igniite.ButtonTextProvider]
  .service 'invitationValidator', ['idPropertyValidator', window.igniite.InvitationValidator]
  .directive 'igInviteToggle', ['$modal',
                                'invitationConstants',
                                'buttonTextProvider',
                                'invitationSaver', window.igniite.inviteToggleDirectiveFactory]

# TODO: Find a better way to export dependencies
window.igniite.inviteToggleDirectiveModule = inviteToggleDirectiveModule