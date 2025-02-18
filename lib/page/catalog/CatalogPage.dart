import 'package:flutter/material.dart';
import 'package:module_a/page/catalog/ProductDetailsPage.dart';

class Product {
  final List<String> images;
  final String name;
  final String description;

  Product({
    required this.images,
    required this.name,
    required this.description,
  });
}

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Product> products = [
    Product(
      images: ['assets/1920.jpg', 'assets/1920.jpg', 'assets/1920.jpg'],
      name: 'TOVAR 1',
      description: 'Описание товара 1',
    ),
    Product(
      images: ['assets/1920.jpg', 'assets/1920.jpg'],
      name: 'Товар 2',
      description: 'Описание товара 2',
    ),
    Product(
      images: ['assets/1920.jpg', 'assets/1920.jpg', 'assets/1920.jpg', 'assets/1920.jpg'],
      name: 'Товар 3',
      description: 'Описание товара 3',
    ),
  ];

  List<Product> get filteredProducts {
    String query = _searchController.text.toLowerCase();
    return products.where((product) {
      return product.name.toLowerCase().contains(query) ||
          product.description.toLowerCase().contains(query);
    }).toList();
  }

  List<int> currentPages = [];

  @override
  void initState() {
    super.initState();
    currentPages = List<int>.filled(filteredProducts.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: 'Поиск...',
                labelStyle: TextStyle(color: Colors.grey[500]),
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[500],
                  size: 30,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: const Color.fromARGB(255, 151, 184, 214)!),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView( 
              child: GridView.builder(
                shrinkWrap: true, 
                padding: const EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 5, 
                  mainAxisSpacing: 5, 
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  Product product = filteredProducts[index];
                  int currentPageIndex = currentPages[filteredProducts.indexOf(product)];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(product: product),
                        ),
                      );
                    },

                  child:  Container(
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  SizedBox(
                                    height: 117,
                                    width: double.infinity,
                                    child: PageView.builder(
                                      itemCount: product.images.length,
                                      onPageChanged: (index) {
                                        setState(() {
                                          currentPages[filteredProducts.indexOf(product)] = index;
                                        });
                                      },
                                      itemBuilder: (context, index) {
                                        return Image.asset(
                                          product.images[index],
                                          height: 125,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(179, 0, 0, 0),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: List.generate(
                                            product.images.length,
                                            (index) => AnimatedContainer(
                                              duration: const Duration(milliseconds: 300),
                                              margin: const EdgeInsets.symmetric(horizontal: 1),
                                              height: 7,
                                              width: 7,
                                              decoration: BoxDecoration(
                                                color: currentPageIndex == index
                                                    ? const Color.fromARGB(255, 156, 7, 255)
                                                    : const Color.fromARGB(148, 255, 255, 255),
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.name,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(height: 0),
                            Text(product.description, style: TextStyle(color: Colors.grey[500])),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
