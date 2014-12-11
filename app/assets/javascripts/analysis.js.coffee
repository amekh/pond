
pondApp = angular.module('pondApp')

pondApp.controller "recordCtrl", ($scope, $http) ->
  $scope.record = [0,0];
  monthlyRecordApiClient = new ApiClient
    url:"monthly_records/4"
    response: (json) ->
      console.log(json)
      $scope.record = json
      return
    ,$http

  monthlyRecordApiClient.requestByIdInMonthlyRecord(4)
  return

pondApp.filter "currency", [
  "$filter"
  ($filter) ->
    return (input) ->
      input = parseFloat(input)
      if input % 1 is 0
        input = input.toFixed(0)
      else
        input = input.toFixed(2)
      "¥" + input.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
]


