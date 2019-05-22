import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage>{
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {

    final List<Widget> _body = [
      ListView.builder(
        controller: _scrollController,
        itemBuilder:(BuildContext context, int index){

        },
      ),
    ];

    // TODO: implement build
    return Stack(
      children: _body,
    );
  }
}