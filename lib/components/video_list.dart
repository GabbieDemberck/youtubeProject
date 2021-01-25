import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_project/models/channel_model.dart';
import 'package:youtube_project/models/video_model.dart';
import 'package:youtube_project/screens/video_page.dart';
import 'package:youtube_project/services/api_service.dart';

class VideoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VideoListState();
}

class VideoListState extends State<VideoList> {
  Channel _channel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCib793mnUOhWymCh2VJKplQ');
    setState(() {
      _channel = channel;
    });
  }

  void _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel.uploadPlaylistId);
    List<Video> allVideos = _channel.videos..addAll(moreVideos);
    setState(() {
      _channel.videos = allVideos;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return _channel != null
        ? NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollDetails) {
              if (!_isLoading &&
                  _channel.videos.length != int.parse(_channel.videoCount) &&
                  scrollDetails.metrics.pixels ==
                      scrollDetails.metrics.maxScrollExtent) {
                _loadMoreVideos();
              }
              return false;
            },
            child: ListView.builder(
              itemCount: _channel.videos.length,
              itemBuilder: (BuildContext context, int index) {
                Video video = _channel.videos[index];
                return _buildVideo(video);
              },
            ),
          )
        : Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
          );
  }

  _buildVideo(Video video) {
    return GestureDetector(
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => VideoPage(id: video.id),
              ),
            ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          padding: EdgeInsets.all(0),
          height: 350.0,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Image(
                image: NetworkImage(video.thumbnailUrl),
              ),
              SizedBox(
                width: 10.0,
                height: 3.0,
              ),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20.0,
                      backgroundImage: NetworkImage(_channel.profilePictureUrl),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                      child: Text(
                        (video.title),
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ));
  }
}
