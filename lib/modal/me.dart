import 'package:flutter/material.dart';

class Profile {
  final String name;
  final String avatar;
  final String account;

  const Profile({
    @required this.name,
    @required this.avatar,
    @required this.account,
  });
}

const Profile me = Profile(
    name: '模仿者',
    avatar: 'https://randomuser.me/api/portraits/men/77.jpg',
    account: 'a_test_account'
);