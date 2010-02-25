"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MAMatrixTest,
	#superclass : #TestCase,
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #testing }
MAMatrixTest class >> isAbstract [
	
	^self name = #MatrixTest
]

{ #category : #fixture }
MAMatrixTest >> matrixClass [
	"comment stating purpose of message"
	
	^self subclassResponsibility
]

{ #category : #test }
MAMatrixTest >> testAccessors [
	"comment stating purpose of message"
	
	| m |
	m := self matrixClass new: 2 @ 3.
	m at: 1 and: 2 put: 12.
	m at: 2 and: 1 put: 21.
	self assert: (m at: 1 and: 2) = 12.
	self assert: (m at: 2 and: 1) = 21.
	m at: 1 and: 3 put: 13.
	self assert: (m at: 1 and: 3) = 13.
	self assert: (m atPoint: 1 @ 3) = 13
]

{ #category : #test }
MAMatrixTest >> testAddWithMatrix [
	"comment stating purpose of message"
	
	| m n mn |
	m := self matrixClass withAll: #(#(1 2) #(3 4) #(5 6)).
	n := self matrixClass withAll: #(#(10 20) #(30 40) #(50 60)).
	mn := self matrixClass withAll: #(#(11 22) #(33 44) #(55 66)).
	self assert: m + n = mn.
	m += n.
	self assert: m = mn.
	self assert: n = (self matrixClass withAll: #(#(10 20) #(30 40) #(50 60)))
]

{ #category : #test }
MAMatrixTest >> testAddWithNumber [
	"comment stating purpose of message"
	
	| m m10 |
	m := self matrixClass withAll: #(#(1 2) #(3 4) #(5 6)).
	m10 := self matrixClass withAll: #(#(11 12) #(13 14) #(15 16)).
	self assert: m + 10 = m10.
	self assert: 10 + m = m10.
	self assert: m + 10.0d = m10.
	self assert: 10.0d + m = m10.
	m += 10.
	self assert: m = m10
]

{ #category : #test }
MAMatrixTest >> testArithmeticUnity [
	
	| a |
	a := self matrixClass new: 2 withAll: #(1 2 3 4).
	self assert: MAMatrix unity * a = a.
	self assert: (MAMatrix unity + a) asArray = #(2 3 4 5).
	self assert: MAMatrix unity * MAMatrix unity = MAMatrix unity.
	self assert: (MAMatrix unity + MAMatrix unity) asNumber = 2.
	self assert: MAMatrix unity + MAMatrix zero = MAMatrix unity
]

{ #category : #test }
MAMatrixTest >> testArithmeticZero [
	
	| a |
	a := self matrixClass new: 2 withAll: #(1 2 3 4).
	self assert: MAMatrix zero * a = MAMatrix zero.
	self assert: MAMatrix zero + a = a.
	self assert: MAMatrix zero * MAMatrix zero = MAMatrix zero.
	self assert: MAMatrix zero + MAMatrix zero = MAMatrix zero.
	self assert: MAMatrix unity * MAMatrix zero = MAMatrix zero
]

{ #category : #test }
MAMatrixTest >> testDimension [
	"comment stating purpose of message"
	
	| m |
	m := self matrixClass new: 3 @ 7.
	self assert: m rowSize = 3.
	self assert: m columnSize = 7.
	self assert: m dimension = (3 @ 7)
]

{ #category : #test }
MAMatrixTest >> testIsZero [
	"comment stating purpose of message"
	
	| m |
	m := self matrixClass withAll: #(#(1 2) #(3 4) #(5 6)).
	self assert: m isZero not
]

{ #category : #test }
MAMatrixTest >> testMatrixMultiplicationDimension [
	"comment stating purpose of message"
	
	| A B |
	A := self matrixClass withAll: #(#(1 2 3) #(4 5 6)).
	B := self matrixClass withAll: #(#(6 -1) #(3 2) #(0 -3)).
	self assert: (A *~ B) dimension = (2 @ 2).
	self assert: (B *~ A) dimension = (3 @ 3).
	self assert: (A transposed *~ A) dimension = (3 @ 3).
	self assert: (B transposed *~ B) dimension = (2 @ 2)
]

{ #category : #test }
MAMatrixTest >> testMatrixMultiplicationValues [
	"comment stating purpose of message"
	
	| A B |
	A := self matrixClass withAll: #(#(1 2 3) #(4 5 6)).
	B := self matrixClass withAll: #(#(6 -1) #(3 2) #(0 -3)).
	self assert: A *~ B = (self matrixClass withAll: #(#(12 -6) #(39 -12))).
	self
		assert:
			B *~ A
				= (self matrixClass withAll: #(#(2 7 12) #(11 16 21) #(-12 -15 -18))).
	self
		assert:
			A transposed *~ A
				= (self matrixClass withAll: #(#(17 22 27) #(22 29 36) #(27 36 45))).
	self
		assert:
			B transposed *~ B = (self matrixClass withAll: #(#(45 0) #(0 14)))
]

{ #category : #test }
MAMatrixTest >> testMultWithMatrix [
	"comment stating purpose of message"
	
	| m n mn |
	m := self matrixClass withAll: #(#(1 2) #(3 4) #(5 6)).
	n := self matrixClass withAll: #(#(10 20) #(30 40) #(50 60)).
	mn := self matrixClass withAll: #(#(10 40) #(90 160) #(250 360)).
	self assert: m * n = mn.
	m *= n.
	self assert: m = mn.
	self assert: n = (self matrixClass withAll: #(#(10 20) #(30 40) #(50 60)))
]

{ #category : #test }
MAMatrixTest >> testMultWithNumber [
	"comment stating purpose of message"
	
	| m m10 |
	m := self matrixClass withAll: #(#(1 2) #(3 4) #(5 6)).
	m10 := self matrixClass withAll: #(#(10 20) #(30 40) #(50 60)).
	self assert: m * 10 = m10.
	self assert: 10 * m = m10.
	self assert: m * 10.0d = m10.
	self assert: 10.0d * m = m10.
	m *= 10.
	self assert: m = m10
]

{ #category : #test }
MAMatrixTest >> testReadDenseTextFrom [
	
	| matrix text stream |
	matrix := MAArrayMatrix withAll:
			#(#(2.3 0 4.2) #(0 1.3 2.2) #(3.8 0 0.5) #(0 0 0)).
	text := '4 3\2.3 0 4.2\0 1.3 2.2\3.8 0 0.5\0 0 0\' withCRs.
	stream := ReadStream on: text.
	self assert: matrix = (self matrixClass readFromDenseText: stream)
]

{ #category : #test }
MAMatrixTest >> testReadSparseTextFrom [
	
	| matrix text stream |
	matrix := MAArrayMatrix withAll:
			#(#(2.3 0 4.2) #(0 1.3 2.2) #(3.8 0 0.5) #(0 0 0)).
	matrix := matrix transposed.
	text := '4 3 6\2\0 2.3\2 3.8\1\1 1.3\3\0 4.2\1 2.2\2 0.5\' withCRs.
	stream := ReadStream on: text.
	self assert: matrix = (self matrixClass readFromSparseText: stream)
]

{ #category : #test }
MAMatrixTest >> testRowColumnSize [
	"comment stating purpose of message"
	
	| m |
	m := self matrixClass rows: 3 columns: 7.
	self assert: m rowSize = 3.
	self assert: m columnSize = 7.
	self assert: m dimension = (3 @ 7)
]

{ #category : #test }
MAMatrixTest >> testStoreDenseTextOn [
	
	| matrix text stream |
	matrix := self matrixClass withAll:
			#(#(2.3 0 4.2) #(0 1.3 2.2) #(3.8 0 0.5) #(0 0 0)).
	text := '4 3\2.3 0 4.2\0 1.3 2.2\3.8 0 0.5\0 0 0\' withCRs.
	stream := WriteStream on: String new.
	matrix storeDenseTextOn: stream.
	self assert: stream contents = text
]

{ #category : #test }
MAMatrixTest >> testStoreSparseTextOn [
	
	| matrix text stream |
	matrix := self matrixClass withAll:
			#(#(2.3 0 4.2) #(0 1.3 2.2) #(3.8 0 0.5) #(0 0 0)).
	matrix := matrix transposed.
	text := '4 3 6\2\0 2.3\2 3.8\1\1 1.3\3\0 4.2\1 2.2\2 0.5\' withCRs.
	stream := WriteStream on: String new.
	matrix storeSparseTextOn: stream.
	self assert: stream contents = text
]