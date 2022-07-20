import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letshare/model/challenge_model.dart';
import 'package:letshare/model/user_model.dart';
import 'package:letshare/screen/challenge.dart';
import 'package:letshare/screen/detail.dart';
import 'package:letshare/screen/login.dart';
import 'package:thebrioflashynavbar/thebrioflashynavbar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  ChallengeModel detailInChallenge = ChallengeModel();
  void initState() {
    super.initState();
    getinfo();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    // Navigator.pop(context);  // pop current page
    // Navigator.push(
    //                                   context,
    //                                   MaterialPageRoute(
    //                                       builder: (context) => Homescreen()));
  }

  

  List<String> name = [];
  List<String> photo = [];
  List<String> target = [];
  List<String> end_date = [];
  List<String> province = [];
  List<String> description = [];
  int cc = 0;
  Future getinfo() async {
    var dbpp = FirebaseFirestore.instance.collection('challenge').snapshots();
    QuerySnapshot<Map<String, dynamic>> recpp = await dbpp.first;
    recpp.docs.forEach((e) {
      // print(e.data()['photo']);
      name.add(e.data()['name'].toString());
      photo.add(e.data()['photo'].toString());
      target.add(e.data()['target'].toString());
      end_date.add(e.data()['end_date'].toString());
      province.add(e.data()['province'].toString());
      description.add(e.data()['description'].toString());

      setState(() {});
    });

    // print(name);
    // print(photo);
    // print(target);
    // print(end_date);
    // print(province);
    // print(description);
  }

  

  String dropdownValue = 'END SOON';
  var items = [
    'END SOON',
    'THIS WEEK',
    'THIS MONTH',
    'THIS YEAR',
  ];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    final _formKey = GlobalKey<FormState>();

    final TextEditingController searchController = new TextEditingController();

    final searchField = TextFormField(
      autofocus: false,
      controller: searchController,
      keyboardType: TextInputType.emailAddress,
      style: GoogleFonts.balooTamma(
          textStyle: TextStyle(color: Color.fromARGB(255, 42, 48, 106))),
      onChanged: (value) {},
      onSaved: (value) {
        searchController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: Color.fromARGB(125, 255, 255, 255),
        filled: true,
        suffixIcon: Icon(
          Icons.search,
          color: Color.fromARGB(255, 96, 96, 96),
        ),
        contentPadding: EdgeInsets.fromLTRB(15, 15, 0, 8),
        hintText: "Find a fondation",
        hintStyle:
            GoogleFonts.balooTamma(textStyle: TextStyle(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final mainImage = Image.asset(
      'img/act.jpg',
      fit: BoxFit.cover,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                // height: size.height * 0.2,
                child: Stack(
                    // clipBehavior: Clip.none,
                    children: <Widget>[
                  Container(
                      height: 392,
                      decoration: BoxDecoration(color: Colors.blue)),
                  Container(
                      margin: const EdgeInsets.only(top: 40, left: 30),
                      width: w,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, ${loggedInUser.username}",
                              style: GoogleFonts.balooTamma(
                                  textStyle: TextStyle(
                                      fontSize: 25, color: Colors.white)),
                            ),
                            Text(
                              "Let's start to donating..",
                              style: GoogleFonts.balooTamma(
                                  textStyle: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(255, 230, 230, 230))),
                            ),
                          ])),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 90),
                      child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                              SizedBox(
                                width: 200,
                                child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Challenges()));
                              }, 
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(125, 255, 255, 255),
                                  shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),),
                              child: Text('CREATE CHALLENGE',
                              style: GoogleFonts.balooTamma(
                                                textStyle: TextStyle(
                                                    fontSize: 18,
                                                    color:
                                                        Color.fromARGB(255, 230, 230, 230))),),),
                              ),
                                SizedBox(height: 25),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin:
                          const EdgeInsets.only(top: 220, left: 30, right: 30),
                      width: w,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Categories",
                              style: GoogleFonts.balooTamma(
                                  textStyle: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.all(8),
                                          
                                          child: Column(children: <Widget>[
                                            Image.asset(
                                              'img/stationary.png',
                                             
                                              fit: BoxFit.contain,
                                            
                                            ),
                                            Text(
                                              'stationery',
                                              style: GoogleFonts.balooTamma(
                                                  textStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white)),
                                            )
                                          ]))),
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset(
                                          'img/uniform.png',
                                          fit: BoxFit.contain,
                                        ),
                                        Text(
                                          'uniform',
                                          style: GoogleFonts.balooTamma(
                                              textStyle: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white)),
                                        )
                                      ],
                                    ),
                                  )),
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset(
                                          'img/book.png',
                                          fit: BoxFit.contain,
                                        ),
                                        Text('book',
                                            style: GoogleFonts.balooTamma(
                                                textStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white))),
                                      ],
                                    ),
                                  )),
                                  Expanded(
                                      child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset(
                                          'img/all.png',
                                          fit: BoxFit.contain,
                                        ),
                                        Text(
                                          'see all',
                                          style: GoogleFonts.balooTamma(
                                              textStyle: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white)),
                                        )
                                      ],
                                    ),
                                  )),
                                ])
                          ])),
                ])),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 30),
              width: w,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trending Donation",
                      style: GoogleFonts.balooTamma(
                          textStyle: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 42, 48, 106))),
                    ),
                  ]),
            ),
            Container(
                margin: const EdgeInsets.only(right: 30),
                width: w,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Event",
                        style: GoogleFonts.balooTamma(
                            textStyle: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 255, 255, 255))),
                      ),
                      Column(
                        children: [
                          DropdownButton(
                            value: dropdownValue,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.grey,
                            ),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            style: GoogleFonts.balooTamma(
                                textStyle: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                            underline: Container(
                              height: 1.0,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0))),
                            ),
                          ),
                        ],
                      ),
                    ])),
            Container(
                child: Positioned(
              left: 30,
              right: 30,
              child: Container(
                child: Column(
                  children: <Widget>[
                    ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height,
                          maxWidth: 327,
                        ),
                        child: ListView.builder(
                          itemCount: name.length,
                          itemBuilder: (context, index) {
                            // print('object');
                            // print(name[index]);

                            return Container(
                              height: 150,
                              padding: EdgeInsets.only(bottom: 10),
                              child: Card(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 8,
                                  child: InkWell(
                                    onTap: () {
                                      print(
                                          '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
                                      print(name[index]);
                                      print(
                                          '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Detail(
                                                  name: name[index],
                                                  description:
                                                      description[index],
                                                  province: province[index],
                                                )),
                                      );
                                    },
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.asset(
                                                      'img/act.jpg',
                                                      fit: BoxFit.cover))),
                                          Container(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      name[index],
                                                      style: GoogleFonts
                                                          .balooTamma(
                                                              textStyle: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          88,
                                                                          88,
                                                                          88))),
                                                    ),
                                                    Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 5),
                                                            child: Icon(
                                                              Icons
                                                                  .access_time_outlined,
                                                              color:
                                                                  Colors.black,
                                                              size: 18,
                                                            ),
                                                          ),
                                                          Text(
                                                            end_date[index],
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      135,
                                                                      135,
                                                                      135),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontFamily:
                                                                  'Baloo Tamma 2',
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ]),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 5),
                                                          child: Icon(
                                                            Icons.location_on,
                                                            color: Colors.black,
                                                            size: 16,
                                                          ),
                                                        ),
                                                        Text(
                                                          province[index],
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    135,
                                                                    135,
                                                                    135),
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontFamily:
                                                                'Baloo Tamma 2',
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              height: 5.0,
                                                              width: 160.0,
                                                              decoration: BoxDecoration(
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          231,
                                                                          231,
                                                                          231,
                                                                          100),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30)),
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 10),
                                                              child: Text(
                                                                '0 %',
                                                                style: GoogleFonts.balooTamma(
                                                                    textStyle: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            92,
                                                                            92,
                                                                            92))),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ]))
                                        ],
                                      ),
                                    ),
                                  )),
                            );
                          },
                        )),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
