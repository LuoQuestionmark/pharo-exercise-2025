Class {
	#name : 'EarthMapCountry',
	#superclass : 'Object',
	#instVars : [
		'svgPath',
		'name',
		'code'
	],
	#category : 'Exercise1',
	#package : 'Exercise1'
}

{ #category : 'accessing' }
EarthMapCountry >> asRSShape [
	^ RSSVGPath new svgPath: svgPath

]

{ #category : 'accessing' }
EarthMapCountry >> fromXML: aXMLElement [
	svgPath := aXMLElement attributeAt: 'd'.
	name := aXMLElement attributeAt: 'title'.
	code := aXMLElement attributeAt: 'id'.

]

{ #category : 'inspector' }
EarthMapCountry >> inspectorShape [
	<inspectorPresentationOrder: 0 title: 'Shape'>
	
	| canvas |
	canvas := RSCanvas new.
	canvas add: self asRSShape.
	canvas @ RSCanvasController.
	^ SpRoassalInspectorPresenter new canvas: canvas; yourself
]

{ #category : 'printing' }
EarthMapCountry >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' ';
		nextPutAll: name
]
