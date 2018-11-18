//
//  ClarifaiAPI.h
//  underTaking
//
//  Created by Anita Souv on 11/18/18.
//  Copyright © 2018 Anita Souv. All rights reserved.
//

#ifndef ClarifaiAPI_h
#define ClarifaiAPI_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ClarifaiAPI : NSObject

@property (strong, nonatomic) id someProperty;

- (void) someMethod;
- (NSMutableDictionary*) getlabelsFrom:(UIImage *) img;

@end


#endif /* ClarifaiAPI_h */


