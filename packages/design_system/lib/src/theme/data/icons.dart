import 'package:design_system/src/utils/utils.dart';
import 'package:equatable/equatable.dart';

/// Class responsible to implement,
/// a way to read font icons from .ttf file.
class AppIconsData extends Equatable {
  /// Creates a new instance of [AppIconsData].
  const AppIconsData({
    required this.fontFamily,
    required this.fontPackage,
    required this.characters,
    required this.sizes,
  });

  /// Get all font icons.
  /// Icons have been exported with "Export Icon Font" Figma plugin.
  factory AppIconsData.regular() => AppIconsData(
        fontFamily: 'custom_icons',
        fontPackage: packageName,
        characters: AppIconCharactersData.regular(),
        sizes: AppIconSizesData.regular(),
      );

  /// Receive the file name with the font icons.
  final String fontFamily;

  /// Reference the package where the font icons are.
  final String? fontPackage;

  /// Reference each font icon inside the .ttf file.
  final AppIconCharactersData characters;

  /// Reference the possible sizes to the font icons.
  final AppIconSizesData sizes;

  @override
  List<Object?> get props => [
        fontFamily,
        fontPackage,
        characters,
        sizes,
      ];
}

/// Class responsible to get,
/// each font icon inside the .ttf file
class AppIconCharactersData extends Equatable {
  /// Creates a new instance of [AppIconCharactersData].
  const AppIconCharactersData({
    required this.addProduct,
    required this.arrowBack,
    required this.dismiss,
    required this.options,
    required this.tag,
    required this.vikoin,
    required this.shoppingCart,
  });

  /// Get each font icon.
  factory AppIconCharactersData.regular() => AppIconCharactersData(
        addProduct: String.fromCharCodes([57344, 58343, 58413, 57568]),
        arrowBack: String.fromCharCodes([57344, 58537, 59260, 57572]),
        dismiss: String.fromCharCodes([57344, 57911, 61195, 57514]),
        options: String.fromCharCodes([58088, 58314, 57452]),
        tag: String.fromCharCodes([59112, 57969, 57576]),
        vikoin: String.fromCharCodes([57344, 57929, 57730, 57522]),
        shoppingCart: String.fromCharCodes([57344, 58580, 57759, 57350]),
      );

  /// [addProduct] font icon.
  final String addProduct;

  /// [arrowBack] font icon.
  final String arrowBack;

  /// [dismiss] font icon.
  final String dismiss;

  /// [options] font icon.
  final String options;

  /// [tag] font icon.
  final String tag;

  /// [vikoin] font icon.
  final String vikoin;

  /// [shoppingCart] font icon.
  final String shoppingCart;

  @override
  List<Object?> get props => [
        addProduct.named('addProduct'),
        arrowBack.named('arrowBack'),
        dismiss.named('dismiss'),
        tag.named('tag'),
        vikoin.named('vikoin'),
        shoppingCart.named('shoppingCart'),
      ];
}

/// Class responsible to make available,
/// the possible sizes to the font icons.
class AppIconSizesData extends Equatable {
  /// Creates a new instance of [AppIconSizesData].
  const AppIconSizesData({
    required this.small,
    required this.regular,
    required this.big,
  });

  /// Get each font icon size.
  factory AppIconSizesData.regular() => const AppIconSizesData(
        small: 16,
        regular: 22,
        big: 32,
      );

  /// [small] size for the font icons
  final double small;

  /// [regular] size for the font icons
  final double regular;

  /// [big] size for the font icons
  final double big;

  @override
  List<Object?> get props => [
        small.named('small'),
        regular.named('regular'),
        big.named('big'),
      ];
}
