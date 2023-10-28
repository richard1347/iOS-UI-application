//
//  ViewController.m
//  mobile
//
//  Created by Richard on 2023/8/6.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *appTitle;
@property (strong, nonatomic) IBOutlet UITableView *phoneInformation;
@property (weak, nonatomic) IBOutlet UIButton *getInformation;
@property (nonatomic,strong) NSMutableArray *information;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _phoneInformation.delegate=self;
    _phoneInformation.dataSource=self;
 
    [_getInformation addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID=@"cell";
    UITableViewCell *cell=[self.phoneInformation dequeueReusableCellWithIdentifier:cellID];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    UIImage *cellImage=[UIImage imageNamed:@"simcard.jpeg"];
    cell.imageView.image=cellImage;
    cell.textLabel.textColor=[UIColor yellowColor];
    cell.textLabel.text=@"Please press the button bellow";
    return cell;
}

-(void)click{
    CTTelephonyNetworkInfo *info=[[CTTelephonyNetworkInfo  alloc]init];
    CTCarrier *carrier=[info subscriberCellularProvider];
    NSString *mcc=carrier.mobileCountryCode;
    NSString *mnc=carrier.mobileNetworkCode;
    NSString *cName=carrier.carrierName;
    NSArray<UITableViewCell *> *cellArray=[self.phoneInformation visibleCells];
    for(UITableViewCell *cell in cellArray){
        cell.textLabel.textColor=[UIColor cyanColor];
        cell.textLabel.text=[NSString stringWithFormat:@"%@, %@, %@",cName,mcc,mnc];
    }
}

@end
