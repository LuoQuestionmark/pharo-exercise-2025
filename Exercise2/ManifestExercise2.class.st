"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestExercise2',
	#superclass : 'PackageManifest',
	#category : 'Exercise2-Manifest',
	#package : 'Exercise2',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestExercise2 class >> ruleToDoCollectRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#SparseMatrix #toMat #false)) #'2025-02-21T23:27:00.47424+01:00') )
]
