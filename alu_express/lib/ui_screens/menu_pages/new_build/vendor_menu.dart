import 'package:alu_express/services/back_end/services.dart';
import 'package:alu_express/services/back_end/vendor_model.dart';
import 'package:alu_express/ui_screens/shared_widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VendorMenu extends StatefulWidget {
  final userid;
  VendorMenu({Key key, this.userid}) : super(key: key);
  @override
  _VendorMenuState createState() => _VendorMenuState();
}

class _VendorMenuState extends State<VendorMenu> {
  final FirebaseServices firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Menu",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: StreamProvider(
        create: (BuildContext context) =>
            firebaseServices.getFoodList(widget.userid),
        child: ViewUserPage(),
      ),
    );
  }
}

class ViewUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List userList = Provider.of<List<VendorModel>>(context);

    return userList == null
        ? CircularProgressIndicator()
        : ListView.builder(
            itemCount: userList.length,
            itemBuilder: (_, int index) => Padding(
                padding: EdgeInsets.all(10.0),
                child: MenuCard(
                  image: userList[index].imageURL,
                  name: userList[index].foodName,
                  price: userList[index].price,
                  category: userList[index].category,
                  description: userList[index].description,
                  discount: userList[index].discount,
                  isFeaured: userList[index].isFeatured,
                  size: userList[index].size,
                  ingredients: userList[index].ingredients,
                  vendor: userList[index].vendor,
                )),
          );
  }
}
