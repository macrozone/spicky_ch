zeroFill = (number, width) ->
	width -= number.toString().length
	if width > 0
		return new Array(width + (if /\./.test(number) then 2 else 1)).join('0') + number
	number + ''




Router.route "/", 
	template: "home"
	data: ->
		fotis: -> (index: i, src:"/spickifotis/image#{zeroFill i, 3}.jpg" for i in [1..16])


if Meteor.isClient 
	do setRandomImage = -> Session.set "currentFotiIndex",_.sample [1..16]
	Meteor.setInterval setRandomImage, 5000
	Template.background.helpers
		show: -> @index is Session.get "currentFotiIndex"