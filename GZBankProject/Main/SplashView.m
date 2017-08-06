//
//  SplashView.m
//  GZBankProject
//
//  Created by Wu Ting on 2017/7/16.
//  Copyright © 2017年 wuting. All rights reserved.
//

#import "SplashView.h"
#import "HTTPClient.h"
#import "WebAppAddressCenter.h"
#import "UIImageView+AFNetworking.h"
#import "NSDictionary+Safe.h"

@interface SplashView ()
@property (nonatomic) UIImageView *imageView;
@end

@implementation SplashView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    
    return self;
}

- (void)loadSplashImageWithHideInterval:(NSTimeInterval)interval {
    __weak __typeof(self) wself = self;
    NSString *url = [WebAppAddressCenter appSplashImageURL];
    [[HTTPClient sharedInstance] GET:url
                          parameters:nil
                             success:^(NSURLSessionDataTask *task, id responseObject) {
                                 if ([responseObject isKindOfClass:[NSDictionary class]]) {
                                     NSString *imageUrl = [(NSDictionary *)responseObject stringForKey:@"imageStartUrl"];
                                     if (imageUrl) {
                                         [wself loadImageURL:imageUrl hideInterval:interval];
                                     } else {
                                         [wself hide];
                                     }
                                 } else {
                                     [wself hide];
                                 }
                             } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                 [wself hide];
                             }];
}

- (void)loadImageURL:(NSString *)url hideInterval:(NSTimeInterval)interval {
    __weak __typeof(self) wself = self;
    [self.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]
                          placeholderImage:nil
                                   success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
                                       wself.imageView.image = image;
                                       __typeof(wself) sself = wself;
                                       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                           [sself hide];
                                       });
                                   } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
                                       [wself hide];
                                   }];
}

- (void)hide {
    self.hidden = YES;
    [self removeFromSuperview];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self addSubview:self.imageView];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    
    return _imageView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
