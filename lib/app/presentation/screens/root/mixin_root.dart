// import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 's_root.dart';

mixin RootMixin<T extends RootScreen> on State<T> {
  // late Socket socket;
  @override
  void initState() {
    super.initState();
    print('올!!');
  }
}
