import 'package:flutter/material.dart';
import 'package:flutter_app/story.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("instagram"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, i) {
                      return Column(
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              width: 72,
                              height: 72,
                              margin: const EdgeInsets.only(
                                  top: 20, left: 10, right: 10),
                              child: Container(
                                margin: EdgeInsets.all(2),
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://www.sanwacompany.co.jp/shop/pagefiles/pc/k/karimokucat_lp_01.jpg"),
                                        fit: BoxFit.cover),
                                    shape: BoxShape.circle),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.amber,
                                      width: 2
                                  ),
                                  shape: BoxShape.circle
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => StoryPageView()),
                              );
                            },
                          )

                        ],
                      );
                    }),
              ),
              Container(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, i) {
                      return Column(children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 49,
                              height: 49,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://www.sanwacompany.co.jp/shop/pagefiles/pc/k/karimokucat_lp_01.jpg"),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "tokuma_0305",
                              style: TextStyle(fontSize: 13),
                            ),
                            const Spacer(),
                            Icon(Icons.more_horiz),
                            const SizedBox(
                              width: 15,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.sanwacompany.co.jp/shop/pagefiles/pc/k/karimokucat_lp_01.jpg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.favorite_border,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.chat_bubble_outline,
                              size: 30,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ]);
                    }),
              )
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
