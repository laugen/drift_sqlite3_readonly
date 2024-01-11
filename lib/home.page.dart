import 'dart:io';

import 'package:crypto/crypto.dart' as crypto;
import 'package:drift_sqlite3_readonly/database/connection.dart';
import 'package:drift_sqlite3_readonly/database/ex1_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  String md5Before = '';
  String md5After = '';
  List<Tbl1Data> tbl1List = [];
  final ex1Db = Ex1Database(databaseName: kDatabaseName);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => afterBuild());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text('SQLite Readonly'),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Text('ex1 Tbl1', style: theme.textTheme.titleLarge),
                  ListView.builder(
                    itemCount: tbl1List.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final tbl1 = tbl1List[index];
                      return ListTile(
                          leading: Text("${tbl1.two}"),
                          title: Text("${tbl1.one}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () async {
                              await ex1Db.delete(ex1Db.tbl1).delete(tbl1);
                              afterBuild();
                            },
                          ));
                    },
                  ),
                  Text('MD5 before: $md5Before'),
                  Text('MD5 after: $md5After'),
                ],
              ),
            ),
    );
  }

  afterBuild() async {
    // MD5 of database file BEFORE first read operation
    String md5BeforeSelect = md5Before;
    if (md5BeforeSelect.isEmpty) {
      final File fileBefore = databaseFile(databaseName: kDatabaseName);
      md5BeforeSelect =
          (await crypto.md5.bind(fileBefore.openRead()).first).toString();

      debugPrint(
          'MD5 of database file $kDatabaseName BEFORE first read operation: $md5BeforeSelect');
    }

    // read operation
    final loadedTbl1List = await ex1Db.select(ex1Db.tbl1).get();
    for (final tbl1 in tbl1List) {
      debugPrint("${tbl1.one} - ${tbl1.one}");
    }

    // MD5 of database file AFTER first read operation
    String md5AfterSelect = md5After;
    if (md5AfterSelect.isEmpty) {
      final File fileAfter = databaseFile(databaseName: kDatabaseName);
      md5AfterSelect =
          (await crypto.md5.bind(fileAfter.openRead()).first).toString();

      debugPrint(
          'MD5 of database file $kDatabaseName AFTER first read operation: $md5BeforeSelect');
    }
    setState(() {
      md5Before = md5BeforeSelect;
      md5After = md5AfterSelect;
      tbl1List = loadedTbl1List;
      loading = false;
    });
  }
}
