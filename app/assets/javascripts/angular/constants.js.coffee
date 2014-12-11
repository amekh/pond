#
# 定数定義ファイル
#

pondApp = angular.module('pondApp')

# APIのURI部
pondApp.constant("API_URI", 'http://localhost:3000')

# APIのVERSION
pondApp.constant("API_VERSION", 'v1')

#-------------------------
# APIのAction名リスト
#-------------------------
pondApp.constant("API_DAILY_WORKS", 'daily_works')
pondApp.constant("API_MONTHLY_RECORDS", 'monthly_records')
