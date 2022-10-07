import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/presentation/bloc/track/track_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const routeName = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<TrackBloc>().add(TrackEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<TrackBloc, TrackState>(
              builder: (context, state) {
                if (state is TrackLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TrackLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.track.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.track[index].name.toString()),
                        subtitle:
                            Text(state.track[index].previewUrl.toString()),
                      );
                    },
                  );
                } else if (state is TrackError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return const Center(
                    child: Text('No Data'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
