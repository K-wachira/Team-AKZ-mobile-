import 'package:alu_express_student/ui_screens/Models/food_model.dart';
import 'package:alu_express_student/ui_screens/cart.dart';
import 'package:alu_express_student/ui_screens/food_fetch.dart';
import 'package:alu_express_student/ui_screens/home_products.dart';
import 'package:alu_express_student/ui_screens/products_details.dart';
import 'package:alu_express_student/ui_screens/student_profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:alu_express_student/ui_screens/size_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  final uid;
  const HomePage({Key key, this.uid}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // Menu(uid: widget.userid,
  List<Widget> pages = [
    Cart(), StudentProfile() // TODO:
  ];

  List<FoodModel> foodList = [];

  @override
  Widget productContainer(
      {@required String ImageURL,
      @required String FoodName,
      @required String Price,
      @required String Description}) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: displayHeight(context) * 0.5,
        width: displayWidth(context) * 0.5,
        decoration: BoxDecoration(
          color: Colors.red[900].withOpacity(.06),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 5)),
            CircleAvatar(
              radius: displayWidth(context) * 0.15,
              backgroundImage: AssetImage(ImageURL),
            ),
            ListTile(
              leading: Text(
                FoodName,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              trailing: Text(
                Price,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: displayWidth(context) * 0.4,
              child: Text(Description),
            )
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.sort,
              color: Colors.black,
            ),
            onPressed: () {}),
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: displayHeight(context) * 0.03,
            left: displayWidth(context) * 0.03,
            right: displayWidth(context) * 0.03,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: displayWidth(context) * 0.7,
                  child: Text(
                    "Order your favourite meals below",
                    style: GoogleFonts.ptSans(
                        fontSize: 25,
                        color: Colors.red[900],
                        fontWeight: FontWeight.bold,
                        letterSpacing: .3),
                  ),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.03,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Click on a product to view the full details",
                  style: GoogleFonts.ptSans(
                      fontSize: 18, color: Colors.black54, letterSpacing: .3),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.03,
              ),
              Container(
                height: displayHeight(context),
                child: GridView.count(
                  shrinkWrap: false,
                  primary: false,
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    productContainer(
                        ImageURL: 'assets/bkg.jpg',
                        FoodName: 'Stir Fry Rice',
                        Price: 'RWF 2500',
                        Description:
                            'Vegetable Rice with peas, green beans and a side of your choice'),
                    productContainer(
                        ImageURL: 'assets/bkg.jpg',
                        FoodName: 'Stir Fry Rice',
                        Price: 'RWF 2500',
                        Description:
                            'Vegetable Rice with peas, green beans and a side of your choice'),
                    productContainer(
                        ImageURL: 'assets/bkg.jpg',
                        FoodName: 'Stir Fry Rice',
                        Price: 'RWF 2500',
                        Description:
                            'Vegetable Rice with peas, green beans and a side of your choice'),
                    productContainer(
                        ImageURL: 'assets/bkg.jpg',
                        FoodName: 'Stir Fry Rice',
                        Price: 'RWF 2500',
                        Description:
                            'Vegetable Rice with peas, green beans and a side of your choice'),
                    productContainer(
                        ImageURL: 'assets/bkg.jpg',
                        FoodName: 'Stir Fry Rice',
                        Price: 'RWF 2500',
                        Description:
                            'Vegetable Rice with peas, green beans and a side of your choice'),
                    productContainer(
                        ImageURL: 'assets/bkg.jpg',
                        FoodName: 'Stir Fry Rice',
                        Price: 'RWF 2500',
                        Description:
                            'Vegetable Rice with peas, green beans and a side of your choice')
                  ],
                ),
              )
            ],
          )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
            child: GNav(
                rippleColor: Colors.grey[300],
                hoverColor: Colors.grey[100],
                gap: 8,
                activeColor: Colors.red[900],
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100],
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.shoppingCart,
                    text: 'Cart',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
