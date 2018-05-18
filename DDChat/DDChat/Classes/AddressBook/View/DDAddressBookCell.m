//
//  DDAddressBookCell.m
//  DDChat
//
//  Created by wuqh on 2018/5/17.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDAddressBookCell.h"
#import "DDAddressBookModel.h"

@interface DDAddressBookCell()

@property (nonatomic, strong) UIImageView *headIconImageView;
@property (nonatomic, strong) UILabel *nameLabel;


@end

@implementation DDAddressBookCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.headIconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.headIconImageView];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.nameLabel];
    
    [self.headIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(14);
        make.top.equalTo(self.contentView.mas_top).offset(8);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
        make.width.height.equalTo(@30);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headIconImageView);
        make.left.equalTo(self.headIconImageView.mas_right).offset(8);
    }];
}

- (void)setAddressBookModel:(DDAddressBookModel *)addressBookModel {
    _addressBookModel = addressBookModel;
    
    self.headIconImageView.image = [UIImage imageNamed:addressBookModel.headIcon];
    self.nameLabel.text = addressBookModel.name;
    
}

@end
