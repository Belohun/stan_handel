//ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:ui' as ui;
import 'dart:html' as html;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stan_handel_web/presentation/style/app_colors.dart';
import 'package:stan_handel_web/presentation/util/size_util.dart';

const _googleMapLink =
    "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2556.4443292020287!2d18.940944215720638!3d50.15282617943539!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4716ceeba9ed3031%3A0xd1a32a9c76276cc7!2sStan%20Handel%20-%20sprzeda%C5%BC%20wyrob%C3%B3w%20hutniczych!5e0!3m2!1spl!2spl!4v1671190687211!5m2!1spl!2spl";
const String _googleMapIframeKey = 'iframeElement';

class MapSection extends HookWidget {
  const MapSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        // ignore: UNDEFINED_PREFIXED_NAME
        ui.platformViewRegistry.registerViewFactory(
          _googleMapIframeKey,
          (int viewId) => html.IFrameElement()
            ..src = _googleMapLink
            ..style.border = 'none',
        );
        platformViewsRegistry.getNextPlatformViewId();
        return null;
      },
      [context],
    );

    return Container(
      width: double.infinity,
      height: context.mapHeight,
      color: AppColors.gray7,
      child: const HtmlElementView(viewType: _googleMapIframeKey),
    );
  }
}
