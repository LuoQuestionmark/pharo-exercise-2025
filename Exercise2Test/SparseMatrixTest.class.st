Class {
	#name : 'SparseMatrixTest',
	#superclass : 'TestCase',
	#category : 'Exercise2Test',
	#package : 'Exercise2Test'
}

{ #category : 'basic tests' }
SparseMatrixTest >> SparseCreationTests [
	| m |
	m := SparseMatrix new.
	m := m fromMat: #(#(1 2 3 0) #(4 5 6 7) #(7 8 9 10)).

	"just test if it can execute correctly"
	self assert: true.

]

{ #category : 'basic tests' }
SparseMatrixTest >> SparseReverseTests [
	| m m2 m3 |
	m := SparseMatrix new.
	m2 := #(#(1 2 3 0) #(4 5 6 7) #(7 8 9 10)).
	m := m fromMat: m2.
	m3 := m toMat.
	self assert: m2 equals: m3.
]

{ #category : 'basic tests' }
SparseMatrixTest >> ZeroElementsTests [
	| m m2 m3 |
	m := SparseMatrix new.
	m2 := #(#(0)).
	m := m fromMat: m2.
	m3 := m toMat.
	self assert: m2 equals: m3.
]
