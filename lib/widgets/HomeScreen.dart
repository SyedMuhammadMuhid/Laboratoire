import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indexed_list_view/indexed_list_view.dart';
import 'package:provider/provider.dart';
import 'package:sample_screen/Constant/Constants.dart';
import 'package:sample_screen/Constant/data.dart';
import 'package:sample_screen/Models/User_Data_Model.dart';
import 'package:sample_screen/Popups/Motivation_popup.dart';
import 'package:sample_screen/Popups/Notifications.dart';
import 'package:sample_screen/Screens/Notification_Screen.dart';
import 'package:sample_screen/Screens/Profile.dart';
import 'package:sample_screen/Services/Auth_Services.dart';
import 'package:sample_screen/Services/database.dart';
import 'package:sample_screen/widgets/Days.dart';
import 'package:sample_screen/widgets/checkbox_locution.dart';
import 'package:sample_screen/widgets/checkbox_mechanism.dart';
import 'package:sample_screen/widgets/checkbox_pain.dart';
import 'package:sample_screen/widgets/checkbox_self_confidence.dart';
import 'package:sample_screen/widgets/checkbox_sleep.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pain_check = [false, false, false, false, false];
  bool self_confidence_check = false;
  bool sleep_check = false;
  bool locution_check = false;
  bool mechanism_check = false;
  BuildContext my_context;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PushNotificationsManager().init();
    print('I am init state of home screen, I was run');
  }

  @override
  Widget build(BuildContext context) {

    my_context = context;
    final user = Provider.of<User>(context,listen: false);

    uid_constant =  user.uid;
    print('myuid $uid_constant');
    double size = MediaQuery.of(context).size.width / 2.5;
    double TWO_PI = 3.14 * 2;
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          UserData userdata = snapshot.data;
          F_Name = userdata.F_Name;
          L_Name = userdata.L_Name;
          Image_url = userdata.Image_url;

          int Day_index = (Timestamp.now()
              .toDate()
              .difference(userdata.Start_date.toDate())
              .inDays);
          index_of_the_day_constant = Day_index;
          print(Day_index.toString() + "its is the DAy index");

          IndexedScrollController controller = IndexedScrollController(
              initialIndex: Day_index, initialScrollOffset: 0);

          return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('UserData')
                  .doc(uid_constant)
                  .collection('Points')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();

                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/all_app.png"),
                          fit: BoxFit.cover)),
                  child: SafeArea(
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: SingleChildScrollView(
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ProfileScreen()));
                                            },
                                            child: Icon(
                                              Icons.menu,
                                              color: Colors.white,
                                              size: 55,
                                            )),
                                      ),
                                      Text(
                                        'Actions',
                                        style: GoogleFonts.heebo(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          NotificationScreen()));
                                            },
                                            child: CircleAvatar(
                                              child: Badge(
                                                  badgeContent: Text(
                                                    '2',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  child: Icon(
                                                    Icons.notifications_none,
                                                    color: Colors.white,
                                                    size: 35,
                                                  )),
                                              backgroundColor:
                                                  Color(0xffFF999A),
                                              radius: 25,
                                            )),
                                      )
                                    ]),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    TweenAnimationBuilder(
                                        tween: Tween(
                                            begin: 0.0,
                                            end: snapshot.data.docs[Day_index]
                                                    ["TotalPoints"] /
                                                100),
                                        duration: Duration(seconds: 4),
                                        builder: (context, value, child) {
                                          // percentage to show in Center Text
                                          int percentage = (value * 100).ceil();
                                          return Container(
                                            width: size,
                                            height: size,
                                            child: Stack(
                                              children: [
                                                ImageIcon(
                                                  AssetImage(
                                                      'assets/dotted.png'),
                                                  color: Colors.white,
                                                  size: size,
                                                ),
                                                ShaderMask(
                                                  shaderCallback: (rect) {
                                                    return SweepGradient(
                                                        startAngle: 0.0,
                                                        endAngle: TWO_PI,
                                                        stops: [
                                                          value,
                                                          value
                                                        ], // value from Tween Animation Builder
                                                        // 0.0 , 0.5 , 0.5 , 1.0
                                                        center:
                                                            Alignment.center,
                                                        colors: [
                                                          Colors.yellow,
                                                          Colors.transparent
                                                        ]).createShader(rect);
                                                  },
                                                  child: Container(
                                                    width: size,
                                                    height: size,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.yellow),
                                                  ),
                                                ),
                                                Center(
                                                  child: Container(
                                                    width: size - 18,
                                                    height: size - 18,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffA3D5D9),
                                                        shape: BoxShape.circle),
                                                  ),
                                                ),
                                                Center(
                                                  child: CircleAvatar(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15.0),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            'POINTS',
                                                            style: GoogleFonts.heebo(
                                                                fontSize: 18,
                                                                color: Color(
                                                                    0xffF5FBFC)),
                                                          ),
                                                          Text(
                                                            snapshot
                                                                .data
                                                                .docs[Day_index]
                                                                    [
                                                                    "TotalPoints"]
                                                                .toString(),
                                                            style: GoogleFonts.heebo(
                                                                fontSize: 30,
                                                                color: Color(
                                                                    0xffF5FBFC)),
                                                          ),
                                                          Center(
                                                              child: Text(
                                                                  "$percentage" +
                                                                      " %",
                                                                  style: GoogleFonts.heebo(
                                                                      fontSize:
                                                                          11,
                                                                      color: Color(
                                                                          0xffF5FBFC))))
                                                        ],
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        Color(0xffFF6766),
                                                    radius: 59,
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    TweenAnimationBuilder(
                                        tween: Tween(
                                            begin: 0.0,
                                            end: ((100 /
                                                        userdata
                                                            .Total_duration) *
                                                    (Day_index + 1)) /
                                                100),
                                        duration: Duration(seconds: 4),
                                        builder: (context, value, child) {
                                          // percentage to show in Center Text
                                          int percentage = (value * 100).ceil();
                                          return Container(
                                            width: size,
                                            height: size,
                                            child: Stack(
                                              children: [
                                                ImageIcon(
                                                  AssetImage(
                                                      'assets/dotted.png'),
                                                  color: Colors.white,
                                                  size: 200,
                                                ),
                                                ShaderMask(
                                                  shaderCallback: (rect) {
                                                    return SweepGradient(
                                                        startAngle: 0.0,
                                                        endAngle: TWO_PI,
                                                        stops: [
                                                          value,
                                                          value
                                                        ], // value from Tween Animation Builder
                                                        // 0.0 , 0.5 , 0.5 , 1.0
                                                        center:
                                                            Alignment.center,
                                                        colors: [
                                                          Colors.yellow,
                                                          Colors.transparent
                                                        ]).createShader(rect);
                                                  },
                                                  child: Container(
                                                    width: size,
                                                    height: size,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.yellow),
                                                  ),
                                                ),
                                                Center(
                                                  child: Container(
                                                    width: size - 18,
                                                    height: size - 18,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffA3D5D9),
                                                        shape: BoxShape.circle),
                                                  ),
                                                ),
                                                Center(
                                                  child: CircleAvatar(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15.0),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            'JOURS',
                                                            style: GoogleFonts.heebo(
                                                                fontSize: 18,
                                                                color: Color(
                                                                    0xffF5FBFC)),
                                                          ),
                                                          Text(
                                                            userdata.Total_duration
                                                                .toString(),
                                                            style: GoogleFonts.heebo(
                                                                fontSize: 30,
                                                                color: Color(
                                                                    0xffF5FBFC)),
                                                          ),
                                                          Center(
                                                              child: Text(
                                                                  "$percentage" +
                                                                      " %",
                                                                  style: GoogleFonts.heebo(
                                                                      fontSize:
                                                                          11,
                                                                      color: Color(
                                                                          0xffF5FBFC)))),
                                                        ],
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        Color(0xffFF6766),
                                                    radius: 59,
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                                Stack(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0,
                                        bottom: 8.0,
                                        right: 25.0,
                                        top: 25.0),
                                    child: SingleChildScrollView(
                                      child: Container(
                                        height: tapped == false ? 130 : 1690,
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    3) *
                                                2.3,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35)),
                                          ),
                                          elevation: 0,
                                          color: Color(0xffF5FBFC),
                                          child: Column(
                                            children: [
                                              Center(
                                                  child: Text(
                                                'Comment ca Va?',
                                                style: GoogleFonts.heebo(
                                                    fontSize: 20,
                                                    color: Color(0xff41B4C7)),
                                              )),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Image(
                                                      image: AssetImage(
                                                          'assets/happy1.png'),
                                                      height: 70,
                                                      width: 70,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Image(
                                                      image: AssetImage(
                                                          'assets/happy2.png'),
                                                      height: 70,
                                                      width: 140,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  )
                                                ],
                                              ),
                                              Container(
                                                height:
                                                    tapped == false ? 0 : 1560,
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Image(
                                                            image: AssetImage(
                                                                'assets/pain.png'),
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text(
                                                            'Pain',
                                                            style: GoogleFonts
                                                                .heebo(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .black87),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 270,
                                                      child: ListView.builder(
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount: Pain.length,
                                                        // itemCount: _categories.length,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Checkbox_pain(
                                                              value:
                                                                  Pain[index]);
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Image(
                                                            image: AssetImage(
                                                                'assets/self_confidence.png'),
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text(
                                                            'Self Confidence',
                                                            style: GoogleFonts
                                                                .heebo(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .black87),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 215,
                                                      child: ListView.builder(
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount:
                                                            Self_con.length,
                                                        // itemCount: _categories.length,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Checkbox_self_confidence(
                                                              value: Self_con[
                                                                  index]);
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Image(
                                                            image: AssetImage(
                                                                'assets/sleep.png'),
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text(
                                                            'Sleep',
                                                            style: GoogleFonts
                                                                .heebo(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .black87),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 215,
                                                      child: ListView.builder(
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount: Sleep.length,
                                                        // itemCount: _categories.length,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Checkbox_sleep(
                                                              value:
                                                                  Sleep[index]);
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Image(
                                                            image: AssetImage(
                                                                'assets/locution.png'),
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text(
                                                            'Locution',
                                                            style: GoogleFonts
                                                                .heebo(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .black87),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 200,
                                                      child: ListView.builder(
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount:
                                                            Locution.length,
                                                        // itemCount: _categories.length,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Checkbox_locution(
                                                              value: Locution[
                                                                  index]);
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Image(
                                                            image: AssetImage(
                                                                'assets/mechanism.png'),
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text(
                                                            'Mechanism',
                                                            style: GoogleFonts
                                                                .heebo(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .black87),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 100,
                                                      child: ListView.builder(
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount:
                                                            Mechanism.length,
                                                        // itemCount: _categories.length,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Checkbox_mechanism(
                                                              value: Mechanism[
                                                                  index]);
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          tapped = false;
                                                        });
                                                      },
                                                      child: Image(
                                                        image: AssetImage(
                                                            'assets/dropdown_btn.png'),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 55,
                                      left:
                                          ((MediaQuery.of(context).size.width /
                                                      3) *
                                                  2.3) -
                                              20,
                                      child: CircleAvatar(
                                          radius: 35,
                                          backgroundColor: Color(0xffF5FBFC),
                                          child: GestureDetector(
                                            onTap: () {
                                              tapped = !tapped;
                                              setState(() {
                                                print('i am tapped' +
                                                    tapped.toString());
                                              });
                                              if (Mid == 0) {
                                                if ((index_of_the_day_constant +
                                                        1) ==
                                                    (userdata.Total_duration /
                                                            2)
                                                        .ceil()) {
                                                  Motivation_popup(
                                                      my_context, -1, "", 100);
                                                } else {
                                                  Motivation_popup(my_context,
                                                      -1, "", Init2);
                                                }

                                                Mid++;
                                              }
                                            },
                                            child: CircleAvatar(
                                              child: Icon(
                                                tapped == false
                                                    ? Icons.add
                                                    : Icons.remove,
                                                color: Color(0xffF5FBFC),
                                              ),
                                              backgroundColor:
                                                  Color(0xff41B4C7),
                                            ),
                                          ))),
                                ]),
                                Container(
                                  height: tapped == false ? 1100 : 0,
                                  child: StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('UserData')
                                          .doc(uid_constant)
                                          .collection('Points')
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData)
                                          return Container();

                                        return IndexedListView.builder(
                                            controller: controller,
                                            //  return ListView.builder(
                                            physics: ClampingScrollPhysics(),
                                            minItemCount: 0,
                                            maxItemCount:snapshot.data==null?0:
                                                snapshot.data.docs.length - 1,
                                            // itemCount: snapshot.data.docs.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              print(snapshot
                                                      .data
                                                      .docs[index]
                                                          ["TotalPoints"]
                                                      .toString() +
                                                  " data from stuff from day " +
                                                  index.toString());
                                              return Dayswid(
                                                document:
                                                    snapshot.data.docs[index],
                                                index_of_day: index,
                                                total_hour_point_of_the_day:
                                                    snapshot.data.docs[index]
                                                        ["HourPoints"],
                                                total_point_of_the_day: snapshot
                                                    .data
                                                    .docs[index]["TotalPoints"],
                                                document_id: snapshot.data
                                                    .docs[index].documentID,
                                                Date_from_database: userdata
                                                        .Start_date.toDate()
                                                    .add(Duration(days: index)),
                                                Context: my_context,
                                              );
                                            });
                                      }),
                                  /*Stack(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left:25.0, top: 0.0),
                             child: Container(
                               height: tapped==false?150:0,
                               width: tapped==false?320:0,
                               child:
                               Card(
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(35)),
                                   ),
                                   elevation: 0,
                                   color: Colors.lightBlue[50],
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 20, top: 20),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text('23 octobre 2020', style: GoogleFonts.heebo(fontSize: 15, color: Color(0xff5fc9ed)),),
                                     Text('Jour 2', style: GoogleFonts.heebo(fontSize: 35, color: Color(0xff5fc9ed)),),

                                   ],
                                 ),
                               ),

                               ),),
                           ),
                           Padding(
                           padding: const EdgeInsets.only(left:25.0, bottom: 25.0, right:25.0, top: 80),
                           child: Container(
                               height: tapped==false?600:0,
                               width: tapped==false?320:0,
                               child:
                               Card(
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(35)),
                                 ),
                                 elevation: 0,
                                 color: Colors.lightBlue[50],
                                 child:
                                     ListView.builder(

                                       physics: BouncingScrollPhysics(),
                                       itemCount:5,
                                       // itemCount: _categories.length,
                                       scrollDirection: Axis.vertical,
                                       itemBuilder: (BuildContext context, int index){
                                         return FaireCard(

                                         );

                                       },
                                     )
                               )),
                         ),
                       ]),*/
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
