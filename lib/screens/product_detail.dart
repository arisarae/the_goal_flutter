import 'package:flutter/material.dart';
import 'package:the_goal_mobile/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  Widget _buildProductDetails(ProductEntry product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Badge
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                product.category,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(width: 10),

            if (product.isFeatured)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  'featured',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),

        // Title
        Text(
          product.name,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 8),

        // Price
        Text(
          'Rp ${product.price}',
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),

        const SizedBox(height: 8),

        // Stock
        Text(
          'Stock: ${product.stock}',
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),

        const Divider(height: 16),

        // Description
        Text(
          product.description,
          style: const TextStyle(
            fontSize: 16.0,
            height: 1.6,
            color: Colors.black87,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildProductImage(
    BuildContext context,
    ProductEntry product,
    double screenWidth,
  ) {
    final bool isLargeScreen = screenWidth > 800;
    final bool isUrlInvalid = product.thumbnail == "" || product.thumbnail.isEmpty;

    Widget placeholderWidget = Container(
      width: isLargeScreen ? 350 : double.infinity,
      height: isLargeScreen ? 350 : 250,
      color: Colors.grey[300],
      child: const Center(child: Icon(Icons.broken_image, size: 50)),
    );

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: isUrlInvalid
            ? placeholderWidget
            : Image.network(
                'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                width: isLargeScreen ? 350 : double.infinity,
                height: isLargeScreen ? 350 : 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: isLargeScreen ? 350 : double.infinity,
                  height: isLargeScreen ? 350 : 250,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isLargeScreen = screenWidth > 800;
    final double maxWidth = screenWidth > 900 ? 900 : screenWidth;

    final imageWidget = _buildProductImage(context, product, screenWidth);

    final detailsWidget = _buildProductDetails(product);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: isLargeScreen ? 0 : 16.0,
                  ),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(
                      isLargeScreen ? 40.0 : 24.0,
                    ),
                    child: isLargeScreen
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(flex: 4, child: imageWidget),
                              const SizedBox(
                                width: 40,
                              ),
                              Flexible(flex: 6, child: detailsWidget),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              imageWidget,
                              const SizedBox(height: 24),
                              detailsWidget,
                            ],
                          ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
