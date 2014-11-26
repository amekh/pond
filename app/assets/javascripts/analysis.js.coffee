$ ->
  pondApp = angular.module('pondApp', [])

  pondApp.config [
    "$httpProvider"
    ($httpProvider) ->
      $httpProvider.defaults.headers.common["Authorization"] =
      "Bearer eb268f608f9c4422aea94cf0ce54d23bacceaf390b23276bf6d53ec30ac62228"
  ]

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
  
  return
