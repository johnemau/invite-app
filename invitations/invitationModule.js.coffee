#= require angular
#= require validators/IdPropertyValidatorModule
#= require_directory .

invitationModule = angular.module 'invitationModule', ['IdPropertyValidatorModule']
  .constant 'invitationConstants', window.igniite.invitationConstants
  .constant 'InvitationModel', window.igniite.InvitationModel
  .service 'invitationModelFactory', ['InvitationModel',
                                       'invitationSaver',
                                       window.igniite.InvitationModelFactory]

  .service 'invitationSaver', ['isValidId', window.igniite.InvitationSaver]

# TODO: Find a better way to export dependencies
window.igniite.invitationModule = invitationModule