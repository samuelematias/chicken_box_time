import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/design_system.dart' as ds;
import 'package:flutter/material.dart';

/// Customizable [Card] component.
class Card extends StatelessWidget {
  /// Creates a new instance of [Card].
  const Card({
    Key? key,
    this.imageLeading = '',
    required this.title,
    this.subtitle = '',
    this.onTap,
  }) : super(key: key);

  /// A widget to display before the title.
  final String imageLeading;

  /// The primary content of the card.
  final String title;

  /// Additional content displayed below the title.
  final String subtitle;

  /// The pressed action.
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final theme = ds.AppTheme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: theme.colors.brand,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: Visibility(
                visible: imageLeading.isNotEmpty,
                child: _ImageLeading(imageUrl: imageLeading),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(theme.spacing.large),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ds.Text(
                      title,
                      style: ds.CustomTextStyle.labelMedium,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    Visibility(
                      visible: subtitle.isNotEmpty,
                      child: Column(
                        children: [
                          SizedBox(
                            height: theme.spacing.small,
                          ),
                          ds.Text(
                            subtitle,
                            style: ds.CustomTextStyle.labelSmall,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageLeading extends StatelessWidget {
  /// Creates a new instance of [_ImageLeading].
  const _ImageLeading({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fadeInDuration: const Duration(milliseconds: 400),
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      width: 175,
      placeholder: (context, url) => const Icon(Icons.image),
      errorWidget: (context, url, dynamic error) =>
          const Icon(Icons.broken_image),
    );
  }
}
