import 'package:uuid/uuid.dart';

// A helper for generating unique IDs for our gift ideas.
const uuid = Uuid();

// This class defines the structure for a single gift idea.
// It's in its own file so it can be easily imported and reused anywhere in the app.
class GiftIdea {
  String id;
  final String personName;
  final String idea;
  bool isPurchased;

  GiftIdea({
    required this.personName,
    required this.idea,
    this.isPurchased = false,
  }) : id = uuid
           .v4(); // Automatically generate a unique ID when a new gift is created.
}
