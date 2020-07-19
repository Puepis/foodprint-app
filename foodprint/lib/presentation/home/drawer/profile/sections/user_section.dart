import 'package:flutter/material.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

class UserSection extends StatelessWidget {
  final Username username;
  const UserSection({Key key, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: foodprintPrimaryColorSwatch[50],
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(5.0),
            child: const Icon(
              Icons.person_outline,
              size: 100,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Username",
                    style: const TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
