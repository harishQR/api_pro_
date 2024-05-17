class user {
  final String email;
  final String gender;
  final String phone;
  final String cell;
  final String nat;
  final username name;
  user ({
    required this.email,
    required this.gender,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,

});
}

class username {
  final String title;
  final String first;
  final String last;

  username({
    required this.title,
    required this.first,
    required this.last,
  });
}
