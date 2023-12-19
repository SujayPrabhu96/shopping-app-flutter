import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ['All', 'Adidas', 'Nike', 'Bata'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50),
        ));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Shoes\nCollection',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border),
                ))
              ],
            ),
            SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        child: Chip(
                          side: const BorderSide(
                              color: Color.fromRGBO(245, 247, 249, 1)),
                          backgroundColor: selectedFilter == filter
                              ? Theme.of(context).colorScheme.primary
                              : const Color.fromRGBO(245, 247, 249, 1),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          label: Text(filter),
                          labelStyle: const TextStyle(
                            fontSize: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    );
                  },
                )),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    title: '${product['title']} ${product['company']}',
                    price: product['price'] as double,
                    imageUrl: product['imageUrl'] as String,
                    backgroundColor: index.isOdd
                        ? const Color.fromRGBO(245, 247, 249, 1)
                        : Colors.blue.shade100,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
