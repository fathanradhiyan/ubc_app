import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:ubc_app/home_live_match.dart';
import './home_live_match.dart';
import 'final_score.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_){
    runApp(PageHome());
  });
  // runApp(new MaterialApp(
  //   title: "page_home",
  //   home: new PageHome(),
  // ));
}

class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  //for carouselSlider
  int _current = 0;
  List imgList = [
    'https://s.yimg.com/ny/api/res/1.2/bo8jFrCNqxY9gPAGMbLkcA--~A/YXBwaWQ9aGlnaGxhbmRlcjtzbT0xO3c9NDUwO2g9MzI5/http://media.zenfs.com/en_us/News/Reuters/2017-10-19T061359Z_1_LYNXMPED9I0DF-OCASP_RTROPTP_2_CSPORTS-US-BASKETBALL-NBA-HIGHLIGHTS.JPG',
    'https://wallpapercave.com/wp/wp2415922.jpg',
    'https://cutewallpaper.org/21/dominique-wilkins-wallpaper/Michael-Jordan-Wallpaper-Slam-Dunk-68-images-.jpg',
    'https://www.cleveland19.com/resizer/i41TzeH0NEZzoq_XhyWEB-Jr23I=/1200x600/arc-anglerfish-arc2-prod-raycom.s3.amazonaws.com/public/2ENIZTSQSNDVFM75XPHFWBC554.jpg',
    'https://img.bleacherreport.net/img/images/photos/003/836/280/hi-res-2d3c4cf33a104fc8fa28cd18b317c4f4_crop_north.jpg?h=533&w=800&q=70&crop_x=center&crop_y=top',
    'https://static.timesofisrael.com/www/uploads/2020/01/AP_16105145991987.jpg',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  //for recent match list
//  List<int> item = new List();
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//
//    for (int i = 0; i < 1; i++) {
//      item.add(i);
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Home'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //Text('UBC NEWS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, fontFamily: 'serif')),
                CarouselSlider(
                  height: 220.0,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                  reverse: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  pauseAutoPlayOnTouch: Duration(seconds: 5),
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  items: imgList.map((imgUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: imgUrl,
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(imgList, (index, url) {
                    return Container(
                      width: 5.0,
                      height: 5.0,
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Colors.indigo[900]
                            : Colors.grey[200],
                      ),
                    );
                  }),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: 160,
                  width: double.maxFinite,
                  // child: RaisedButton(
//                onPressed: (){
//                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LiveMatch()));
//                },
                  child: FittedBox(
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LiveMatch()));
                      },
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerRight,
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(left: 10, top: 5),
                                    child: Row(
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            //Team A Logo
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  Icons.account_box,
                                                  color: Colors.indigo,
                                                  size: 80,
                                                ),
                                              ),
                                            ),

                                            //Team A Name
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: new Text('Home Team'),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            //keterangan
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0,
                                                  top: 30.0,
                                                  right: 15.0),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text('ONGOING'),
                                              ),
                                            ),

                                            //jam tanding
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0, right: 15.0),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: new Text(
                                                  '00:00 WIB',
                                                  style: new TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 20.0),
                                                ),
                                              ),
                                            ),

                                            //tanggal tanding
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0,
                                                  right: 15.0,
                                                  bottom: 30.0),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: new Text('Mon, 29/4'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            //Team B Logo
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15.0),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  Icons.account_box,
                                                  color: Colors.redAccent,
                                                  size: 80,
                                                ),
                                              ),
                                            ),

                                            //Team B Name
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15.0),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: new Text('Away Team'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                //recent match
                Column(
                  children: <Widget>[
                    Text(
                      'Recent Match',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

        ListTile(
          leading: Icon(
            Icons.assignment_turned_in,
            color: Colors.green,
          ),
          title: Text('Home Team - Away Team'),
          subtitle: Text('Final Score : 23 - 24'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> FinalScore()));
          },
        ),

//                    ListView.builder(
//                        itemCount: item.length,
//                        itemBuilder: (BuildContext context, int index) {
//                          return ListTile(
//                            leading: Icon(
//                              Icons.assignment_turned_in,
//                              color: Colors.green,
//                            ),
//                            title: Text('Home Team - Away Team'),
//                            subtitle: Text('Final Score : 23 - 24'),
//                            trailing: Icon(Icons.keyboard_arrow_right),
//                            onTap: () {},
//                          );
//                        }),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
