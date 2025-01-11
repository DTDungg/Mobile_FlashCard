class UserFromDB {
  int? userID;
  String? userName;
  String? email;
  String? password;
  int? follower;
  int? following;
  int? streak;
  int? gift;
  String? avatar;
  Null? sets;
  Null? saves;
  Null? followers;
  Null? followingUsers;

  UserFromDB(
      {this.userID,
        this.userName,
        this.email,
        this.password,
        this.follower,
        this.following,
        this.streak,
        this.gift,
        this.avatar,
        this.sets,
        this.saves,
        this.followers,
        this.followingUsers});

  UserFromDB.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    follower = json['follower'];
    following = json['following'];
    streak = json['streak'];
    gift = json['gift'];
    avatar = json['avatar'];
    sets = json['sets'];
    saves = json['saves'];
    followers = json['followers'];
    followingUsers = json['followingUsers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['follower'] = this.follower;
    data['following'] = this.following;
    data['streak'] = this.streak;
    data['gift'] = this.gift;
    data['avatar'] = this.avatar;
    data['sets'] = this.sets;
    data['saves'] = this.saves;
    data['followers'] = this.followers;
    data['followingUsers'] = this.followingUsers;
    return data;
  }
}
