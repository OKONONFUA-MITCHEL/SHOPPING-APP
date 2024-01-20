import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/product_card.dart';
import 'package:shopping_app/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Nike', 'Addidas', 'Balenciaga'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
    );

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                child: Text(
                  ' SHOES\nSHUFFLE',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Expanded(
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'search',
                        border: border,
                        enabledBorder: border,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(240, 239, 239, 1),
                      label: Text(filter),
                      side: const BorderSide(
                        color: Color.fromRGBO(240, 239, 239, 1),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          40,
                        ),
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 17,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsPage(product: product);
                        },
                      ),
                    );
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imagesurl'] as String,
                    backgroundColor: index.isEven == true
                        ? const Color.fromARGB(255, 203, 255, 252)
                        : const Color.fromARGB(255, 230, 230, 230),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
