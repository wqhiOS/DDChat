//
//  DDChatEmojiKeyboard.m
//  DDChatToolBar
//
//  Created by wuqh on 2018/5/22.
//  Copyright © 2018年 wuqh. All rights reserved.
//

#import "DDChatEmojiKeyboard.h"
#import "DDChatToolBarCommon.h"
#import "DDEmojiCell.h"

#define kDisplayEmojiGroup_Height (KEYBOARD_HEIGHT-57.f)
#define kDisplayEmojiGroup_RowCount (3)
#define kDisplayEmojiGroup_ColCount (8)

@interface DDChatEmojiKeyboard()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *emojiCollectionView;
@property (nonatomic, strong) UICollectionView *emojiCategoryCollectionView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UIButton *sendButton;
@property (nonatomic, strong) UIButton *manageButton;

@end

@implementation DDChatEmojiKeyboard

- (void)dealloc {
    NSLog(@"%s",__FUNCTION__);
}

+ (instancetype)defaultKeyboard {
    static dispatch_once_t onceToken;
    static DDChatEmojiKeyboard *instance;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor redColor];
        [self addSubview:self.emojiCollectionView];
        [self addSubview:self.pageControl ];
        [self addSubview:self.addButton];
        [self addSubview:self.sendButton];
        
        [self.emojiCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.and.right.equalTo(self);
            make.height.mas_equalTo(kDisplayEmojiGroup_Height);
        }];
        
        [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.emojiCollectionView.mas_bottom);
            make.left.and.right.equalTo(self);
            make.height.equalTo(@20);
        }];
        
        [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.equalTo(self);
            make.top.equalTo(self.pageControl.mas_bottom);
            make.width.equalTo(@46);
        }];
        [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.and.bottom.equalTo(self);
            make.top.equalTo(self.pageControl.mas_bottom);
            make.width.equalTo(@56);
        }];
    }
    return self;
}

#pragma mark - Getter
- (UICollectionView *)emojiCollectionView {
    if (!_emojiCollectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = CGFLOAT_MIN;
        layout.minimumInteritemSpacing = CGFLOAT_MIN;
        layout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width-40)/kDisplayEmojiGroup_ColCount, (kDisplayEmojiGroup_Height-8)/3);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(8, 20, 0, 20);
        _emojiCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _emojiCollectionView.backgroundColor = HexColor(0xF2F2F5);
        [_emojiCollectionView registerClass:[DDEmojiCell class] forCellWithReuseIdentifier:@"cellId"];
        _emojiCollectionView.pagingEnabled = YES;
        _emojiCollectionView.dataSource = self;
        
    }
    return _emojiCollectionView;
}
- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = 10;
        [_pageControl setPageIndicatorTintColor:[UIColor colorWithWhite:0.5 alpha:0.3]];
        [_pageControl setCurrentPageIndicatorTintColor:[UIColor grayColor]];
    }
    return _pageControl;
}

- (UIButton *)addButton {
    if (!_addButton) {
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addButton setImage:[UIImage imageNamed:@"emojiadd"] forState:UIControlStateNormal];
        [_addButton setBackgroundColor:[UIColor whiteColor]];
    }
    return _addButton;
}

- (UIButton *)sendButton {
    if (!_sendButton) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sendButton setTitle:@"  发送" forState:UIControlStateNormal];
        _sendButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_sendButton setBackgroundImage:[UIImage imageNamed:@"emojiKB_sendBtn_gray"] forState:UIControlStateNormal];
        [_sendButton setBackgroundImage:[UIImage imageNamed:@"emojiKB_sendBtn_gray"] forState:UIControlStateHighlighted];
        [_sendButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    return _sendButton;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 24;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DDEmojiCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Expression_%ld",indexPath.item+1]];
    return cell;
}
#pragma mark - UICollectionViewDelegate



@end
