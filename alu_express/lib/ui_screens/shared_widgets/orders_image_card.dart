import 'package:alu_express/services/temp_res/order_data.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatefulWidget {
  final String image;
  final String ordernumber;
  final String time;
  final String orderid;
  const ImageCard(
      {Key key, this.image, this.ordernumber, this.time, this.orderid})
      : super(key: key);

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  final List<String> sidelist = ['apple', 'banana', 'orange', 'lemon'];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _bottomSheet(
            image: widget.image,
            title: widget.orderid,
            rating: 2.toDouble(),
            remaining: 20.toDouble(),
            sidelist: sidelist);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width * 0.99,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.16,
                width: MediaQuery.of(context).size.width * 0.60,
                child: Image.network(
                  widget.image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.033,
                ),
                Text(
                  "Order #23",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "PTSans"),
                ),
                Text(
                  "10.20",
                  style: TextStyle(color: Colors.grey),
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange,
                      onPrimary: Colors.black, // foreground
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      'View',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "PTSans"),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  void _bottomSheet(
      {String image,
      String title,
      double rating,
      double remaining,
      List<String> sidelist}) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Stack(
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: Image.network(
                                image,
                                fit: BoxFit.cover,
                              )),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text("$remaining"),
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Order #23",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "PTSans"),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: servings.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(
                            servings[index]["quantity"].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "PTSans"),
                          ),
                          title: Text(
                            '${servings[index]["title"]}: (${servings[index]["type"]})',
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "PTSans"),
                          ),
                          subtitle: Text(
                            servings[index]["sides"],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: "PTSans"),
                          ),
                          trailing: Text(
                            "Kelvin",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "PTSans"),
                          ),
                          selected: true,
                          isThreeLine: true,
                        );
                      },
                    ),
                  ),
                  InkWell(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.deepOrange,
                            onPrimary: Colors.black, // foreground
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            'Accept',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "PTSans"),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.deepOrangeAccent[700],
                            onPrimary: Colors.black, // foreground
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            'Decline',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "PTSans"),
                          ))
                    ],
                  ))
                ]),
          );
        });
  }

  Widget listOfdressing(List<String> item) {
    List<Widget> list = List<Widget>();
    for (var i = 0; i < item.length; i++) {
      list.add(Container(
          child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          item[i],
        ),
      )));
    }
    return Wrap(
        spacing: 5.0, // gap between adjacent chips
        runSpacing: 2.0, // gap between lines
        children: list);
  }
}
