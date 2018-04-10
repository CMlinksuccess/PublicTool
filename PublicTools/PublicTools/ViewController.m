//
//  ViewController.m
//  PublicTools
//
//  Created by ECOOP－09 on 16/8/8.
//  Copyright © 2016年 ECOOP－09. All rights reserved.
//

#import "ViewController.h"
#import "PublicTools.h"
#import "MacroDefine.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITextField *text;
@property (nonatomic, strong)NSArray *array;
@property (nonatomic, strong)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _text = [[UITextField alloc]initWithFrame:CGRectMake(0, 20,self.view.frame.size.width , 40)];
    _text.backgroundColor = [UIColor whiteColor];
    //关闭系统自动联想功能
    [_text setAutocorrectionType:UITextAutocorrectionTypeNo];
    //关闭系统自动首字母大写功能
    [_text setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    _text.placeholder = @"请输入验证内容..";
    [self.view addSubview:_text];
    
    _array = @[@"验证手机号",@"验证邮箱",@"验证网址",@"验证身份证号",@"验证银行卡号",@"验证邮政编码",@"验证QQ号",@"验证IP地址",@"验证密码",@"是否包含汉字",@"当前日期",@"手机信息"];
    
    _tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

#pragma mark -UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return _array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _array[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
            [self isValid:[PublicTools isMobileNumber:_text.text] content:@"手机号"];
         
            break;
        case 1:
            [self isValid:[PublicTools isValidEmail:_text.text] content:@"邮箱地址"];

            break;
        case 2:
            [self isValid:[PublicTools isValidUrlString:_text.text] content:@"网址"];

            break;
        case 3:
            [self isValid:[PublicTools isValidIdCard:_text.text] content:@"身份证号"];

            break;
        case 4:
            [self isValid:[PublicTools isBankNumber:_text.text] content:@"银行卡号"];

            break;
        case 5:
            [self isValid:[PublicTools isPostalcode:_text.text] content:@"邮政编码"];

            break;
        case 6:
            [self isValid:[PublicTools isQqNumber:_text.text] content:@"QQ号"];

            break;
        case 7:
            [self isValid:[PublicTools isValidIp:_text.text] content:@"IP"];

            break;
        case 8:
            [self isValid:[PublicTools isPassword:_text.text] content:@"登陆密码"];

            break;
        case 9:
            if ([PublicTools isContainChinese:_text.text]) {
                [self tipMessage:@"包含中文✅"];
            }else{
                [self tipMessage:@"不包含中文❌"];
            }
            
            break;
        case 10:
            _text.text = [PublicTools stringFromDate:[NSDate date] formatString:nil];
            [self tipMessage:[PublicTools stringFromDate:[NSDate date] formatString:nil]];
            
            break;
        case 11:
            _text.text = [NSString stringWithFormat:@"系统:%@%@语言:%@",CurrentSystemName,CurrentSystemVersion,CurrentLanguage];
            [self tipMessage:_text.text];

            break;
       
        default:
            break;
    }
    
}

- (void)isValid:(BOOL)isvalid content:(NSString *)text{
  
    NSString *tip = isvalid ? [text stringByAppendingString:@"✅"] : [text stringByAppendingString:@"❌"];
    [self tipMessage:tip];
}

- (void)tipMessage:(NSString *)tip{
    if (!tip) {
        tip = @"输入错误！";
    }
    [PublicTools showMessage:tip showTimeState:SHOW_SHORT];
    /*
    //ios8
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:tip message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
   */
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
