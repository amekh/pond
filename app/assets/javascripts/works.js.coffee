
pondApp = angular.module('pondApp')

pondApp.config [
  "$httpProvider"
  ($httpProvider) ->
    $httpProvider.defaults.headers.common["Authorization"] =
    "Bearer a476d9ceb1f7e2cdfb28be355367908b2ea1ea6326a9c5faf347599b0e73a055"
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
