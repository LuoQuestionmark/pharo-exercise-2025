Class {
	#name : 'EarthMap',
	#superclass : 'Object',
	#instVars : [
		'countries'
	],
	#category : 'Exercise1',
	#package : 'Exercise1'
}

{ #category : 'parsing' }
EarthMap >> importCountriesFrom: aFilename [
	| tree |
	tree := self xmlTreeFromFile: aFilename.
	tree descendantNodes do:
	[:node | (node class = XMLElement and: [node name ~= 'svg'])
		ifTrue: [self importCountryFromXMLNode: node]
	].
	
	
]

{ #category : 'parsing' }
EarthMap >> importCountryFromXMLNode: aXMLElement [
	countries add: (EarthMapCountry new fromXML: aXMLElement)
]

{ #category : 'initialization' }
EarthMap >> initialize [
	super initialize.
	countries := OrderedCollection new

]

{ #category : 'canvas' }
EarthMap >> openPopulatedCanvas [
	self populatedCanvas open
]

{ #category : 'canvas' }
EarthMap >> populatedCanvas [
^ RSCanvas new
	addAll: (countries collect: [ :country | country asRSShape ]);
	@ RSCanvasController;
	yourself
]

{ #category : 'parsing' }
EarthMap >> xmlTreeFromFile: aFileName [
	^ aFileName asFileReference readStreamDo: [ :stream |
		(XMLDOMParser parse: stream) document ]
]
