import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget{
  Widget _gridItemBuilder(BuildContext context,int index){
    return Container(
      child:Image.network(
        posts[index].imageUrl,
        fit:BoxFit.cover,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,//不用加括号了

      //控制每行显示个数，间距
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        ),

    );
  }
}

class GridViewCountDemo extends StatelessWidget{

  List<Widget> _buildTiles(int length){
    return List.generate(length, (int index)  {
      return Container(
        color:Colors.grey[300],
        alignment:Alignment(0.0,0.0),
        child:
          Text(
            'Item$index',
            style: TextStyle(fontSize:18.0,color:Colors.black)),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(//网格显示图片
      crossAxisCount: 3,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children: _buildTiles(100),
    );
  }
}

class PageViewDemo1 extends StatelessWidget{
  Widget _pageItemBuilder(BuildContext context,int index){
    return Stack(
      children: <Widget>[
        SizedBox.expand(//充满整个图片
          child: Image.network(
            posts[index].imageUrl,
            fit:BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style:TextStyle(fontWeight:FontWeight.bold),
              ),
              Text(
                posts[index].author,
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,//一个办法
    );
  }
}

class PageViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return PageView(
      
      //PageView属性,可以不加，默认是水平滑动
      scrollDirection: Axis.vertical,//设置为垂直方向滚动
      onPageChanged: (currentpage)=>debugPrint("currentpage$currentpage"),//调试台显示当前页面
      //reverse:True   //倒转页面（）最后一页变成最前一页
      pageSnapping: false,//允许滑动时停留页面（就是你滑动页面到哪他就停在哪，不会自动帮你）
      
      //PageController属性
      controller: PageController(
        initialPage:1,//注意是从0开始的 
        keepPage: false,//不记住用户上次滚动到哪个页面
        viewportFraction: 1,//控制这个页面显示的比例，如果是水平滑动，则该页面中间对齐，两边会里屏幕边缘有一样的距离
      ),

      children: <Widget>[
        Container(
          alignment: Alignment(0.0, 0.0),
          color: Colors.grey,
          child: Text(
            "ONE",
            style:TextStyle(fontSize: 32.0,color:Colors.white)
          ),
        ),
        Container(
          alignment: Alignment(0.0, 0.0),
          color: Colors.blueGrey,
          child: Text(
            "TWO",
            style:TextStyle(fontSize: 32.0,color:Colors.white)
          ),
        ),
        Container(
          alignment: Alignment(0.0, 0.0),
          color: Colors.pink,
          child: Text(
            "THREE",
            style:TextStyle(fontSize: 32.0,color:Colors.white)
          ),
        )
      ],
    );
  }
}