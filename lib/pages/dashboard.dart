import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../main.dart';
import '../models/sneaker.dart';
import '../utils/utils.dart';
import '../widgets/app.dart';
import '../widgets/carousel.dart';

class T10Dashboard extends StatefulWidget {
  static String tag = '/dashboard_shop';

  final bool isDirect;

  T10Dashboard({this.isDirect = false});

  @override
  T10DashboardState createState() => T10DashboardState();
}

class T10DashboardState extends State<T10Dashboard> {
  var currentIndexPage = 0;
  late List<T10Images> mSliderList;
  late List<T10Product> mDashboardList;

  @override
  void initState() {
    super.initState();
    mSliderList = getDashboard(5000);
    mDashboardList = getDashboardProducts(5000);
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.grey.shade100);
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            T10TopBar("Dashboard", isDirect: widget.isDirect),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 16.0),
                    Container(
                      //height: context.height() + 100,
                      height: 250,
                      child: T10CarouselSlider(
                        viewportFraction: 0.9,
                        //height: context.height() + 100,
                        height: 250,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        items: mSliderList.map((slider) {
                          return Builder(
                            builder: (BuildContext context) {
                              return ClipRRect(
                                borderRadius: new BorderRadius.circular(12.0),
                                child: Image.asset(
                                    "assets/images/t10_slider_2.jpg"

                                    // placeholder: CircularProgressIndicator()
                                    //     as Widget Function(BuildContext, String)?,
                                    // imageUrl: slider.img,
                                    // fit: BoxFit.cover,
                                    // width: context.width(),
                                    // height: context.height() * 0.9,
                                    ),
                              );
                            },
                          );
                        }).toList(),
                        onPageChanged: (index) {
                          setState(() {
                            currentIndexPage = index;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Container(
                      margin: EdgeInsets.only(left: 16.0, right: 16.0),
                      color: context.scaffoldBackgroundColor,
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: mDashboardList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                                child: Image.asset(
                                  "assets/images/t10_watch.jpg",
                                  fit: BoxFit.cover,
                                  height: context.height() * 0.2,
                                  width: context.width(),
                                ),
                                // CachedNetworkImage(
                                //   // placeholder: CircularProgressIndicator()
                                //   //     as Widget Function(BuildContext, String)?,
                                //   //placeholder: const CircularProgressIndicator(),
                                //   imageUrl: mDashboardList[index].img,
                                //   fit: BoxFit.cover,
                                //   height: context.height() * 0.2,
                                //   width: context.width(),
                                // ),
                              ),
                              text(mDashboardList[index].name,
                                  textColor: Colors.black,
                                  fontFamily: 'Medium',
                                  fontSize: 10),
                              Row(
                                children: <Widget>[
                                  text(mDashboardList[index].price,
                                      textColor: Colors.black, fontSize: 10),
                                  // SizedBox(
                                  //   width: 2.0,
                                  // ),
                                  // text(mDashboardList[index].subPrice,
                                  //     textColor: Colors.black,
                                  //     fontSize: 10,
                                  //     lineThrough: true)
                                ],
                              )
                            ],
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class T10TopBar extends StatefulWidget {
  var titleName;
  final isDirect;

  T10TopBar(var this.titleName, {this.isDirect = false});

  @override
  State<StatefulWidget> createState() {
    return T10TopBarState(isDirect: isDirect);
  }
}

class T10TopBarState extends State<T10TopBar> {
  final isDirect;

  T10TopBarState({this.isDirect = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        color: Colors.red.shade300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.red.shade200,
              onPressed: () {
                if (isDirect) {
                  // ProKitLauncher().launch(context,
                  //     isNewTask: true,
                  //     pageRouteAnimation: PageRouteAnimation.Fade);
                } else {
                  finish(context);
                }
              },
            ),
            Center(
              child: text(
                widget.titleName,
                fontFamily: 'roboto',
                textColor: Colors.black,
                fontSize: 20,
              ),
            ),
            SvgPicture.asset("assets/images/theme10/t10_ic_search.svg",
                    color: Colors.black)
                .paddingOnly(right: 16),
          ],
        ),
      ),
    );
  }
}
