
pondApp = angular.module('pondApp')

pondApp.controller "workAddCtrl", ($scope, $http) ->

  $scope.works = [];

  $scope.addWork = () ->
    work = {
      title: $("#work-title-input").val(),
      time: $("#work-time-select").val(),
      contents: $("#work-contents-textarea").val(),
    }

    $scope.works.push(work);

    $(".work-form").fadeOut()
    resetAddWorkForm()
    return
  
  return

$ ->
  
  $(".add-work").on("click", (e)->
    $(".work-form").fadeIn()
    return)

  $(".cancel-work-btn").on("click", (e)->
    $(".work-form").fadeOut()
    resetAddWorkForm()
    return)

resetAddWorkForm = ()->
  $("#work-title-input").val("")
  $("#work-time-select").val("1.0")
  $("#work-contents-textarea").val("")
  return



