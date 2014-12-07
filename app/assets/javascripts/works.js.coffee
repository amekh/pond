
pondApp = angular.module('pondApp', [])

pondApp.config [
  "$httpProvider"
  ($httpProvider) ->
    $httpProvider.defaults.headers.common["Authorization"] =
    "Bearer 44345589372a511112a4c89ce8e24f91961506346d7aaec466a033779a3d7c63"
]

pondApp.controller "worksCtrl", ($scope, $http) ->
  $scope.record = [0,0];
  $scope.toggleContentDetail = (index) ->
    $("#content-detail" + index).toggle()
    return
    
  dailyWorksApiClient = new ApiClient
    response: (json) ->
      console.log(json)        
      $scope.works = json
      return
    ,$http

  dailyWorksApiClient.requestByDateDailyWorks(4)
  return
