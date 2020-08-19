class userDatabase {
  String firstName;
  String lastName;
  String userName;

  userDatabase({this.firstName,this.lastName, this.userName});

  Map toMap(userDatabase user) {
    var data = Map<String, dynamic>();
    data['userName'] = user.userName;
    data['firstName'] = user.firstName;
    data['lastName'] = user.lastName;
    return data;
  }

  userDatabase.fromMap(Map<String, dynamic> mapData) {
    this.userName = mapData['userName'];
    this.firstName = mapData['firstName'];
    this.lastName = mapData['lastName'];
  }
}