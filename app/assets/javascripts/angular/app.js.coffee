pondApp = angular.module('pondApp', ["ngResource"])

pondApp.config [
  "$httpProvider"
  ($httpProvider) ->
    $httpProvider.defaults.headers.common["Authorization"] =
    "Bearer e270db30f9197b39a763c4447d30aa2afc66620a9c70f58f7cc45cbf765c3c8e"
]
