//
//  LampViewController.m
//  小东二校
//
//  Created by wharlim on 15/6/22.
//  Copyright (c) 2015年 wharlim. All rights reserved.
//

#import "LampViewController.h"

@interface LampViewController ()

@end

@implementation LampViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (UIView *slider in self.view.subviews) {
        if ([slider isKindOfClass:[UISlider class]]) {
            [(UISlider *)slider addTarget:self action:@selector(lamp_valueChange:) forControlEvents:UIControlEventValueChanged];
            
            
        }
    }
    
    [[AppDelegate app] sendCom:@"11100"];       //发送dmx.go
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnSuperView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)lamp_valueChange:(UISlider *)sender{
    int theValue = sender.value;
    [[AppDelegate app] sendCom:[NSString stringWithFormat:@"B%02d%02d",sender.tag-1000,theValue]];
}

- (IBAction)cueCtrl:(UIButton *)sender {
    [[AppDelegate app] sendCom:[NSString stringWithFormat:@"1%d",sender.tag]];
}

- (IBAction)panCtrl:(UIButton *)sender {
     [[AppDelegate app] sendCom:[NSString stringWithFormat:@"1%d",sender.tag]];
}







/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/





@end
