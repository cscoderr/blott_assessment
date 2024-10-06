import 'package:blott_assessment/core/core.dart';
import 'package:blott_assessment/domain/domain.dart';
import 'package:blott_assessment/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    required this.data,
    super.key,
  });

  final MarketNewsEntity data;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return GestureDetector(
      onTap: () async {
        if (!await launchUrl(Uri.parse(data.url!))) {
          throw Exception('Could not launch url');
        }
      },
      child: SizedBox(
        height: 132,
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: '${data.image}',
              height: 100,
              width: 100,
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                );
              },
              placeholder: (context, url) => Assets.images.logo.svg(
                height: 100,
                width: 100,
              ),
              errorWidget: (context, url, error) => Assets.images.logo.svg(
                height: 100,
                width: 100,
              ),
            ),
            const Gap(20),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${data.source?.toUpperCase()}',
                          style: textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          data.datetime != null
                              ? '''${DateFormat.d().format(data.datetime!)} ${DateFormat.MMMM().format(data.datetime!).toUpperCase()} ${DateFormat.y().format(data.datetime!)}'''
                              : '',
                          style: textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${data.headline}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleMedium?.copyWith(
                        color: Colors.white,
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
