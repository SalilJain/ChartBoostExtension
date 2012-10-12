You will need to bring in the FlashRuntimeExtensions.h from you SDK installation at:

{SDK}/include/FlashRuntimeExtensions.h


CBAnalytics.h and ChartBoost.h are part of the ChartBoost SDK.

Once you have all the sources in Xcode, you can built the library.

You can get the static library from chart boost but you will need to extract the symbols from it for armv7 and merge with the symbols from static library created by this project. To do so copy both the static libraries in an empty directory and do following:


