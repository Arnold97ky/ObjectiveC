//
//  NetworkManager.h
//  Fish
//
//  Created by Arnold Sylvestre on 8/9/22.
//

#import <UIKit/UIKit.h>
#import "FishModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+(instancetype)sharedInstance;

-(void)fetchDigimonInfo:(void(^)(NSMutableArray*))completion;

-(void)fetchImageWithString:(NSString*)imageString completion:(void(^)(UIImage*))completion;

@end

NS_ASSUME_NONNULL_END
