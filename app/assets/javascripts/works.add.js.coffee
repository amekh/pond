
pondApp = angular.module('pondApp')

pondApp.controller "workAddCtrl", ($scope, $http) ->
  return

$ ->
  
  $(".add-work").on("click", (e)->
    $(".work-form").fadeIn()
    return)

  $(".cancel-work-btn").on("click", (e)->
    $(".work-form").fadeOut()
    resetAddWorkForm()
    return)

  $(".add-work-btn").on("click", (e)->
    works = {
      title: $("#work-title-input").val(),
      time: $("#work-time-select").val(),
      contents: $("#work-contents-textarea").val(),
    }

    addWork(works)

    $(".work-form").fadeOut()
    resetAddWorkForm()
    return)

  resetAddWorkForm = ()->
    $("#work-title-input").val("")
    $("#work-time-select").val("1.0")
    $("#work-contents-textarea").val("")

  addWork = (works)->
    console.log(works);
    dom = '<li class="work">' +
      '<div class="content-cell-left">' +
  	    '<div class="content-title">' +
	        '<span>'+works.title+':</span>' +
	        '<span>'+works.title+'</span>' +
	        '<span class="detail-btn-wrapper" ng-click="toggleContentDetail($index)">' +
		        '<a href="" class="detail-btn">…</a>' +
  	      '</span>' +
	      '</div>' +
  	    '<div class="work-times">' +
	        '<ul>' +
		        '<li>作業時間: '+works.time+'h</li>' +
	        '</ul>' +
  	    '</div>' +
  	  '</div> ' +
  	  '<div class="content-detail" id="content-detail{{ $index }}">'+works.contents+'</div>' +
	    '</li>'

    $("#work-group").append(dom)
    return


