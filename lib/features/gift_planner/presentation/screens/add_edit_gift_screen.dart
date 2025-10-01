import 'package:flutter/material.dart';
import '../../data/models/gift_idea.dart'; // Import the model

// This screen is now just responsible for the form.
class AddEditGiftScreen extends StatefulWidget {
  final GiftIdea? gift;

  const AddEditGiftScreen({super.key, this.gift});

  @override
  State<AddEditGiftScreen> createState() => _AddEditGiftScreenState();
}

class _AddEditGiftScreenState extends State<AddEditGiftScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _personController;
  late TextEditingController _ideaController;

  @override
  void initState() {
    super.initState();
    _personController = TextEditingController(
      text: widget.gift?.personName ?? '',
    );
    _ideaController = TextEditingController(text: widget.gift?.idea ?? '');
  }

  @override
  void dispose() {
    _personController.dispose();
    _ideaController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      // Create a new gift object with the form data.
      final newOrUpdatedGift = GiftIdea(
        personName: _personController.text,
        idea: _ideaController.text,
        isPurchased: widget.gift?.isPurchased ?? false,
      );

      // If we were editing, we must preserve the original ID.
      if (widget.gift != null) {
        newOrUpdatedGift.id = widget.gift!.id;
      }

      Navigator.of(context).pop(newOrUpdatedGift);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gift == null ? 'Add Gift Idea' : 'Edit Gift Idea'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _personController,
                decoration: const InputDecoration(
                  labelText: 'Person\'s Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ideaController,
                decoration: const InputDecoration(
                  labelText: 'Gift Idea',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lightbulb_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a gift idea';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
