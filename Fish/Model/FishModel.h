//
//  FishModel.h
//  Fish
//
//  Created by Arnold Sylvestre on 8/9/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FishModel : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* img;
@property (nonatomic, strong) NSString* level;
-(instancetype)initWithJsonDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
