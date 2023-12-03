import 'package:flutter/material.dart';
import 'package:new_york/util/date_time_util.dart';
import 'package:new_york/util/launcher_util.dart';

import '../../model/most_popular_post_model.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  final double imageSize = 50.0;

  const PostWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key("POST_KEY"),
      onTap: () {
        LauncherUtil.launchInBrowser(post.url);
      },
      title: Text(
        post.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(imageSize),
        child: Image.network(
          "https://pbs.twimg.com/profile_images/1098244578472280064/gjkVMelR_400x400.png",
          errorBuilder: (ctx, o, e) {
            return Text("error");
          },
          height: imageSize,
          width: imageSize,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.byline,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(post.section),
                Row(
                  children: [
                    const Icon(
                      Icons.date_range,
                      size: 15,
                      color: Colors.black45,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      DateTimeUtil.onlyDate(post.publishedDate),
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.grey.shade400,
      ),
    );
  }
}
