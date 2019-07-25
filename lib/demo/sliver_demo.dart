import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
          //  title: Text("Hello World"),
            // pinned: true,//固定顶栏（不动）
            floating: true,//将工具栏也跟着滚动(ios工具栏也会消失，但好像安卓的没影响)

          //带渐进动画的可伸缩空间
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'flutter world'.toUpperCase(),
                style: TextStyle(
                  fontSize: 17.0,
                  letterSpacing: .0,//字间距
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(
                'http://p1.img.cctvpic.com/photoworkspace/contentimg/2017/03/23/2017032309324483518.jpeg',
                fit:BoxFit.cover,
              ),
            ),

          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverGridDemo(),
            ),
          )
        ],
      ),
    );//创建一个空白页面
  }
}

class SliverGridDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            delegate: SliverChildBuilderDelegate((BuildContext context,int index){
              return Container(
                child: Image.network(
                  posts[index].imageUrl,
                  fit:BoxFit.cover,
                ),
              );
            },
            childCount: posts.length,
            ),
          );
  }
}