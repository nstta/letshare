import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String dropdownValue = 'END SOON';
  var items = [
    'END SOON',
    'THIS WEEK',
    'THIS MONTH',
    'THIS YEAR',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    final _formKey = GlobalKey<FormState>();

    // editing controller
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

    const titleText = Padding(
      padding: EdgeInsets.all(5),
      child: Text(
        'Help donate school uniforms',
        style: TextStyle(
          fontFamily: 'Baloo Tamma 2',
          fontSize: 15,
        ),
      ),
    );

    const descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Baloo Tamma 2',
      fontSize: 12,
    );

    // DefaultTextStyle.merge() allows you to create a default text
    // style that is inherited by its child and all subsequent children.
    final time = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.grey, size: 10,),
                const Text('PREP12356:'),
              ],
            ),
          ],
        ),
      ),
    );

    final place = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey, size: 10,),
                const Text('PREP12356:'),
              ],
            ),
          ],
        ),
      ),
    );

    final rightColumn = Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(
        children: [titleText, time, place],
      ),
    );

    final mainImage = Image.asset(
      'img/act.jpg',
      fit: BoxFit.cover,
    );

    return Scaffold(
        // appBar: AppBar(backgroundColor: Color.fromARGB(255, 69, 180, 254)),
        body: Column(children: <Widget>[
      Container(
        // height: size.height * 0.2,
        child: Stack(
          children: <Widget>[
            Container(
              height: 392,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 69, 180, 254)),
            ),
            Container(
                margin: const EdgeInsets.only(top: 40, left: 30),
                width: w,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, Nattamon",
                        style: GoogleFonts.balooTamma(
                            textStyle:
                                TextStyle(fontSize: 25, color: Colors.white)),
                      ),
                      Text(
                        "Let's start to donating..",
                        style: GoogleFonts.balooTamma(
                            textStyle: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 230, 230, 230))),
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
                          searchField,
                          SizedBox(height: 25),
                        ]),
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 220, left: 30, right: 30),
                width: w,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Categories",
                        style: GoogleFonts.balooTamma(
                            textStyle:
                                TextStyle(fontSize: 15, color: Colors.white)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'img/caticon.png',
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  'stationery',
                                  style: GoogleFonts.balooTamma(
                                      textStyle: TextStyle(
                                          fontSize: 12, color: Colors.white)),
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
                                  'img/caticon.png',
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  'uniform',
                                  style: GoogleFonts.balooTamma(
                                      textStyle: TextStyle(
                                          fontSize: 12, color: Colors.white)),
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
                                  'img/caticon.png',
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
                                  'img/caticon.png',
                                  fit: BoxFit.contain,
                                ),
                                Text(
                                  'see all',
                                  style: GoogleFonts.balooTamma(
                                      textStyle: TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                )
                              ],
                            ),
                          )),
                        ],
                      )
                    ])),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 20, left: 30),
        width: w,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Trending Donation",
            style: GoogleFonts.balooTamma(
                textStyle: TextStyle(
                    fontSize: 17, color: Color.fromARGB(255, 42, 48, 106))),
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
                      fontSize: 12, color: Color.fromARGB(255, 255, 255, 255))),
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
                      textStyle: TextStyle(fontSize: 12, color: Colors.grey)),
                  underline: Container(
                    height: 1.0,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.transparent, width: 0.0))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      Container(
        height: 230,
        child: Stack(
          children: [
          Positioned(
              top: 35,
              left: 30,
              right: 30,
              child: Material(
                child: Container(
                  height: 140.0,
                  width: 327,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                       //BoxShadow
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                      child: mainImage,
                      ),
                      Positioned(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Help donate school uniforms'),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.access_time, color: Colors.grey, size: 10,),
                                const Text('PREP12356:'),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.access_time, color: Colors.grey, size: 10,),
                                const Text('PREP12356:'),
                              ],
                            ),
                           Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.access_time, color: Colors.grey, size: 10,),
                                const Text('PREP12356:'),
                              ],
                            )

                          ],
                        ))
                    ],
                  ),
                ),
              )),
        ]),
      )
    ]));
  }
}
