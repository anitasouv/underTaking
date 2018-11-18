//
//  clarifaiAPI.m
//  underTaking
//
//  Created by Anita Souv on 11/18/18.
//  Copyright © 2018 Anita Souv. All rights reserved.
//

// semaphores from http://www.technetexperts.com/mobile/how-to-pause-or-wait-execution-until-block-executes-with-semaphore-in-ios/
// using clarifai https://clarifai.com/developer/guide/supportedtypes

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "ClarifaiAPI.h"
#import "ClarifaiApp.h"

@implementation ClarifaiAPI : NSObject

- (void) someMethod{
    NSLog(@"SomeMethod Ran");
    
    ClarifaiApp *app = [[ClarifaiApp alloc] initWithApiKey:@"7835a9eec63f4531b57e417ceb5a234b"];

    ClarifaiImage *image = [[ClarifaiImage alloc] initWithURL:@"https://samples.clarifai.com/metro-north.jpg"];
    
    __block NSNumber* num3;
    NSMutableDictionary *result = [[NSMutableDictionary alloc]initWithCapacity:10];
    
    [app getModelByName:@"general-v1.3" completion:^(ClarifaiModel *model, NSError *error) {
        [model predictOnImages:@[image]
                    completion:^(NSArray<ClarifaiOutput *> *outputs, NSError *error) {
                        for (ClarifaiConcept *tag in outputs[0].concepts) {
                            NSLog(@"tag: %@", tag.conceptName);
                            NSLog(@"probability: %f", tag.score);
                            num3 = [NSNumber numberWithInt:(tag.score*1000000)];
                            [result setObject:num3 forKey:tag.conceptName];
                        }
                        NSLog(@"this is the first item: %@", result[@"track"]);
                    }];

    }];
}

- (NSMutableDictionary *) getlabelsFrom: (UIImage *) img{
    NSLog(@"HERE WE GOOOO");

    ClarifaiApp *app = [[ClarifaiApp alloc] initWithApiKey:@"7835a9eec63f4531b57e417ceb5a234b"];
    
    ClarifaiImage *image = [[ClarifaiImage alloc] initWithImage:img];

//    ClarifaiImage *image = [[ClarifaiImage alloc] initWithURL:@"https://samples.clarifai.com/metro-north.jpg"];
    
    __block NSNumber* num3;
    NSMutableDictionary *result = [[NSMutableDictionary alloc]initWithCapacity:10];
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    [app getModelByName:@"general-v1.3" completion:^(ClarifaiModel *model, NSError *error) {
        [model predictOnImages:@[image]
                    completion:^(NSArray<ClarifaiOutput *> *outputs, NSError *error) {
                        for (ClarifaiConcept *tag in outputs[0].concepts) {
                            NSLog(@"2tag: %@", tag.conceptName);
                            NSLog(@"2probability: %f", tag.score);
                            num3 = [NSNumber numberWithInt:(tag.score*1000000)];
                            [result setObject:num3 forKey:tag.conceptName];
                        }
                        NSLog(@"2this is the first item: %@", result[@"vase"]);
//                        return result;
                        dispatch_semaphore_signal(semaphore);

                    }];
        
    }];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

    return result;
}


@end
