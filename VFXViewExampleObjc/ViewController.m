//
//  ViewController.m
//  VFXViewExampleObjc
//
//  Created by Le Quang on 29/10/2022.
//

#import "ViewController.h"
#import "VFXComponentViewObj.h"

@interface ViewController ()
@property(nonatomic, retain) VFXComponentViewObj* model;
@end

@implementation ViewController
@synthesize model = _model;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* backImg = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backImg.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:backImg];
    _model = [[VFXComponentViewObj alloc] initWithContainerView:self.view];
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_model showView];
}

@end
