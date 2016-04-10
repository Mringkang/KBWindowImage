//
//  ViewController.m
//  WindowImage
//
//  Created by kangbing on 16/4/10.
//  Copyright © 2016年 kangbing. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageEffects.h"

@interface ViewController (){

    UIImageView *_imageView;


}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    // 给图片一个磨砂的效果
    UIImage *image = [[self curentimage] applyLightEffect];
    
    // 把图片添加到当前的view上
    _imageView = [[UIImageView alloc]initWithImage:image];
    
    [self.view addSubview:_imageView];


}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


    
    [_imageView removeFromSuperview];

}



- (void)loadView{

    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1.png"]];
    
    imageView.userInteractionEnabled = YES;
    
    self.view = imageView;



}


// 抽取一个截取屏幕的方法
- (UIImage *)curentimage{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    // 1 实现磨砂效果, 先开启图形上下文
    UIGraphicsBeginImageContext(window.bounds.size);
    
    // 2 获取到开启的图行上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    // 3 把window渲染到上下文当中
    [window.layer renderInContext:ref];
    
    // 4 获取图片,
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5 关闭图形上下文
    UIGraphicsEndImageContext();
    
    
    return image;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
