import 'dart:io';

class Product {
  String name; // Product name
  double price; // Product price

  Product(this.name, this.price);

  // Display product details
  void display() {
    print(name + " - " + price.toStringAsFixed(2) + " ETB");
  }
}

class ShoppingCart {
  List<Product> cart = [];

  void addProduct(Product product) {
    cart.add(product);
    print("\n" + product.name + " has been added to your cart.\n");
  }

  //  show all items in the cart
  void showCart() {
    if (cart.isEmpty) {
      print("Your cart is empty!\n");
    } else {
      print("Your Cart:");
      for (int i = 0; i < cart.length; i++) {
        cart[i].display();
      }
      print("\nTotal Price: " + getTotal().toStringAsFixed(2) + " ETB\n");
    }
  }

  // calculate the total price
  double getTotal() {
    double total = 0;
    for (var item in cart) {
      total += item.price;
    }
    return total;
  }

  void checkout() {
    if (cart.isEmpty) {
      print("\nYour cart is empty! Add items before checking out.\n");
    } else {
      print("\nTotal Amount: " + getTotal().toStringAsFixed(2) + " ETB");
      print("Checkout successful! Thank you for shopping.\n");
      cart.clear();
    }
  }
}

void main() {
  List<Product> products = [
    Product("Laptop", 42000.00),
    Product("Phone", 25000.00),
    Product("Headphones", 3500.00)
  ];

  // Create a shopping cart object
  ShoppingCart cart = ShoppingCart();

  while (true) {
    print("\nWelcome to our Electronics E-Commerce Store ");
    print("1. View Products");
    print("2. Add Product to Cart");
    print("3. View Cart");
    print("4. Checkout");
    print("5. Exit");
    stdout.write("Choose an option: ");

    String? choice = stdin.readLineSync();
    if (choice == "1") {
      print("\nAvailable Products:");
      for (int i = 0; i < products.length; i++) {
        print((i + 1).toString() +
            ". " +
            products[i].name +
            " - " +
            products[i].price.toString() +
            " ETB");
      }
    } else if (choice == "2") {
      print("\nEnter the product number to add to cart:");
      for (int i = 0; i < products.length; i++) {
        print((i + 1).toString() +
            ". " +
            products[i].name +
            " - " +
            products[i].price.toString() +
            " ETB");
      }
      stdout.write("Enter product number: ");
      String? input = stdin.readLineSync();
      int? productIndex = int.tryParse(input ?? "");

      if (productIndex != null &&
          productIndex > 0 &&
          productIndex <= products.length) {
        cart.addProduct(products[productIndex - 1]);
      } else {
        print("Invalid selection. Please try again.\n");
      }
    } else if (choice == "3") {
      cart.showCart();
    } else if (choice == "4") {
      cart.checkout();
    } else if (choice == "5") {
      print("\n Goodbye.");
      break;
    } else {
      print("Invalid option. Please enter a number between 1 and 5.");
    }
  }
}
