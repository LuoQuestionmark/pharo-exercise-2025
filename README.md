# pharo-exercise-2025

This repository contains exercises on Pharo language. These exercises are associated to my Ph.D. candidate.

## Files and Folders

Some files are generated by `Pharo` with its git plugin "iceberg": `./project`, `.properties`. The folder `Exercise1` is exported by the same plugin. To make my changes clear, I have renamed the package from `EarthTutorial` to `Exercise1`.

## Exercise 1

The final version of exercise 1 contains the definition of follow classes:

- `EarthMap`;
- `EarthMapCountry`;
- `EarthCountryBrowser`.

While most of the components are defined directly by the tutorial, I have implemented the necessary code to finish the implementation. By putting the image `world.svg` at the root of working directory, two functionalities are granted:

1. display of world map (by changing each country individually);
2. display of national flags.

```st
"display of world map"
EarthMap new
importCountriesFrom: (FileSystem workingDirectory / 'world.svg' );
openPopulatedCanvas;
yourself
```

```st
"display of national flags"
(EarthCountryBrowser on:
(EarthMap new importCountriesFrom: (FileSystem workingDirectory / 'world.svg' )))
open
```

## Exercise 2

The final version of exercise 2 contains the definition of a two classes:

- SparseMatrix (package Exercise2)
- SparseMatrixTest (package Exercise2Test)

The `SparseMatrix` class contains two methods that convert a normal matrix (`Array` of `Array`) to a sparse matrix, and vice-versa":

- `fromMat:` take a matrix and return the matrix as a sparse matrix
- `toMat`: return a "normal" matrix from a sparse one

Example of usage:

```st
| m m2 m3 |
m2 := #(#(1 2 3 0) #(4 5 6 7) #(7 8 9 10)).
m := SparseMatrix fromMat: m2.
m3 := m toMat.
self assert: m2 equals: m3.
```

### Data structure

The `SparseMatrix` class contains the following information:

- the size of original matrix (`xdim` and `ydim`);
- the position and value of each non-zero element.

To save the position and value of each non-zero element, the class contains three ordered list (`OrderedCollection`), respectively the coordinate of the first axis, of the second axis, and the value of each non-zero element.

```
xs : x1 x2 x3 x4 ...
ys : y1 y2 y3 y4 ...
vs : v1 v2 v3 v4 ...
```

### Restore original matrix

The program did it with two steps: firstly it build a "flat" version of the original matrix, filling each case with a proper value by calculating their indexes; secondly it "reshape" the matrix using the stored value.

### Tests

I built three tests in the class `SparseMatrixTest`, to test if the matrix can be converted correctly on both direction.
