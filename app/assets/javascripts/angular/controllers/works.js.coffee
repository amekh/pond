app = angular.module('pondApp')

app.controller("worksCtrl", ["DailyWork", (DailyWork) ->
  this.record = [0,0];
  this.toggleContentDetail = (index) ->
    $("#content-detail" + index).toggle()
    return

  this.works = DailyWork.get({},{'id': 1})
  return])

app.controller("workAddCtrl", ($http, Works) ->
  this.works = Works;
  this.toggleContentDetail = (index) ->
    $("#content-detail" + index).toggle()
    return

  this.addWork = () ->
    work = {
      title: $("#work-title-input").val(),
      time: $("#work-time-select").val(),
      contents: $("#work-contents-textarea").val(),
    }

    Works.add(work);

    $(".work-form").fadeOut()
    resetAddWorkForm()
    return
  
  return)

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
