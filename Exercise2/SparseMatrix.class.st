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

{ #category : 'instance creation' }
SparseMatrix class >> basicNew [
	^ super basicNew initialize.
]

{ #category : 'instance creation' }
SparseMatrix class >> fromMat: normalMatrix [
	| out |
	out := self basicNew.

	normalMatrix doWithIndex: [ :row :x |
		row doWithIndex: [:col :y |
			col ~= 0 ifTrue: [
				out xsAdd: x.
				out ysAdd: y.
				out vsAdd: col.
			].
		].
	].

	out xdim: normalMatrix size.
	out ydim: (normalMatrix at:1) size.
	
	^ out


]

{ #category : 'instance creation' }
SparseMatrix class >> new [
	self error: 'should not be called'
]

{ #category : 'initialization' }
SparseMatrix >> initialize [
	super initialize.
	xs := OrderedCollection new.
	ys := OrderedCollection new.
	vs := OrderedCollection new.
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
			y + ((x - 1) * ydim) = i ifTrue: [ 
				v := vs at: valIndex.
				out at: i put: v.
				valIndex := valIndex + 1.
			] ifFalse: [ 
				out at: i put: 0.
			]
		] ifFalse: [
			out at:i put: 0.
		].
	].
	
	out := self matReshape: out col: ydim row: xdim.
	
	^ out
]

{ #category : 'accessing' }
SparseMatrix >> vs [
	^ vs
]

{ #category : 'setter' }
SparseMatrix >> vsAdd: value [
	vs add: value.
]

{ #category : 'accessing' }
SparseMatrix >> xdim [
	^ xdim
]

{ #category : 'setter' }
SparseMatrix >> xdim: value [
	xdim := value
]

{ #category : 'accessing' }
SparseMatrix >> xs [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	^ xs
]

{ #category : 'setter' }
SparseMatrix >> xsAdd: value [
	xs add: value.
]

{ #category : 'accessing' }
SparseMatrix >> ydim [
	^ ydim
]

{ #category : 'setter' }
SparseMatrix >> ydim: value [
	ydim := value
]

{ #category : 'accessing' }
SparseMatrix >> ys [
	^ ys
]

{ #category : 'setter' }
SparseMatrix >> ysAdd: value [
	ys add: value
]
