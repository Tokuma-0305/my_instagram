import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StoryPageView extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, i) {
                return StoryContentHoldView(
                  myPageController: pageController,
                  currentPageIndex: i,
                );
              })),
    );
  }
}

class StoryContentHoldView extends StatefulWidget {
  final int currentPageIndex;

  final PageController myPageController;

  StoryContentHoldView({this.myPageController, this.currentPageIndex});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StoryContentHoldViewState();
  }
}

class StoryContentHoldViewState extends State<StoryContentHoldView>
    with TickerProviderStateMixin {
  final List<String> images = [
    "https://clutchpoints.com/wp-content/uploads/2020/01/Giannis-Antetokounmpo-shoulder-plans-to-return-vs.-Nuggets.jpg",
    "https://electronicintifada.net/sites/default/files/styles/original_800w/public/2018-06/lionel_messi.jpg?itok=JM_JHO1i",
    "https://www.cocokarafine.co.jp/images/common/ogp.gif",
    "https://basketballking.jp/wp-content/uploads/2019/12/E3A48814-B187-4E91-9DFC-1BADE313B9C1-500x375.jpeg",
  ];
  var currentItemIndex = 0;
  AnimationController animationController;
  Animation<double> indicatorAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..forward();
    indicatorAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              goNext();
            }
          });
    super.initState();
  }

  void goBack() {
    animationController.value = 0;
    animationController.forward();
    if (currentItemIndex != 0) {
      currentItemIndex--;
    } else {
      widget.myPageController.animateToPage(-1 + widget.currentPageIndex,
          duration: Duration(milliseconds: 200), curve: Curves.ease);
    }
  }

  void goNext() {
    animationController.value = 0;
    animationController.forward();
    if (currentItemIndex != 3) {
      currentItemIndex++;
    } else {
      if (widget.currentPageIndex != 4) {
        widget.myPageController.animateToPage(1 + widget.currentPageIndex,
            duration: Duration(milliseconds: 200), curve: Curves.ease);
      } else {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.black26,
          ),
          Center(
            child: IndexedStack(
                index: currentItemIndex,
                children: images
                    .asMap()
                    .map((i, image) {
                      return MapEntry(
                        i,
                        Image.network(
                          images[i],
                          fit: BoxFit.fitWidth,
                        ),
                      );
                    })
                    .values
                    .toList()),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(onTap: () {
                  setState(() {
                    goBack();
                  });
                }),
              ),
              Expanded(
                child: GestureDetector(onTap: () {
                  /// modoru

                  setState(() {
                    goNext();
                  });
                }),
              )
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                Container(
                  height: 2,
                  child: Row(
                      children: images
                          .asMap()
                          .map((i, image) {
                            return MapEntry(
                                i,
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    child: LinearProgressIndicator(
                                      backgroundColor: const Color.fromRGBO(
                                          255, 255, 255, 0.5),
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                              Colors.white),
                                      value: (i == currentItemIndex)
                                          ? indicatorAnimation.value
                                          : (i > currentItemIndex) ? 0 : 1,
                                    ),
                                  ),
                                ));
                          })
                          .values
                          .toList()),
                ),
                Row(
                  children: <Widget>[
                    Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://basketballking.jp/wp-content/uploads/2019/12/E3A48814-B187-4E91-9DFC-1BADE313B9C1-500x375.jpeg",
                                ),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("KingJames"),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        fit: StackFit.expand,
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    animationController.stop();
    super.dispose();
  }
}

class StoryContentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }
}
