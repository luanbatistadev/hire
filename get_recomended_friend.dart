void main() {
  final user = getRecomendationFriends(1, 5);
  print(user);
}

/// Users class used to hold Person class objects
class Users {
  static Person alice = Person(1, 'Alice', [2, 4]);
  static Person bob = Person(2, 'Bob', [1, 3, 5]);
  static Person eve = Person(3, 'Eve', [2, 3]);
  static Person dan = Person(4, 'Dan', [1, 4]);
  static Person carlie = Person(5, 'Charlie', [2]);

  static List<Person> get getAllUser => [alice, bob, eve, dan, carlie];
}

///Person class representing social network user
class Person {
  final List<int> friends;
  final String name;
  final int id;
  const Person(this.id, this.name, this.friends);
}

///Function to return a Person Object passing the ID
Person getUser(int userId) =>
    Users.getAllUser.firstWhere((element) => element.id == userId);

///Function to return a List of IDs of the friends of a given user, passing the userID
List<int> getFriends(int userId) {
  final user = getUser(userId);
  return user.friends;
}

///Function to return a list of recommended users (name only). 
///It goes through all the friends and checks if the secondary
/// friends have the userId different from the primary user's
///  userID and if it is not contained in the primary user's 
/// friends list. If so, it is added to the recommended list.
List<String> getRecomendationFriends(int userId, int cutOff) {
  final list1 = getFriends(userId);
  List<String> recomendation = [];
  List<int> friends = [];
  for (var item in list1) {
    final user = getUser(item);
    friends.addAll(user.friends);
  }
  for (var item in friends) {
    if (item != userId && !list1.contains(item)) {
      if (recomendation.length < cutOff) {
        recomendation.add(getUser(item).name);
      }
    }
  }
  recomendation.sort((k1, k2) => k1.compareTo(k2));
  return recomendation;
}
