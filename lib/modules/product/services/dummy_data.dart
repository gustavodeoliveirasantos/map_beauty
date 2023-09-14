import 'package:mapbeauty/modules/core/assets.dart';
import 'package:mapbeauty/modules/product/services/dto/brand_dto.dart';
import 'package:mapbeauty/modules/product/services/dto/product_colors_dto.dart';
import 'package:mapbeauty/modules/product/services/dto/product_dto.dart';
import 'package:mapbeauty/modules/product/services/dto/product_type_dto.dart';

import '../../core/utils/utils.dart';
import 'dto/color_type_dto.dart';

final colorsDummy = [
  ColorTypeDTO(id: Utils.uuid(), color: "MAP BS 01", hexCode: "#e7bc91"),
  ColorTypeDTO(id: Utils.uuid(), color: "MAP BS 02", hexCode: "#fcba03"),
  ColorTypeDTO(id: Utils.uuid(), color: "MAP BS 03", hexCode: "#6f03fc"),
  ColorTypeDTO(id: Utils.uuid(), color: "MAP BS 04", hexCode: "#6f03fc"),
];

final productTypesDummy = [
  ProductTypeDTO(id: Utils.uuid(), type: "Batom"),
  ProductTypeDTO(id: Utils.uuid(), type: "Rímel"),
  ProductTypeDTO(id: Utils.uuid(), type: "Base"),
];

final productsDummy = [
  BrandDTO(id: Utils.uuid(), name: "Bruna Tavares", imageUrl: BrandImagesAssets.brunaTavares, products: [
    ProductDTO(id: Utils.uuid(), name: "BT Skin", productType: productTypesDummy[2], productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColor: "F10", color: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "F20", color: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "F30", color: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "F40", color: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColor: "00", color: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "05", color: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "10", color: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "15", color: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColor: "00", color: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "05", color: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "10", color: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "15", color: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColor: "00", color: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "05", color: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "10", color: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "15", color: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColor: "00", color: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "05", color: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "10", color: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "15", color: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColor: "00", color: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "05", color: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "10", color: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "15", color: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColor: "00", color: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "05", color: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "10", color: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "15", color: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColor: "00", color: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "05", color: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "10", color: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "15", color: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColor: "00", color: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "05", color: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "10", color: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "15", color: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),
  BrandDTO(id: Utils.uuid(), name: "Eudora", imageUrl: BrandImagesAssets.eudora, products: [
    ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], productColors: [
      ProductColorsDTO(id: Utils.uuid(), brandColor: "00", color: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "05", color: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "10", color: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA"),
      ProductColorsDTO(id: Utils.uuid(), brandColor: "15", color: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s"),
    ]),
  ]),

  //BrandDTO(id: Utils.uuid(), name: "Mari Maria", imageUrl: BrandImagesAssets.mariMaria, products: []),
];
