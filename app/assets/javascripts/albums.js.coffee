# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$(".albumContent a").click (e) ->
	  e.preventDefault()
	  lnk = $(this).attr('href') #+ '/images.json'
	  $("#imageContent").hide()
	  $("#imageContent").load lnk + " .thumbnailContainer", ->
	  	$(this).fadeIn('slow')
	  return