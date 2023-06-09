import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invite_for_a_break/src/bloc/homepage/homepage_bloc.dart';
import 'package:invite_for_a_break/src/bloc/homepage/homepage_event.dart';
import 'package:invite_for_a_break/src/bloc/homepage/homepage_state.dart';
import 'package:invite_for_a_break/src/bloc/session/session_cubit.dart';
import 'package:invite_for_a_break/src/repository/homepage_repo.dart';
import 'package:invite_for_a_break/src/repository/profile_repo.dart';
import 'package:invite_for_a_break/src/screens/main/profile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomepageBloc(
              homepageRepo: context.read<HomepageRepo>(),
            )..add(HomepageLoading()),
        child: Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () => {
                context.read<SessionCubit>().signOut(),
              },
              backgroundColor: Colors.black,
              child: const Icon(Icons.logout),
            ),
          ),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: BlocBuilder<HomepageBloc, HomepageState>(
              builder: (context, state) {
                return EasySearchBar(
                    backgroundColor: Colors.blue.shade800,
                    title: const Text('Search people'),
                    onSearch: (value) => {
                          context.read<HomepageBloc>().add(
                                HomepageSearchStringChanged(
                                    searchString: value),
                              ),
                          if (value.isEmpty)
                            {
                              context
                                  .read<HomepageBloc>()
                                  .add(HomepageLoading()),
                            },
                          if (value.length > 2)
                            {
                              context
                                  .read<HomepageBloc>()
                                  .add(HomepageSearch()),
                            }
                        },
                    suggestions: state.searchHistory);
              },
            ),
          ),
          body: BlocBuilder<HomepageBloc, HomepageState>(
            builder: (context, state) {
              if (state.users.isEmpty) {
                return const Center(
                  child: Text("No users found"),
                );
              }
              return ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(state.users[index].name),
                                const SizedBox(height: 15),
                                Text(state.users[index].email),
                                const SizedBox(height: 15),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text(state.users[index].name),
                          subtitle: Text(state.users[index].email),
                        ),
                      ),
                    );
                  });
            },
          ),
        ));
  }
}
