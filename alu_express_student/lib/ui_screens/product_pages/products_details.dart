import 'package:alu_express_student/ui_screens/shared_widgets/size_helpers.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProductDetails extends StatefulWidget {
  final Map productDetails;
  ProductDetails({@required this.productDetails});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  int _quantity = 1;
  final dateTime = DateTime.now();
  final List cart = [];
  int total = 0;

  Widget build(BuildContext context) {
    int price = int.parse(widget.productDetails["Price"]);
    total = price;
    void _incrementOrder() {
      setState(() {
        _quantity++;
        total = price * _quantity;
        print(total);
      });
    }

    void _decrementOrder() {
      setState(() {
        if (_quantity > 1) {
          _quantity--;
          total = price * _quantity;
          print(total);
        }
      });
    }

    void addToCart(cart, totals, quantity, product) {
      setState(() {
        totals = totals * quantity;
      });
      Map item = {
        "FoodName": product["Name"],
        "Quantity": quantity.toString(),
        "Total": totals.toString(),
        "Vendor": product["Vendor"],
        "Customer": product["Userid"],
        "OrderTime": dateTime,
        "FoodID": product["FoodID"],
        'Category': product['Category']
      };
      setState(() {
        cart.add(item);
        print(cart);
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Center(child: Text(widget.productDetails["Name"])),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productDetails["Name"],
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .3),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.productDetails["Description"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        letterSpacing: .3),
                  )
                ],
              ),
            ),
            Image(
              image: NetworkImage(widget.productDetails["Image"]),
              height: displayHeight(context) * 0.4,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  (total * _quantity).toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: .3),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _incrementOrder();
                        });
                      },
                      icon: Icon(Feather.plus),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        '$_quantity',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .3),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        icon: Icon(Feather.minus),
                        onPressed: () {
                          setState(() {
                            _decrementOrder();
                          });
                        }),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.red[900]),
                  onPressed: () {
                    print(total);
                    addToCart(cart, total, _quantity, widget.productDetails);
                  },
                  icon: Icon(Feather.shopping_cart),
                  label: Text("Add to cart")),
            )
          ],
        ),
      ),
    );
  }
}