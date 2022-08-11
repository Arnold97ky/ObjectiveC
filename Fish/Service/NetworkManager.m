//
//  NetworkManager.m
//  Fish
//
//  Created by Arnold Sylvestre on 8/9/22.
//

#import "NetworkManager.h"

@implementation NetworkManager

+(instancetype)sharedInstance {
    static NetworkManager* _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

-(instancetype)init {
    self = [super self];
    return self;
}




-(void)fetchDigimonInfo:(void (^)(NSMutableArray* _Nullable))completion {
    
  
    
    
    
    NSString *urlString = @"https://digimon-api.vercel.app/api/digimon";
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil);
            return;
        }
        
        if (data == nil) {
            NSLog(@"Empty");
            completion(nil);
            return;
        }
        
        
        
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        if ([object isKindOfClass:[NSArray class]]) {
            
            NSLog(@"Array");
            
            NSArray* Array = object;
            
            NSMutableArray *myArray = [NSMutableArray array];
            
            for( FishModel __strong* element in Array) {
                element = [[FishModel alloc] initWithJsonDictionary :element];
                [myArray addObject:element];
                
            }
                
            completion(myArray);
            
            return;
        }
                
                
    }] resume];
    
}



-(void)fetchImageWithString:(NSString *)imageString completion:(void (^)(UIImage * _Nullable))completion {
    
    
    NSURL* url = [NSURL URLWithString: imageString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            
            completion(nil);
            return;
        }
        
        if (data == nil) {
            completion(nil);
            return;
        }
        
        UIImage* image = [UIImage imageWithData:data];
        completion(image);
    }] resume];
    
}








@end
