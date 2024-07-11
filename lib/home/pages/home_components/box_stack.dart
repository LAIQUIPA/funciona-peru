import 'package:flutter/material.dart';
import 'package:funciona_peru/theme/app_colors.dart';

class BoxStack extends StatelessWidget {
  const BoxStack({
    super.key,
    required this.imgUrl,
    required this.title,
  });
  final String imgUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 140,
          decoration: BoxDecoration(
            border: Border.all(color: color950),
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(
                  imgUrl,
                  

                ),
                fit: BoxFit.cover),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: mainColor600,
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black38,
                  ]),
            ),
          ),
        ),

        //container pequeño
        Positioned(
          bottom: 5,
          right: 9,
          child: Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: mainColor600),
                color: color700.withOpacity(0.7),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.double_arrow)
              ],
            ),
          ),
        )
      ],
    );
  }
}
