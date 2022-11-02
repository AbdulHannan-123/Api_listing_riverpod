import 'dart:html';
import 'dart:math';

import 'package:api_calling_reverpod/dataprovider/data_provider.dart';
import 'package:api_calling_reverpod/home/detail_page.dart';
import 'package:api_calling_reverpod/models/usermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userChangingmodel);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List With Riverpod'),
      ),
      body: _data.when(
        data: (_data) {
          List<UserModel> userList = _data.map((e) => e).toList();
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(user: userList[index]),));
                      },
                      child: Card(
                          color: Colors.greenAccent,
                          elevation: 4,
                          child: ListTile(
                            title: Text(
                              userList[index].firstname.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              userList[index].lastname.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            trailing: CircleAvatar(
                              backgroundImage: NetworkImage(userList[index].avatar),
                            ),
                          )),
                    );
                  },
                ),
              ),
            ],
          );
        },
        error: (err, stackTrace) {
          print(err);
          return Text('helo----------------------------'+err.toString());
          // print(object)
        },
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
