# ButtonClickBlock

基于block点击回调的按钮

##实现原理

1.通过`runtime`给UIButton分类添加一个属性
   
   @property(nonatomic,weak)ButtonClickBlock clickBlock;
   
   设置clickBlock属性---objc_setAssociatedObject(self, &clickBlockKey, clickBlock, OBJC_ASSOCIATION_ASSIGN);
   
   获取clickBlock属性---objc_getAssociatedObject(self, &clickBlockKey);
   
2.为分类添加一个方法，注册点击按钮时的函数回调
    
    -(void)clickWithCompletion:(ButtonClickBlock)completion;
    
    typedef void(^ButtonClickBlock)(UIButton *btn);
    
3.clickWithCompletion方法实现
  
   -(void)clickWithCompletion:(ButtonClickBlock)completion{
   
       self.clickBlock = completion;
       
       [self addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
       
   }
   
  在注册回调之前，先把clickBlock设置成方法传入进来的block回调
  
  在使用UIButton的addTarget注册UIControlEventTouchUpInside事件回调
  
  在selector方法中获取clickBlock，如果不为nil，则调用block
