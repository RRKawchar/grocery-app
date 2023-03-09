import 'package:flutter/material.dart';
import 'package:grocery_app/component/drawer_side.dart';
import 'package:grocery_app/component/single_product.dart';
import 'package:grocery_app/providers/product_provider.dart';
import 'package:grocery_app/screen/details/details_screen.dart';
import 'package:grocery_app/screen/search/search_screen.dart';
import 'package:grocery_app/utility/constants.dart';
import 'package:grocery_app/widget/textWidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductProvider productProvider = ProductProvider();

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchHerbsProduct();
    productProvider.fetchFruit();
    productProvider.fetchVegetable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const DrawerSide(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffd6b738),
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 17, color: Colors.black),
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: circleBg,
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  SearchScreen(search: productProvider.getAllProductSearch,)));
                },
                icon: const Center(
                  child: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.black,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: circleBg,
              child: Icon(
                Icons.shop,
                size: 17,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://static.vecteezy.com/system/resources/thumbnails/002/377/841/small/vegetables-and-fruits-arrangement-with-black-space-free-photo.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 110),
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                height: 50,
                                width: 80,
                                decoration: const BoxDecoration(
                                  color: Color(0xffd6b738),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                ),
                                child: TextWidget(
                                  text: 'Grocery',
                                  size: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  shadow: const [
                                    BoxShadow(
                                        blurRadius: 4, offset: Offset(2, 2))
                                  ],
                                )),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "30% off",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "On all vegetable products",
                              maxLines: 2,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Herbs seasonings"),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(search: productProvider.getHerbsProduct)));
                    },
                    child: const Center(
                      child: Text(
                        "View all",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      productProvider.herbProductList.length, (index) {
                final data = productProvider.herbProductList[index];
                return SingleProduct(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            productImage: data.productImage.toString(),
                            productName: data.productName.toString(),
                            productPrice: data.productPrice,
                          ),
                        ));
                  },
                  productId: data.productId,
                  productImage: data.productImage.toString(),
                  productName: data.productName.toString(),
                  productPrice: data.productPrice.toInt(),

                );
              })),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Fresh Fruits"),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(search: productProvider.freshList)));
                    },
                    child: const Center(
                      child: Text(
                        "View all",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(productProvider.freshList.length, (index){
                  final data= productProvider.freshList[index];
                  return  SingleProduct(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  DetailsScreen(
                              productImage:
                              data.productImage,
                              productName: data.productName,
                              productPrice: data.productPrice,
                            ),
                          ));
                    },
                    productId: data.productId,
                    productImage:
                    data.productImage,
                    productName: data.productName,
                    productPrice: data.productPrice,
                  );
                })


              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const Text("root vegetable"),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(search: productProvider.vegetableList)));
                    },
                    child: const Center(
                      child: Text(
                        "View all",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(productProvider.vegetableList.length, (index) {
                   final data=productProvider.vegetableList[index];
                  return SingleProduct(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(
                          productName: data.productName,
                          productImage: data.productImage,
                          productPrice: data.productPrice
                      )));
                    },
                    productId: data.productId,
                    productImage:
                    data.productImage.toString(),
                    productName: data.productName.toString(),
                    productPrice: data.productPrice.toInt(),
                  );
                })


              ),
            )
          ],
        ),
      ),
    );
  }
}
