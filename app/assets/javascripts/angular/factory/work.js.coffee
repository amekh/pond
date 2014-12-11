app = angular.module('pondApp')

app.factory('Works', () ->

  works = []

  return {

    add: (work) ->
      works.push(work);
      return

    getWorks: () ->
      works
  }
)
