import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letshare/model/challenge_model.dart';
import 'package:letshare/screen/home.dart';
import 'package:letshare/screen/login.dart';
import 'package:thebrioflashynavbar/thebrioflashynavbar.dart';

class Detail extends StatefulWidget {
  const Detail(
      {Key? key,
      required this.name,
      required this.description,
      required this.province})
      : super(key: key);
  final String name;
  final String description;
  final String province;
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  ChallengeModel details = ChallengeModel();

  @override
  void initState() {
    super.initState();

    print(widget.name);
    print(name.runtimeType);
    print(name.toString());
    print(name.length);
    print(
        "=====================================================================================");

    getinfo();
  }

  String name = "";
  String photo = "";
  String target = "";
  String end_date = "";
  String province = "";
  String description = "";
  int cc = 0;
  Future getinfo() async {
    var dbpp = FirebaseFirestore.instance.collection('challenge').snapshots();
    QuerySnapshot<Map<String, dynamic>> recpp = await dbpp.first;
    print("ass");
    print(name);
    recpp.docs.forEach((e) {
      print("asd");
      if (widget.name == e.data()['name']) {
        print("Yes yes ye sssss");
        name = e.data()['name'].toString();
        photo = e.data()['photo'].toString();
        target = e.data()['target'].toString();
        end_date = e.data()['end_date'].toString();
        province = e.data()['province'].toString();
        description = e.data()['description'].toString();
        print(name);
      } else {
        print("no no no no no");
      }
    });

    // print(name);
    // print(photo);
    // print(target);
    // print(end_date);
    // print(province);
    // print(description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                        child: Image.asset(
                      'img/act.jpg',
                      fit: BoxFit.fitWidth,
                      height: 300,
                      width: 700,
                    )),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homescreen()));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent),
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back_ios),
                              Text('Detail'),
                            ],
                          )),
                    )
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      DetailLocation(
                        name: widget.name,
                        description: widget.description,
                        province: widget.province,
                      ),
                      DonateDetail(),
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 20, bottom: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Image Gallery',
                                  style: Theme.of(context).textTheme.headline2,
                                )),
                            SizedBox(
                                child: Image.asset(
                              'img/act.jpg',
                              fit: BoxFit.fitWidth,
                              height: 150,
                              width: 700,
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // MyHomePage()
              ],
            )));
  }
}

class DetailLocation extends StatefulWidget {
  const DetailLocation(
      {Key? key,
      required this.name,
      required this.description,
      required this.province})
      : super(key: key);
  final String name;
  final String description;
  final String province;
  @override
  State<DetailLocation> createState() => _DetailLocationState();
}

class _DetailLocationState extends State<DetailLocation> {
  ChallengeModel details = ChallengeModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(40.0),
        topRight: const Radius.circular(40.0),
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 100,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 6, 218, 255),
                borderRadius: new BorderRadius.circular(40.0)),
            child: Row(
              children: [
                Icon(Icons.location_on),
                Text(widget.province),
              ],
            ),
          ),
          Text(widget.name, style: Theme.of(context).textTheme.headline1),
          Text(widget.description,
              style: Theme.of(context).textTheme.bodyText2),
          Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              padding: EdgeInsets.only(right: 100),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      height: 8,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  Text('0%')
                ],
              ))
        ],
      ),
    );
  }
}

class DonateDetail extends StatefulWidget {
  const DonateDetail({Key? key}) : super(key: key);
  @override
  State<DonateDetail> createState() => _DonateDetailState();
}

class _DonateDetailState extends State<DonateDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 24,
                    color: Colors.grey,
                  ),
                  Text(
                    'categories',
                    style: GoogleFonts.balooTamma(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Text('Uniform', style: Theme.of(context).textTheme.bodyText1)
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                  Text(
                    'Days left',
                    style: GoogleFonts.balooTamma(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              Text('2', style: Theme.of(context).textTheme.bodyText1)
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.attach_money,
                    size: 22,
                    color: Colors.grey,
                  ),
                  Text(
                    'Donation',
                    style: GoogleFonts.balooTamma(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Text('Feature', style: Theme.of(context).textTheme.bodyText1)
            ],
          ),
        ],
      ),
    );
  }
}
