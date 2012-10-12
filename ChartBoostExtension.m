//
//  ChartBoostExtension.m
//  ChartBoostExtension
//
//  Created by Salil on 6/5/12.
//  Copyright (c) 2012 SaachiTech. All rights reserved.
//


#import "FlashRuntimeExtensions.h"

#import "ChartBoost.h"
FREObject StartChartboost(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
    // Configure Chartboost
    Chartboost *cb = [Chartboost sharedChartboost];
    if(argc >= 2)
    {
        uint32_t string1Length;
        const uint8_t *appId;
        FREGetObjectAsUTF8(argv[0], &string1Length, &appId);
        
        uint32_t string2Length;
        const uint8_t *appSignature;
        FREGetObjectAsUTF8(argv[1], &string2Length, &appSignature);
        
        // Convert C strings to Obj-C strings
        cb.appId = [NSString stringWithUTF8String:(char*)appId];
        cb.appSignature = [NSString stringWithUTF8String:(char*)appSignature];
        // Notify the beginning of a user session
        [cb startSession];
        FREObject retVal;
        FRENewObjectFromInt32( 0, &retVal ); //Success
        return retVal;

        
    }
    else
    {
        FREObject retVal;
        FRENewObjectFromInt32( -1, &retVal ); //Failure
        return retVal;

    }
    
    
    
}
FREObject StartAndShowInterstitial(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
    // Configure Chartboost
    Chartboost *cb = [Chartboost sharedChartboost];
    if(argc >= 2)
    {
        uint32_t string1Length;
        const uint8_t *appId;
        FREGetObjectAsUTF8(argv[0], &string1Length, &appId);
        
        uint32_t string2Length;
        const uint8_t *appSignature;
        FREGetObjectAsUTF8(argv[1], &string2Length, &appSignature);
        
        // Convert C strings to Obj-C strings
        cb.appId = [NSString stringWithUTF8String:(char*)appId];
        cb.appSignature = [NSString stringWithUTF8String:(char*)appSignature];
        
        // Notify the beginning of a user session
        [cb startSession];
        
        // Show an interstitial
        [cb showInterstitial];
        
        FREObject retVal;
        FRENewObjectFromInt32( 0, &retVal ); //Success
        return retVal;

        
    }
    else
    {
        FREObject retVal;
        FRENewObjectFromInt32( -1, &retVal ); //Failure
        return retVal;

    }
    
}
FREObject ShowInterstitial(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
    // Configure Chartboost
    Chartboost *cb = [Chartboost sharedChartboost];
    
    [cb showInterstitial];
    FREObject retVal;
    FRENewObjectFromInt32( 0, &retVal ); //Success
    return retVal;
}


// A native context instance is created
void ContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) {
	*numFunctionsToTest = 3;
	FRENamedFunction* func = (FRENamedFunction*)malloc(sizeof(FRENamedFunction)*3);
	    
    func[0].name = (const uint8_t*)"StartChartboost";
	func[0].functionData = NULL;
	func[0].function = &StartChartboost;
    
    func[1].name = (const uint8_t*)"StartAndShowInterstitial";
	func[1].functionData = NULL;
	func[1].function = &StartAndShowInterstitial;
    
    func[2].name = (const uint8_t*)"ShowInterstitial";
	func[2].functionData = NULL;
	func[2].function = &ShowInterstitial;
    
    

    
    
	
	*functionsToSet = func;
}

// A native context instance is disposed
void ContextFinalizer(FREContext ctx) {
	return;
}

// Initialization function of each extension
void ExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet) {
	*extDataToSet = NULL;
	*ctxInitializerToSet = &ContextInitializer;
	*ctxFinalizerToSet = &ContextFinalizer;
}

// Called when extension is unloaded
void ExtFinalizer(void* extData) {
	return;
}
