import 'package:flutter/material.dart';
import 'package:module_a/page/catalog/CatalogPage.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double containerWidth = widget.product.images.length * 15.0;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      PageView.builder(
                        itemCount: widget.product.images.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentPageIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Image.asset(
                            widget.product.images[index],
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                          );
                        },
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                            width: containerWidth, 
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                widget.product.images.length,
                                (index) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.symmetric(horizontal: 2),
                                  height: 7.5,
                                  width: 7.5,
                                  decoration: BoxDecoration(
                                    color: currentPageIndex == index
                                        ? const Color.fromARGB(255, 0, 0, 0)
                                        : const Color.fromARGB(101, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          widget.product.name,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '200 000 ТГ',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.grey[600]),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255), 
                            borderRadius: BorderRadius.circular(10), 
                          ),
                          child: SizedBox(
                            height: 90,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 5),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  child: Text(
                                    'Описание:',
                                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                  child: Text(
                                    widget.product.description,
                                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )

              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 53, 53, 53).withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
Positioned(
  bottom: 30,
  left: 0,
  right: 0,
  child: Container(
    width: double.infinity,
    height: 60,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 6, spreadRadius: 1),
      ],
    ),
    child: Padding(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5), child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 128, 47, 233),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        minimumSize: Size(0, 15), 
      ),
      onPressed: () {
        
      },
      child: Text(
        'Добавить в корзину',
        style: TextStyle(fontSize: 14, color: Colors.white), 
      ),
    ),
  ),
  ),
),

        ],
      ),
    );
  }
}
