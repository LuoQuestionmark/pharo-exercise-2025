"
Class EarthCountryBrowser, this class is part of the exercise on ""country flag"" of Pharo.
"
Class {
	#name : 'EarthCountryBrowser',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'countryList',
		'countryCode',
		'countryFlag',
		'flagLayout'
	],
	#category : 'Exercise1',
	#package : 'Exercise1'
}

{ #category : 'initialization' }
EarthCountryBrowser >> connectPresenters [

countryList whenSelectedItemChangedDo: [ 
	:item | self onCountrySelected: item	
].
]

{ #category : 'layout' }
EarthCountryBrowser >> defaultLayout [
	^ SpBoxLayout newTopToBottom
		add: (SpBoxLayout newLeftToRight
			add: countryList expand: true;
			add: countryCode width: 40
		)
		height: self class toolbarHeight;
		add: countryFlag height: 350;
		add: flagLayout height: 350;
		yourself
]

{ #category : 'user interface' }
EarthCountryBrowser >> flagForCountryCode: aString [

| request pngArray |
request := ZnClient new.
request get: 'https://flagcdn.com/w320/', aString asLowercase, '.png'.
request isSuccess ifTrue: [ 
	pngArray := request response contents.
	^ ImageReadWriter formFromStream: (ReadStream on: pngArray)
	].
^ BorderedMorph new asForm

]

{ #category : 'initialization' }
EarthCountryBrowser >> initializePresenters [ 
	super initializePresenters.

	countryList := self newDropList.
	countryList display: [ :item | item name ].
	countryList sortingBlock: [ :a :b | a model name < b model name ].
	countryList items: self model countries.
	countryCode := self newTextInput.
	countryCode editable: false.
	countryCode text: ' -- '.
	countryFlag := self newImage.

	flagLayout := self newRoassal.
]

{ #category : 'user interface' }
EarthCountryBrowser >> onCountrySelected: countryItem [

countryCode text: '   ', countryItem code.
self showFlag: countryItem code
]

{ #category : 'user interface' }
EarthCountryBrowser >> showFlag: aCode [
	| flag |
	flag := self flagForCountryCode: aCode.
	countryFlag image: flag.
]
