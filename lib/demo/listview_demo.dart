import 'package:flutter/material.dart';
import 'package:hello_world/demo/post_show.dart';
import '../model/post.dart';
import 'post_show.dart';

//注意:凡是用到了什么组件，都要import第一行，这个文件import了第二行
//如果主文件也单独出现了posts，也要import第二行

//目的，创建一个单独好的类，想展示的时候就放在主文件中的home：后面，方便开发
//更专注的做其他界面，又不用删除刚刚建好的类

class ListViewDemo extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context,int index){
    return Container(//body为一个容器，容器中承载了列表
      color: Colors.white,
      margin: EdgeInsets.all(8.0),//设置这个容器距离四边的边缘
      child:Stack(
        children: <Widget>[
          Column(
            children:<Widget>[
            Image.network(posts[index].imageUrl),
            SizedBox(height:16.0),
            Text(
              posts[index].title,
              style: Theme.of(context).textTheme.title,//文字样式，这个表明文字做主标题
            ),
            Text(
              posts[index].author,
              style: Theme.of(context).textTheme.subhead,//副标题
            ),         
            SizedBox(height:16.0),
          ]
        ),
      Positioned.fill(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white.withOpacity(0.3),
            highlightColor: Colors.white.withOpacity(0.1),
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder:(context)=>PostShow(post:posts[index]))
              );
            },
          ),
        ),
      ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: posts.length,
          itemBuilder: _listItemBuilder,
        );
  }
}