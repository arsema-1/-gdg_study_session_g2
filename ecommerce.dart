import 'dart:io';

class Product {
  String name;
  String description;
  double price;

  Product(this.name, this.description, this.price);

  @override
  String toString() {
    return 'Name: ' +
        name +
        '\nDescription: ' +
        description +
        '\nPrice: ' +
        price.toStringAsFixed(2);
  }
}

class ProductManager {
  List<Product> products = [];

  void addProduct(String name, String description, double price) {
    products.add(Product(name, description, price));
    print('Product added successfully!');
  }

  void viewAllProducts() {
    if (products.isEmpty) {
      print('No products available.');
      return;
    }
    for (int i = 0; i < products.length; i++) {
      print('\nProduct ID: ' + i.toString());
      print(products[i]);
    }
  }

  void viewProduct(int index) {
    if (index < 0 || index >= products.length) {
      print('Invalid product ID.');
      return;
    }
    print(products[index]);
  }

  void editProduct(
      int index, String newName, String newDescription, double newPrice) {
    if (index < 0 || index >= products.length) {
      print('Invalid product ID.');
      return;
    }
    products[index].name = newName;
    products[index].description = newDescription;
    products[index].price = newPrice;
    print('Product updated successfully!');
  }

  void deleteProduct(int index) {
    if (index < 0 || index >= products.length) {
      print('Invalid product ID.');
      return;
    }
    products.removeAt(index);
    print('Product deleted successfully!');
  }
}

void main() {
  ProductManager manager = ProductManager();

  while (true) {
    print('\n===== E-Commerce Product Manager =====');
    print('1. Add Product');
    print('2. View All Products');
    print('3. View Product');
    print('4. Edit Product');
    print('5. Delete Product');
    print('6. Exit');
    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter product name: ');
        String name = stdin.readLineSync()!;
        stdout.write('Enter product description: ');
        String description = stdin.readLineSync()!;
        stdout.write('Enter product price: ');
        double price = double.tryParse(stdin.readLineSync()!) ?? 0.0;
        manager.addProduct(name, description, price);
        break;
      case '2':
        manager.viewAllProducts();
        break;
      case '3':
        stdout.write('Enter product ID: ');
        int index = int.tryParse(stdin.readLineSync()!) ?? -1;
        manager.viewProduct(index);
        break;
      case '4':
        stdout.write('Enter product ID to edit: ');
        int index = int.tryParse(stdin.readLineSync()!) ?? -1;
        stdout.write('Enter new product name: ');
        String newName = stdin.readLineSync()!;
        stdout.write('Enter new product description: ');
        String newDescription = stdin.readLineSync()!;
        stdout.write('Enter new product price: ');
        double newPrice = double.tryParse(stdin.readLineSync()!) ?? 0.0;
        manager.editProduct(index, newName, newDescription, newPrice);
        break;
      case '5':
        stdout.write('Enter product ID to delete: ');
        int index = int.tryParse(stdin.readLineSync()!) ?? -1;
        manager.deleteProduct(index);
        break;
      case '6':
        print('Exiting application.');
        return;
      default:
        print('Invalid choice. Please enter a number between 1 and 6.');
    }
  }
}
