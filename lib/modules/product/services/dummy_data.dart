import 'package:mapbeauty/modules/core/assets.dart';
import 'package:mapbeauty/modules/product/services/dto/brand_dto.dart';
import 'package:mapbeauty/modules/product/services/dto/product_colors_dto.dart';
import 'package:mapbeauty/modules/product/services/dto/product_dto.dart';
import 'package:mapbeauty/modules/product/services/dto/product_type_dto.dart';

import '../../core/utils/utils.dart';
import 'dto/color_type_dto.dart';

const productUrlTest =
    "https://www.amazon.com.br/Líquido-Dior-Addict-Tattoo-Natural/dp/B071KQ9X38/ref=sr_1_3_sspa?crid=2TNK668WA96TB&keywords=batom&qid=1694800477&sprefix=batom%2Caps%2C187&sr=8-3-spons&ufe=app_do%3Aamzn1.fos.db68964d-7c0e-4bb2-a95c-e5cb9e32eb12&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&psc=1";

final colorsDummy = [
  const ColorTypeDTO(id: "1", colorName: "MAP BS 01", hexCode: "#f1d9d9"),
  const ColorTypeDTO(id: "2", colorName: "MAP BS 02", hexCode: "#e5a1a1"),
  const ColorTypeDTO(id: "3", colorName: "MAP BS 03", hexCode: "#ba7c7c"),
  const ColorTypeDTO(id: "4", colorName: "MAP BS 04", hexCode: "#805a5a"),
  const ColorTypeDTO(id: "5", colorName: "MAP BS 05", hexCode: "#aaaaaa"),
  const ColorTypeDTO(id: "6", colorName: "MAP BS 06", hexCode: "#bbbbbb"),
  const ColorTypeDTO(id: "7", colorName: "MAP BS 07", hexCode: "#cccccc"),
  const ColorTypeDTO(id: "8", colorName: "MAP BS 08", hexCode: "#dddddd"),
];

final productTypesDummy = [
  ProductTypeDTO(id: Utils.uuid(), type: "Batom"),
  ProductTypeDTO(id: Utils.uuid(), type: "Rímel"),
  ProductTypeDTO(id: Utils.uuid(), type: "Base"),
];

final someProducts = [
  ProductDTO(id: Utils.uuid(), name: "BT Skin 1", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F10", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F20", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F30", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F40", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC"),
  ]),
  ProductDTO(id: Utils.uuid(), name: "BT Skin 2", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA1", colorType: colorsDummy[4], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA2", colorType: colorsDummy[5], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA3", colorType: colorsDummy[6], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA4", colorType: colorsDummy[7], buyUrl: "https://amzn.to/4742SCC"),
  ]),
  ProductDTO(id: Utils.uuid(), name: "BT Skin 3", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F10", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F20", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F30", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F40", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC"),
  ]),
  ProductDTO(id: Utils.uuid(), name: "BT Skin 4", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA1", colorType: colorsDummy[4], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA2", colorType: colorsDummy[5], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA3", colorType: colorsDummy[6], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA4", colorType: colorsDummy[7], buyUrl: "https://amzn.to/4742SCC"),
  ]),
  ProductDTO(id: Utils.uuid(), name: "BT Skin 5", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F10", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F20", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F30", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F40", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC"),
  ]),
  ProductDTO(id: Utils.uuid(), name: "BT Skin 6", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA1", colorType: colorsDummy[4], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA2", colorType: colorsDummy[5], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA3", colorType: colorsDummy[6], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA4", colorType: colorsDummy[7], buyUrl: "https://amzn.to/4742SCC"),
  ]),
  ProductDTO(id: Utils.uuid(), name: "BT Skin 7", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F10", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F20", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F30", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F40", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC"),
  ]),
  ProductDTO(id: Utils.uuid(), name: "BT Skin 8", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA1", colorType: colorsDummy[4], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA2", colorType: colorsDummy[5], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA3", colorType: colorsDummy[6], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA4", colorType: colorsDummy[7], buyUrl: "https://amzn.to/4742SCC"),
  ]),
  ProductDTO(id: Utils.uuid(), name: "BT Skin 9", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F10", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F20", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F30", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F40", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC"),
  ]),
  ProductDTO(id: Utils.uuid(), name: "BT Skin 10", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA1", colorType: colorsDummy[4], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA2", colorType: colorsDummy[5], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA3", colorType: colorsDummy[6], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA4", colorType: colorsDummy[7], buyUrl: "https://amzn.to/4742SCC"),
  ]),
  ProductDTO(id: Utils.uuid(), name: "BT Skin 11", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F10", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F20", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F30", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F40", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC"),
  ]),
  ProductDTO(id: Utils.uuid(), name: "BT Skin 12", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F10", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F20", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F30", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F40", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC"),
  ]),
  ProductDTO(id: Utils.uuid(), name: "BT Skin 13", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F10", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F20", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F30", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F40", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC"),
  ]),
  ProductDTO(id: Utils.uuid(), name: "BT Skin 14", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA1", colorType: colorsDummy[4], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA2", colorType: colorsDummy[5], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA3", colorType: colorsDummy[6], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "AA4", colorType: colorsDummy[7], buyUrl: "https://amzn.to/4742SCC"),
  ]),
  ProductDTO(id: Utils.uuid(), name: "BT Skin 15", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F10", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F20", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F30", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC"),
    ProductColorsDTO(id: Utils.uuid(), brandColorName: "F40", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC"),
  ]),
];

final productsDummy = [
  BrandDTO(
    id: Utils.uuid(),
    name: "Bruna Tavares",
    imageUrl: BrandImagesAssets.brunaTavares,
    products: someProducts,
  ),
  BrandDTO(id: Utils.uuid(), name: "Eudora 1", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora 2", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "C1", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "C2", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "C3", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora 3", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora 4", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora 5", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora 6", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora 7", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora 8", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora 9", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], pageUrl: productUrlTest, productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),

  //BrandDTO(id: Utils.uuid(), name: "Mari Maria", imageUrl: BrandImagesAssets.mariMaria, products: []),
];
