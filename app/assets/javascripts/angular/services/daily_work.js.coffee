angular.module('pondApp')
.factory("DailyWork", ($resource, API_VERSION, API_DAILY_WORKS) ->
  console.log("/"+API_VERSION+"/"+API_DAILY_WORKS+"/:Id")
  return $resource("/"+API_VERSION+"/"+API_DAILY_WORKS+"/:id", {id: "@id" }, {}))
