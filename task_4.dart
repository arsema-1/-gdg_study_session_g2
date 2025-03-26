import 'dart:io';

// Shoe Entity
class Shoe {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Shoe({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

// Use Case Interface
abstract class UseCase<Type, Params> {
  Future<Type> execute(Params params);
}


class ShoeStore {
  static final List<Shoe> _shoes = [];

  static List<Shoe> getShoes() => _shoes;

  static Shoe? getShoeById(String id) {
    try {
      return _shoes.firstWhere((shoe) => shoe.id == id);
    } catch (e) {
      return null;
    }
  }

  static void addShoe(Shoe shoe) => _shoes.add(shoe);

  static void updateShoe(Shoe updatedShoe) {
    int index = _shoes.indexWhere((shoe) => shoe.id == updatedShoe.id);
    if (index != -1) _shoes[index] = updatedShoe;
  }

  static void removeShoe(String id) {
    _shoes.removeWhere((shoe) => shoe.id == id);
  }
}


class ViewAllShoes implements UseCase<List<Shoe>, void> {
  @override
  Future<List<Shoe>> execute(void params) async {
    return ShoeStore.getShoes();
  }
}

class ViewShoeById implements UseCase<Shoe?, String> {
  @override
  Future<Shoe?> execute(String id) async {
    return ShoeStore.getShoeById(id);
  }
}

class AddShoe implements UseCase<void, Shoe> {
  @override
  Future<void> execute(Shoe shoe) async {
    ShoeStore.addShoe(shoe);
  }
}

class UpdateShoe implements UseCase<void, Shoe> {
  @override
  Future<void> execute(Shoe shoe) async {
    ShoeStore.updateShoe(shoe);
  }
}

class RemoveShoe implements UseCase<void, String> {
  @override
  Future<void> execute(String id) async {
    ShoeStore.removeShoe(id);
  }
}


void main() async {
  final viewAllShoes = ViewAllShoes();
  final viewShoeById = ViewShoeById();
  final addShoe = AddShoe();
  final updateShoe = UpdateShoe();
  final removeShoe = RemoveShoe();

  while (true) {
    print('\n--- Shoe Store ---');
    print('1. View All Shoes');
    print('2. View Shoe by ID');
    print('3. Add New Shoe');
    print('4. Update Shoe');
    print('5. Remove Shoe');
    print('6. Exit');
    stdout.write('Select an option: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        List<Shoe> shoes = await viewAllShoes.execute(null);
        if (shoes.isEmpty) {
          print('No shoes available.');
        } else {
          print('\nAvailable Shoes:');
          for (var shoe in shoes) {
            print('ID: ${shoe.id} | Name: ${shoe.name} | Price: ${shoe.price} birr');
          }
        }
        break;

      case '2':
        stdout.write('Enter Shoe ID to view: ');
        String? shoeId = stdin.readLineSync();
        if (shoeId != null) {
          Shoe? shoe = await viewShoeById.execute(shoeId);
          if (shoe != null) {
            print('\nShoe Details:');
            print('ID: ${shoe.id}, Name: ${shoe.name}');
            print('Description: ${shoe.description}');
            print('Price: ${shoe.price} birr');
          } else {
            print('Shoe not found.');
          }
        }
        break;

      case '3':
        stdout.write('Enter Shoe ID: ');
        String? id = stdin.readLineSync();
        stdout.write('Enter Shoe Name: ');
        String? name = stdin.readLineSync();
        stdout.write('Enter Shoe Description: ');
        String? description = stdin.readLineSync();
        stdout.write('Enter Shoe Image URL: ');
        String? imageUrl = stdin.readLineSync();
        stdout.write('Enter Shoe Price: ');
        String? priceInput = stdin.readLineSync();

        if (id != null && name != null && description != null && imageUrl != null && priceInput != null) {
          double price = double.tryParse(priceInput) ?? 0;
          Shoe newShoe = Shoe(
            id: id,
            name: name,
            description: description,
            imageUrl: imageUrl,
            price: price,
          );
          await addShoe.execute(newShoe);
          print('Shoe added successfully!');
        }
        break;

      case '4':
        stdout.write('Enter Shoe ID to update: ');
        String? updateId = stdin.readLineSync();
        Shoe? existingShoe = await viewShoeById.execute(updateId!);
        if (existingShoe != null) {
          stdout.write('Enter New Name (current: ${existingShoe.name}): ');
          String? newName = stdin.readLineSync();
          stdout.write('Enter New Description (current: ${existingShoe.description}): ');
          String? newDescription = stdin.readLineSync();
          stdout.write('Enter New Image URL (current: ${existingShoe.imageUrl}): ');
          String? newImageUrl = stdin.readLineSync();
          stdout.write('Enter New Price (current: ${existingShoe.price} birr): ');
          String? newPriceInput = stdin.readLineSync();

          double newPrice = double.tryParse(newPriceInput!) ?? existingShoe.price;
          Shoe updatedShoe = Shoe(
            id: existingShoe.id,
            name: newName ?? existingShoe.name,
            description: newDescription ?? existingShoe.description,
            imageUrl: newImageUrl ?? existingShoe.imageUrl,
            price: newPrice,
          );

          await updateShoe.execute(updatedShoe);
          print('Shoe updated successfully!');
        } else {
          print('Shoe not found.');
        }
        break;

      case '5':
        // Remove Shoe
        stdout.write('Enter Shoe ID to remove: ');
        String? removeId = stdin.readLineSync();
        if (removeId != null) {
          await removeShoe.execute(removeId);
          print('Shoe removed successfully!');
        }
        break;

      case '6':
        // Exit
        print('Exiting Shoe Store Management System...');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
    print('--------------------------------');
  }
}
