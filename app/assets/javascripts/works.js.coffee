
pondApp = angular.module('pondApp', [])

pondApp.config [
  "$httpProvider"
  ($httpProvider) ->
    $httpProvider.defaults.headers.common["Authorization"] =
    "Bearer 6e0b819ca9e4f71dc81c301af37102231149d802226c7439629aaa080cd8c9cd"
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
