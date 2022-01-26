import 'package:flutter/material.dart';

// ignore: camel_case_types
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

// ignore: camel_case_types
class _CartState extends State<Cart> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  // var colorsCurrentIndex = 0;

  // GlobalKey<scaffoldKey> = new GlobalKey<scaffoldKey>;

  @override
  void initState() {
    // TODO: implement initState
  }

  var i = 0;
  
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          extendBody: true,
          key: scaffoldKey,
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, position) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text('sugar'),
                          subtitle: Text('cost  : free'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      i++;
                                    });
                                  },
                                  icon: Icon(Icons.add)),
                              Text("$i"),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (i <= 0) {
                                      } else {
                                        i--;
                                      }
                                    });
                                  },
                                  icon: Icon(Icons.remove)),
                            ],
                          ),
                        ),
                        Divider()
                      ],
                    );
                  },
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart_sharp),
                      label: Text("اضغط هنا لطلب الطلبية"),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                          minimumSize: const Size(150, 35),
                          primary: const Color.fromARGB(200, 0, 220, 0))))
            ],
          ),
        ));
  }
}
