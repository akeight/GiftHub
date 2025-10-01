import 'package:flutter/material.dart';
import '../models/gift_idea.dart'; // Import the model
import 'add_edit_gift_screen.dart'; // Import the other screen

// This widget is now focused solely on displaying and managing the list.
class GiftListScreen extends StatefulWidget {
  const GiftListScreen({super.key});

  @override
  State<GiftListScreen> createState() => _GiftListScreenState();
}

class _GiftListScreenState extends State<GiftListScreen> {
  final List<GiftIdea> _giftIdeas = [
    GiftIdea(personName: 'Mom', idea: 'A new cookbook', isPurchased: true),
    GiftIdea(personName: 'Dad', idea: 'Fishing lure'),
    GiftIdea(personName: 'Sarah', idea: 'Concert tickets'),
  ];

  void _togglePurchased(GiftIdea gift) {
    setState(() {
      gift.isPurchased = !gift.isPurchased;
    });
  }

  void _deleteGift(String id) {
    setState(() {
      _giftIdeas.removeWhere((gift) => gift.id == id);
    });
  }

  void _navigateToAddEditScreen({GiftIdea? gift}) async {
    final result = await Navigator.push<GiftIdea>(
      context,
      MaterialPageRoute(builder: (context) => AddEditGiftScreen(gift: gift)),
    );

    if (result != null) {
      setState(() {
        if (gift == null) {
          _giftIdeas.add(result);
        } else {
          final index = _giftIdeas.indexWhere((g) => g.id == result.id);
          if (index != -1) {
            _giftIdeas[index] = result;
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gift Idea Planner 🎁')),
      body: _giftIdeas.isEmpty
          ? const Center(
              child: Text(
                'No gift ideas yet.\nTap the + button to add one!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _giftIdeas.length,
              itemBuilder: (context, index) {
                final gift = _giftIdeas[index];
                return Dismissible(
                  key: Key(gift.id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    _deleteGift(gift.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${gift.idea} deleted')),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        gift.idea,
                        style: TextStyle(
                          decoration: gift.isPurchased
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      subtitle: Text(gift.personName),
                      leading: Checkbox(
                        value: gift.isPurchased,
                        onChanged: (value) {
                          _togglePurchased(gift);
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.teal),
                        onPressed: () {
                          _navigateToAddEditScreen(gift: gift);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddEditScreen(),
        tooltip: 'Add Gift Idea',
        child: const Icon(Icons.add),
      ),
    );
  }
}
