import 'package:flutter/material.dart';
import 'item.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<Item> items = [
    Item(name: "Pullover", color: "Black", size: "L", price: 51, quantity: 1),
    Item(name: "T-Shirt", color: "Gray", size: "L", price: 30, quantity: 1),
    Item(
        name: "Sport Dress", color: "Black", size: "M", price: 43, quantity: 1),
  ];

  // Calculate the total amount
  double get totalAmount {
    return items.fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  void incrementQuantity(int index) {
    setState(() {
      items[index].quantity++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (items[index].quantity > 1) items[index].quantity--;
    });
  }

  void checkout() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Congratulations! Your order has been placed.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bag'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          _category(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total amount:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text('${totalAmount.toStringAsFixed(2)}\$',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: checkout,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(200, 20, 200, 20),
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    'CHECK OUT',
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _category() {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.grey,
            child: ListTile(
              leading: Image.network(
                'data:image/jpeg;base64,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',
                width: 55,
                fit: BoxFit.contain,
              ),
              title: Text(items[index].name),
              tileColor: Colors.white30,
              subtitle: Text(
                  'Color: ${items[index].color}    Size: ${items[index].size} '),
              trailing: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                        child: CircleAvatar(
                          child: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => decrementQuantity(index),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('${items[index].quantity}',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                        child: CircleAvatar(
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => incrementQuantity(index),
                          ),
                        ),
                      ),
                      Text(
                        'price: ${items[index].price}\$',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
