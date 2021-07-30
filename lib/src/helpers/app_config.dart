import 'package:flutter/material.dart';

class App {
  BuildContext _context;
  double _height;
  double _width;
  double _heightPadding;
  double _widthPadding;

  App(_context) {
    this._context = _context;
    MediaQueryData _queryData = MediaQuery.of(this._context);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    _heightPadding = _height -
        ((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding =
        _width - (_queryData.padding.left + _queryData.padding.right) / 100.0;
  }

  double appHeight(double v) {
    return _height * v;
  }

  double appWidth(double v) {
    return _width * v;
  }

  double appVerticalPadding(double v) {
    return _heightPadding * v;
  }

  double appHorizontalPadding(double v) {
    return _widthPadding * v;
  }
}

class Colors {
  Color mainColor(double opacity) {
    return Color(0xFF4CAF50).withOpacity(opacity);
  }

  Color secondColor(double opacity) {
    return Color(0xFFEA0B0B).withOpacity(opacity);
  }

  Color accentColor(double opacity) {
    return Color(0xFF2C2C2C).withOpacity(opacity);
  }

  Color mainDarkColor(double opacity) {
    return Color(0xFF151515).withOpacity(opacity);
  }

  Color secondDarkColor(double opacity) {
    return Color(0xFFCCCCCC).withOpacity(opacity);
  }

  Color hintColor(double opacity) {
    return Color(0xFFA1A1A1).withOpacity(opacity);
  }
}
