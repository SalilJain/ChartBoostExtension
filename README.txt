You will need to bring in the FlashRuntimeExtensions.h from you SDK installation at:

{SDK}/include/FlashRuntimeExtensions.h


You can get the static library from chart boost but you will need to extract the symbols from it for armv7 and merge with the symbols from static library created by this project. To do so copy both the static libraries in an empty directory and do following:
lipo -output libChartBoostarmv7.a -thin armv7 libChartBoost.a
ar -x libChartBoostExtension.a 
ar -x libChartBoostarmv7.a 
ar -crs libCB.a *.o

libCB.a can be used to create the ANE file.
