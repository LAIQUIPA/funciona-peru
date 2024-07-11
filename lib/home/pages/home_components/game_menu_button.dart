import 'package:flutter/material.dart';
import 'package:funciona_peru/theme/app_colors.dart';

class GameMenuButton extends StatelessWidget {
  const GameMenuButton({
    super.key,
    required this.title,
    required this.info,
    this.onTap,
  });

  final String title;
  final String info;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: ElevatedButton(
        onPressed: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            //main
            SizedBox(
              width: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                    ],
                  )
                ],
              ),
            ),
            //Button Info
            Positioned(
                right: -8,
                top: -8,
                child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 300,
                            decoration: const BoxDecoration(
                                color: color200,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(35))),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      width: 56,
                                      height: 56,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: mainColor600,
                                      ),
                                      child: const Icon(
                                        Icons.lightbulb,
                                        size: 35,
                                        color: color100,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      info,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: scaffoldBackgroundColor,
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 15),
                                    ElevatedButton(
                                      child: const Icon(Icons.close),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Icon(
                      Icons.info,
                      size: 30,
                    ))),
          ],
        ),
      ),
    );
  }
}
