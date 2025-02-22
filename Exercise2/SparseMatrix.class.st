"
Sparse matrix base class for the exercise.
"
Class {
	#name : 'SparseMatrix',
	#superclass : 'Object',
	#instVars : [
		'xs',
		'ys',
		'vs',
		'xdim',
		'ydim'
	],
	#category : 'Exercise2',
	#package : 'Exercise2'
}

{ #category : 'initialization' }
SparseMatrix >> fromMat: normalMatrix [
	| x y |

	x := 0. y := 0.
	xs := OrderedCollection new.
	ys := OrderedCollection new.
	vs := OrderedCollection new.

	normalMatrix do: [ :row |
		y := 0.
		row do: [ :col |
			col ~= 0 ifTrue: [ 
				xs add: x.
				ys add: y.
				vs add: col.
			].
			y := y + 1.
		].
		x := x + 1.
	].

	xdim := x.
	ydim := y.


]

{ #category : 'initialization' }
SparseMatrix >> initialize [
	super initialize.
]

{ #category : 'converting' }
SparseMatrix >> matReshape: aMat col: aCol row: aRow [
	| index line lineIndex element out |
	
	out := Array new: aRow.
	index := 1.
	
	1 to: aRow do: [ :r | 
		lineIndex := 1.
		line := Array new: aCol.
		
		1 to: aCol do: [ :c |
			element := aMat at: index.
			line at: c put: element.
			
			index := index + 1.
		].
		
		out at:r put: line.
	].

	^ out.
]

{ #category : 'converting' }
SparseMatrix >> toMat [
	| out x y v valIndex|
	
	out := Array new: xdim * ydim.
	
	valIndex := 1.
	1 to: xdim * ydim do: [ :i |
		valIndex <= xs size ifTrue: [
			x := xs at: valIndex.
			y := ys at: valIndex.
			(y + 1) + (x * ydim) = i ifTrue: [ 
				v := vs at: valIndex.
				out at: i put: v.
				valIndex := valIndex + 1.
			] ifFalse: [ 
				out at: i put: 0.
			]
		].
	].
	
	out := self matReshape: out col: ydim row: xdim.
	
	^ out
]
