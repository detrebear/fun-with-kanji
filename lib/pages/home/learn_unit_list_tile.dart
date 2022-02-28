import 'package:flutter/material.dart';
import 'package:yaru_icons/yaru_icons.dart';

class LeanUnitListTile extends StatelessWidget {
  final int? progress;
  final String title;
  final void Function() onTap;
  final String symbol;

  const LeanUnitListTile({
    required this.progress,
    required this.title,
    required this.symbol,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Icon(YaruIcons.go_next),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 32,
                    child: Text(
                      symbol,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: Material(
                      borderRadius: BorderRadius.circular(64),
                      color: Theme.of(context).dividerColor,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 64,
                            height: 64,
                            child: CircularProgressIndicator(
                              value: (progress ?? 0) / 100,
                              color: Colors.green,
                            ),
                          ),
                          if (progress != null)
                            Center(child: Text('$progress%')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}