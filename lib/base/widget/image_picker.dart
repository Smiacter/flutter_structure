export 'package:multi_image_picker/multi_image_picker.dart';
import '../../base/util/log_util.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ImagePicker {

  /// Asset可以使用multi_image_picker中的[AssetThumb]进行展示[缩略图]
  /// 也可以使用封装的[YImage]或者[YMultiAssetImage]进行展示[原图]
  static Future<List<Asset>> showImagePicker({
    int maxCount = 1,
    bool enableCamera = true,
    CupertinoOptions cupertinoOptions = const CupertinoOptions(),
    MaterialOptions materialOptions = const MaterialOptions(),
  }) async {
    List<Asset> assets = [];
    try {
      assets = await MultiImagePicker.pickImages(
        maxImages: maxCount,
        enableCamera: enableCamera,
        cupertinoOptions: cupertinoOptions,
        materialOptions: materialOptions,
      );
    } catch (e) {
      Log.d(e.toString());
    }

    return assets;
  }
}