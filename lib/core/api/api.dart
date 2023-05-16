import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/api/base_api.dart';
import 'package:rick_and_morty/core/api/enum.dart';
import 'package:http/http.dart' as iHttp;
import 'package:rick_and_morty/core/api/env.dart';

import '../context/context.dart';

class Api extends BaseApi {
  Future _fetch(EnumMethod method, String url, {String? params}) async {
    String baseUrl = EnvData.host + url;
    try {
      iHttp.Response response;
      switch (method) {
        case EnumMethod.get:
          response = await iHttp.get(Uri.parse(baseUrl));
          break;
        case EnumMethod.post:
          response = await iHttp.post(Uri.parse(baseUrl), body: params);
          break;
        case EnumMethod.put:
          response = await iHttp.put(Uri.parse(baseUrl), body: params);
          break;
        case EnumMethod.delete:
          response = await iHttp.delete(Uri.parse(baseUrl), body: params);
          break;
        case EnumMethod.patch:
          response = await iHttp.delete(Uri.parse(baseUrl), body: params);
          break;
      }
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      ScaffoldMessenger.of(
        NavigationService.navigatorKey.currentContext!,
      ).showSnackBar(
        SnackBar(
          content: Text(
            response.body,
          ),
          backgroundColor: Colors.green,
        ),
      );
      return null;
    } catch (e) {
      ScaffoldMessenger.of(
        NavigationService.navigatorKey.currentContext!,
      ).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
          backgroundColor: Colors.green,
        ),
      );
      return null;
    }
  }

  @override
  Future delete(String url, {params}) {
    return _fetch(
      EnumMethod.delete,
      url,
      params: json.encode(params),
    );
  }

  @override
  Future get(String url, {params}) {
    return _fetch(
      EnumMethod.get,
      url,
    );
  }

  @override
  Future post(String url, {params}) {
    return _fetch(
      EnumMethod.post,
      url,
      params: json.encode(params),
    );
  }

  @override
  Future put(String url, {params}) {
    return _fetch(
      EnumMethod.put,
      url,
      params: json.encode(params),
    );
  }
}
