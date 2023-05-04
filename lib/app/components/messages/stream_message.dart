import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/app/data/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StreamMessage extends StatelessWidget {
  const StreamMessage({
    required this.streamUser,
    super.key,
  });

  final Stream<QuerySnapshot<Map<String, dynamic>>> streamUser;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: StreamBuilder(
          stream: streamUser,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final user = (snapshot.data.docs.reversed as Iterable).map(
                (e) => UserModel.fromJson(e.data())
                  ..isMe = e.data()['sender'] ==
                      FirebaseAuth.instance.currentUser?.email,
              );

              return ListView(
                children: user
                    .map((e) => UserWidget(
                          user: e,
                        ))
                    .toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget({required this.user, super.key});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        !user.isMe! ? 10 : width / 4,
        7,
        user.isMe! ? 10 : width / 4,
        7,
      ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(25),
            bottomRight: const Radius.circular(25),
            topLeft: user.isMe!
                ? const Radius.circular(25)
                : const Radius.circular(0),
            topRight: !user.isMe!
                ? const Radius.circular(25)
                : const Radius.circular(0),
          ),
        ),
        elevation: 8.0,
        shadowColor: Colors.black,
        color: user.isMe! ? theme.primary : theme.onPrimaryContainer,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !user.isMe!
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          user.sender,
                          style: TextStyle(
                            color: theme.primary,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              Text(
                user.sms,
                style: TextStyle(
                  fontSize: 20,
                  height: 1.4,
                  color: user.isMe! ? Colors.white : null,
                ),
              ),
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('dd/MM/yy (hh:mm)').format(user.dateTime),
                    style: TextStyle(
                      fontSize: 16,
                      color: user.isMe! ? Colors.white : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
