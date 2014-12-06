# APIを叩く
class window.ApiClient

  BASE_URL = "http://localhost:3000/"
  VERSION = "v1"
  _options = {}
  _$http = {}

  constructor: (options, $http) ->

    defaults = {
      url : ""
      token : ""
      response: -> 
    }

    _options = $.extend({}, defaults, options)
    _$http = $http

  # requestを送る
  _request = ->
    _$http.get(_options.url).success((data) ->
      _options.response(data)
      return
    )

    return

  # requestのベースとなるUriを取得する
  # @return [string] ApiのrequestUri
  _getRequestUrl = ->
    return BASE_URL + VERSION + "/"

  # IDを元に、月間実績を取得する
  # @param [int] id UniqKey
  requestByIdInMonthlyRecord: (id) ->
    _options.url = _getRequestUrl() + "monthly_records/" + id
    _request()
    return

  requestByDateDailyWorks: (id) ->
    _options.url = _getRequestUrl() + "daily_works/" + id;
    _request();
    return
