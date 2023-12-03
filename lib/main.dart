import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_york/bloc/post_cubit.dart';
import 'package:new_york/model/most_popular_post_model.dart';

//
import 'package:new_york/repository/most_post_repo.dart';
import 'package:new_york/ui/widget/post_widget.dart';

const appMode = AppMode.productions;

const title = "NY Times Most Popular Articles ";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: const Key("MaterialApp"),
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (_) => PostCubit(PostRepository(appMode))..loadPosts(),
          child: const MyHomePage(title: title)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<PostCubit, MostPostPopular?>(
          builder: (BuildContext context, state) {
            if (state == null) {
              return const CircularProgressIndicator();
            } else {
              return ListView(
                key: const Key("MostPostsKey"),
                children: state.results
                    .map((p) => PostWidget(
                          post: p,
                        ))
                    .toList(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PostCubit>().refresh();
        },
        tooltip: 'refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
