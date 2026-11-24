
import 'package:flutter/material.dart';

class NewsFeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final int numOfLikes;
  final String date;
  final bool hasImage;
  final String? imageAsset;
  final String? avatarAsset;

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.numOfLikes,
    required this.date,
    this.hasImage = false,
    this.imageAsset,
    this.avatarAsset,
  });

  @override
  State<NewsFeedCard> createState() => _NewsFeedCardState();
}

class _NewsFeedCardState extends State<NewsFeedCard> {
  late int likes;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likes = widget.numOfLikes;
  }

  Widget buildAvatar() {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.grey.shade300,
      backgroundImage: widget.avatarAsset != null
          ? AssetImage(widget.avatarAsset!)
          : null,
      child: widget.avatarAsset == null
          ? const Icon(Icons.person, color: Colors.black54)
          : null,
    );
  }

  Widget buildPostImage() {
    if (!widget.hasImage) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxHeight: 350,
        minHeight: 180,
      ),
      margin: const EdgeInsets.only(top: 12),
      child: widget.imageAsset != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                widget.imageAsset!,
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.image,
                      size: 60,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            )
          : const SizedBox(
              height: 200,
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 60,
                  color: Colors.grey,
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                buildAvatar(),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        widget.date,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.more_horiz),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              widget.postContent,
              style: const TextStyle(fontSize: 14),
            ),

            buildPostImage(),

            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(
                  Icons.thumb_up,
                  color: Colors.blue,
                  size: 17,
                ),
                const SizedBox(width: 5),
                Text('$likes'),
                const Spacer(),
                const Text('Comments'),
              ],
            ),

            const Divider(height: 20),

            Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        if (isLiked) {
                          likes--;
                        } else {
                          likes++;
                        }
                        isLiked = !isLiked;
                      });
                    },
                    icon: Icon(
                      isLiked
                          ? Icons.thumb_up
                          : Icons.thumb_up_outlined,
                      color: isLiked ? Colors.blue : Colors.grey,
                    ),
                    label: Text(
                      'Like',
                      style: TextStyle(
                        color: isLiked ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Comment button clicked!'),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.comment_outlined,
                      color: Colors.grey,
                    ),
                    label: const Text(
                      'Comment',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share_outlined,
                      color: Colors.grey,
                    ),
                    label: const Text(
                      'Share',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
