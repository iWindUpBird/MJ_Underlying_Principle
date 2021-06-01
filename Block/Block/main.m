//
//  main.m
//  Block
//
//  Created by 徐东顺 on 2021/5/31.
//

#import <Foundation/Foundation.h>

int name = 100; // 全局变量, 不会捕获
static int family = 1001; // 全局变量, 不会捕获

struct __block_impl {
  void *isa;
  int Flags;
  int Reserved;
  void *FuncPtr;
};

struct __main_block_desc_0 {
  size_t reserved;
  size_t Block_size; // 结构体内存大小
};

// block 源码实现
struct __main_block_impl_0 {
  struct __block_impl impl; // 直接是一个结构体(可以直接替换)
  struct __main_block_desc_0* Desc; // 结构体指针
  int age;                          // 捕获的变量
//  __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int _age, int flags=0) : age(_age) {
//    impl.isa = &_NSConcreteStackBlock;
//    impl.Flags = flags;
//    impl.FuncPtr = fp;
//    Desc = desc;
//  }
};


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /**
         1.block的定义与执行
         */
        
        // 定义一个block
//        ^{
//            NSLog(@"1++++++++++==%s",__func__);
//        };
//
//        // 后面加(), 可以执行block
//        ^{
//           NSLog(@"2++++++++++==%s",__func__);
//        }();
        
        /**
         2.block的源码
         */
        
//        int age = 10;
//        // 使用变量定义一个block
//        void (^block)(void) = ^{
//           NSLog(@"3++++++++++==%d", age);
//        };
//
//        // 将block强转成结构体
//        struct __main_block_impl_0 *blockStruct = (__bridge struct __main_block_impl_0 *)block;
//
//        block();
        
        /**
         3.block的变量捕获
         */
        
//        int age = 10;         // 局部变量 auto 会被block捕获 值传递
//        static int sex = 10;  // 局部变量 static 会被block捕获 指针传递
//        void (^block2)(int) = ^(int a){
//           NSLog(@"3++++++++++==%d, %d, %d, %d, %d", a, age, sex, name, family);
//        };
//        block2(20);
        
        /**
         4.block的类型
         */
        
//        void (^block)(int) = ^(int a){
//           NSLog(@"++++++++++==");
//        };
//        NSLog(@"++++++++++== %@", [block3 class]);
//        NSLog(@"++++++++++== %@", [[block3 class] superclass]);
//        NSLog(@"++++++++++== %@", [[[block3 class] superclass] superclass]);
        
        void (^block)(void) = ^{
          NSLog(@"++++++++++==%s",__func__);
        };
        
        int a = 10;
        void (^block1)(void) = ^{
          NSLog(@"++++++++++==%d",a);
        };
        
        NSLog(@"++++++++++==%@, %@, %@", [block class], [block1 class], [^{
            NSLog(@"++++++++++==%d",a);
        } class]);
    }
    return 0;
}
