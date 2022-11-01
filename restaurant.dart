void main() {
  Person person = Person(1);
  Restaurant restaurant = Restaurant(
    1,
    100,
    DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day+1,
      00,
      00,
    ),
    DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      12,
      00,
    ),
    100
  );
  person.makeResevation(restaurant, 25, DateTime.now());
}

///Restaurant class made to represent the restaurant
class Restaurant {
  final int id;
  final DateTime finalTime;
  final DateTime initialTime;
  int occupation;
  final int occupationMax;

  Restaurant(this.id, this.occupation, this.finalTime, this.initialTime, this.occupationMax);

  bool restaurantIsFull() {
    return occupationMax < occupation;
  }

  bool restaurantIsClosed(DateTime time) =>
      time.isAfter(finalTime) && time.isBefore(initialTime);

  bool restaurantIsOpen(DateTime time) =>
      time.isBefore(finalTime) && time.isAfter(initialTime);

  void makeReservation(int persons) {
    occupation += persons;
    print('Reservation was created with success!');
  }
}

///Person class made to represent the person who wants to book an occupation
class Person {
  final int id;
  const Person(this.id);

  void makeResevation(Restaurant restaurant, int persons, DateTime timeA) {
    final isOpen = restaurant.restaurantIsOpen(timeA);
    final isClosed = restaurant.restaurantIsClosed(timeA);
    final isFull = restaurant.restaurantIsFull();
    ///If it is open and not full, it will be possible to make a reservation!
    if (isOpen && !isClosed && !isFull) {
      restaurant.makeReservation(persons);
    } else {
      print(
        "It's closed or it's full! Call to more informations: luanbatistadev@gmail.com",
      );
    }
  }
}
