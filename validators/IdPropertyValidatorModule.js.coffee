#= require angular
#= require_directory .

IdPropertyValidatorModule = angular.module 'IdPropertyValidatorModule', []
  .constant 'isValidId', window.igniite.isValidId
  .service 'idPropertyValidator', ['isValidId', window.igniite.IdPropertyValidator]

# TODO: Find a better way to export dependencies
window.igniite.IdPropertyValidatorModule = IdPropertyValidatorModule