// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TipoAtivoResultado extends StatelessWidget {
  const TipoAtivoResultado({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        Flexible(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: SizedBox(
              width: 150,
              child: Image.asset('assets/academia.png'),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  title,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  body,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
