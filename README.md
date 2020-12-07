# Flutter_Study
学习Flutter✔

## 布局

### GridView 列表布局
### Expanded  flex布局
### ListView 滚动视图
### Silver 滚动布局
### Column Row 纵向、横向布局


## 小部件(目前用到的)

### InkWell

### Container

### Material

### Row

### Column

### Center

### Padding

### ClipRRect

### 
## 组合
### Material + Inkwell
* 效果: 点击有水波纹效果的容器，可添加点击事件
### ListView + （Wiper + Column + Row + Expanded + GridView(禁止滑动)）
* 效果: 轮播 + 宫格 + 列表布局

### http 请求
* Dio库

### 路由切换
* fluro


### 父子组件通信

* 父组件传值给子组件，直接在引用组件时在括号中传递即可，子组件需要去承接
* 子组件传值给父组件, 子组件需要承接一个从父组件传递来的函数，然后再对应时机触发运行函数，传值给父组件

```
    class father extends StatefulWidget {
  father({Key key}) : super(key: key);

  @override
  _fatherState createState() => _fatherState();
}

class _fatherState extends State<father> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: child(toFather: (data){
           print(data);
       })
    );
  }
}


    class child extends StatefulWidget {
        final toFather;
  child({Key key,this.toFather}) : super(key: key);

  @override
  _childState createState() => _childState();
}

class _childState extends State<child> {
      @override
  child get widget => super.widget;
  @override
  Widget build(BuildContext context) {
    return Container(
       child: InkWell(
           child:Text('传值'),
           onTap:(){
               widget.toFather('child ---- >>> father  :  你好');
           }
       ),
    );
  }
}
```
