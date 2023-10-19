// import 'package:mapbeauty/modules/core/assets.dart';
// import 'package:mapbeauty/modules/product/services/dto/brand_dto.dart';
// import 'package:mapbeauty/modules/product/services/dto/product_colors_dto.dart';
// import 'package:mapbeauty/modules/product/services/dto/product_dto.dart';
// import 'package:mapbeauty/modules/product/services/dto/product_type_dto.dart';

// import '../../core/utils/utils.dart';
// import 'dto/color_type_dto.dart';

// const productUrlTest =
//     "https://www.amazon.com.br/Líquido-Dior-Addict-Tattoo-Natural/dp/B071KQ9X38/ref=sr_1_3_sspa?crid=2TNK668WA96TB&keywords=batom&qid=1694800477&sprefix=batom%2Caps%2C187&sr=8-3-spons&ufe=app_do%3Aamzn1.fos.db68964d-7c0e-4bb2-a95c-e5cb9e32eb12&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&psc=1";

// final colorsDummy = [
//   const ColorTypeDTO(id: "1", colorName: "MAP BS 01"),
//   const ColorTypeDTO(id: "2", colorName: "MAP BS 02"),
//   const ColorTypeDTO(id: "3", colorName: "MAP BS 03"),
//   const ColorTypeDTO(id: "4", colorName: "MAP BS 04"),
//   const ColorTypeDTO(id: "5", colorName: "MAP BS 05"),
//   const ColorTypeDTO(id: "6", colorName: "MAP BS 06"),
//   const ColorTypeDTO(id: "7", colorName: "MAP BS 07"),
//   const ColorTypeDTO(id: "8", colorName: "MAP BS 08"),
// ];

// final productTypesDummy = [
//   ProductTypeDTO(id: Utils.uuid(), type: "Batom"),
//   ProductTypeDTO(id: Utils.uuid(), type: "Rímel"),
//   ProductTypeDTO(id: Utils.uuid(), type: "Base"),
// ];

// final someProducts = [
//   ProductDTO(id: Utils.uuid(), name: "BT Skin 1 lal", productType: productTypesDummy[2], imageName: "mac_powder_kiss_mull_it_over.png", productColors: [
//     ProductColorDTO(
//         id: Utils.uuid(),
//         brandColorName: "F10",
//         colorHex: "#ffffff",
//         colorType: colorsDummy[0],
//         buyUrl: "https://amzn.to/4742SCC",
//         images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png", "mac_powder_kiss_mull_it_over.png", "bruna_tavares_bt_lux_lana.png", "avon_logo.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "F20", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC", colorHex: "#f1d9d9", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "F30", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC", colorHex: "#e5a1a1", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "F40", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC", colorHex: "#ba7c7c", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "F10", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC", colorHex: "#805a5a", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "F20", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC", colorHex: "#aaaaaa", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "F30", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC", colorHex: "#bbbbbb", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "F40", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC", colorHex: "#cccccc", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "F10", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC", colorHex: "#dddddd", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "F20", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC", colorHex: "#f1d9d9", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "F30", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC", colorHex: "#e5a1a1", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "F40", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC", colorHex: "#ba7c7c", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   ]),
//   ProductDTO(id: Utils.uuid(), name: "BT Skin 2222", productType: productTypesDummy[2], imageName: "mac_powder_kiss_mull_it_over.png", productColors: [
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "AA1", colorType: colorsDummy[4], buyUrl: "https://amzn.to/4742SCC", colorHex: "#f1d9d9", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "AA2", colorType: colorsDummy[5], buyUrl: "https://amzn.to/4742SCC", colorHex: "#e5a1a1", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "AA3", colorType: colorsDummy[6], buyUrl: "https://amzn.to/4742SCC", colorHex: "#ba7c7c", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "AA4", colorType: colorsDummy[7], buyUrl: "https://amzn.to/4742SCC", colorHex: "#805a5a", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   ]),
//   ProductDTO(id: Utils.uuid(), name: "BT Skin 3", productType: productTypesDummy[2], imageName: "mac_powder_kiss_mull_it_over.png", productColors: [
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "A1", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC", colorHex: "#f1d9d9", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "A2", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC", colorHex: "#e5a1a1", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "A3", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC", colorHex: "#ba7c7c", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "A4", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC", colorHex: "#805a5a", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   ]),
//   ProductDTO(id: Utils.uuid(), name: "BT Skin 4", productType: productTypesDummy[2], imageName: "mac_matte_chili.png", productColors: [
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "AA1", colorType: colorsDummy[4], buyUrl: "https://amzn.to/4742SCC", colorHex: "#f1d9d9", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "AA2", colorType: colorsDummy[5], buyUrl: "https://amzn.to/4742SCC", colorHex: "#e5a1a1", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "AA3", colorType: colorsDummy[6], buyUrl: "https://amzn.to/4742SCC", colorHex: "#ba7c7c", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "AA4", colorType: colorsDummy[7], buyUrl: "https://amzn.to/4742SCC", colorHex: "#805a5a", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   ]),
//   ProductDTO(id: Utils.uuid(), name: "BT Skin 5", productType: productTypesDummy[2], imageName: "mac_powder_kiss_mull_it_over.png", productColors: [
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "B1", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC", colorHex: "#f1d9d9", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "B2", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC", colorHex: "#e5a1a1", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "B3", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC", colorHex: "#ba7c7c", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "B4", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC", colorHex: "#805a5a", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   ]),
//   ProductDTO(id: Utils.uuid(), name: "BT Skin 6", productType: productTypesDummy[2], imageName: "mac_powder_kiss_mull_it_over.png", productColors: [
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "BB1", colorType: colorsDummy[4], buyUrl: "https://amzn.to/4742SCC", colorHex: "#f1d9d9", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "BB2", colorType: colorsDummy[5], buyUrl: "https://amzn.to/4742SCC", colorHex: "#e5a1a1", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "BB3", colorType: colorsDummy[6], buyUrl: "https://amzn.to/4742SCC", colorHex: "#ba7c7c", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "BB4", colorType: colorsDummy[7], buyUrl: "https://amzn.to/4742SCC", colorHex: "#805a5a", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   ]),
//   ProductDTO(id: Utils.uuid(), name: "BT Skin 7", productType: productTypesDummy[2], imageName: "mac_powder_kiss_mull_it_over.png", productColors: [
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "B5", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC", colorHex: "#f1d9d9", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "B6", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC", colorHex: "#e5a1a1", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "B7", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC", colorHex: "#ba7c7c", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "b8", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC", colorHex: "#805a5a", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   ]),
//   ProductDTO(id: Utils.uuid(), name: "BT Skin 8", productType: productTypesDummy[2], imageName: "mac_powder_kiss_mull_it_over.png", productColors: [
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "CC1", colorType: colorsDummy[4], buyUrl: "https://amzn.to/4742SCC", colorHex: "#f1d9d9", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "CC2", colorType: colorsDummy[5], buyUrl: "https://amzn.to/4742SCC", colorHex: "#e5a1a1", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "CC3", colorType: colorsDummy[6], buyUrl: "https://amzn.to/4742SCC", colorHex: "#ba7c7c", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "CC4", colorType: colorsDummy[7], buyUrl: "https://amzn.to/4742SCC", colorHex: "#805a5a", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   ]),
//   ProductDTO(id: Utils.uuid(), name: "BT Skin 9", productType: productTypesDummy[2], imageName: "mac_powder_kiss_mull_it_over.png", productColors: [
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "F10", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC", colorHex: "#f1d9d9", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "F20", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC", colorHex: "#e5a1a1", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "F30", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC", colorHex: "#ba7c7c", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "F40", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC", colorHex: "#805a5a", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   ]),
//   ProductDTO(id: Utils.uuid(), name: "BT Skin 10", productType: productTypesDummy[2], imageName: "mac_powder_kiss_mull_it_over.png", productColors: [
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "DD1", colorType: colorsDummy[4], buyUrl: "https://amzn.to/4742SCC", colorHex: "#f1d9d9", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "DD2", colorType: colorsDummy[5], buyUrl: "https://amzn.to/4742SCC", colorHex: "#e5a1a1", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "DD3", colorType: colorsDummy[6], buyUrl: "https://amzn.to/4742SCC", colorHex: "#ba7c7c", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "DD4", colorType: colorsDummy[7], buyUrl: "https://amzn.to/4742SCC", colorHex: "#", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   ]),
//   ProductDTO(id: Utils.uuid(), name: "BT Skin 11", productType: productTypesDummy[2], imageName: "mac_powder_kiss_mull_it_over.png", productColors: [
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "F10", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC", colorHex: "#f1d9d9", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "F20", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC", colorHex: "#e5a1a1", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "F30", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC", colorHex: "#ba7c7c", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "F40", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC", colorHex: "#805a5a", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   ]),
//   ProductDTO(id: Utils.uuid(), name: "BT Skin 12", productType: productTypesDummy[2], imageName: "mac_powder_kiss_mull_it_over.png", productColors: [
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "EE0", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC", colorHex: "#f1d9d9", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "EE1", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC", colorHex: "#e5a1a1", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "EE2", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC", colorHex: "#ba7c7c", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "EE3", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC", colorHex: "#805a5a", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   ]),
//   ProductDTO(id: Utils.uuid(), name: "BT Skin 13", productType: productTypesDummy[2], imageName: "mac_powder_kiss_mull_it_over.png", productColors: [
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "FF0", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC", colorHex: "#f1d9d9", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "FF1", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC", colorHex: "#e5a1a1", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "FF2", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC", colorHex: "#ba7c7c", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "FF3", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC", colorHex: "#805a5a", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   ]),
//   ProductDTO(id: Utils.uuid(), name: "BT Skin 14", productType: productTypesDummy[2], imageName: "mac_powder_kiss_mull_it_over.png", productColors: [
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "GG1", colorType: colorsDummy[4], buyUrl: "https://amzn.to/4742SCC", colorHex: "#f1d9d9", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "GG2", colorType: colorsDummy[5], buyUrl: "https://amzn.to/4742SCC", colorHex: "#e5a1a1", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "GG3", colorType: colorsDummy[6], buyUrl: "https://amzn.to/4742SCC", colorHex: "#ba7c7c", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "GG4", colorType: colorsDummy[7], buyUrl: "https://amzn.to/4742SCC", colorHex: "#805a5a", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   ]),
//   ProductDTO(id: Utils.uuid(), name: "BT Skin 15", productType: productTypesDummy[2], imageName: "mac_powder_kiss_mull_it_over.png", productColors: [
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "F10", colorType: colorsDummy[0], buyUrl: "https://amzn.to/4742SCC", colorHex: "#f1d9d9", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "F20", colorType: colorsDummy[1], buyUrl: "https://amzn.to/4742SCC", colorHex: "#e5a1a1", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//     ProductColorDTO(id: Utils.uuid(), brandColorName: "F30", colorType: colorsDummy[2], buyUrl: "https://amzn.to/4742SCC", colorHex: "#ba7c7c", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//     ProductColorDTO(
//         id: Utils.uuid(), brandColorName: "F40", colorType: colorsDummy[3], buyUrl: "https://amzn.to/4742SCC", colorHex: "#805a5a", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   ]),
// ];

// final productsDummy = [
//   BrandDTO(
//     id: Utils.uuid(),
//     name: "MAC",
//     imageName: "mac_logo.png",
//     products: someProducts,
//   ),
//   BrandDTO(id: Utils.uuid(), name: "Avon", imageName: "avon_logo.png", products: [
//     ProductDTO(id: Utils.uuid(), name: "Base Protetor Stick Glam Skin Protect", productType: productTypesDummy[2], imageName: "mac_powder_kiss_mull_it_over.png", productColors: [
//       ProductColorDTO(
//           id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4", colorHex: "#f1d9d9", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//       ProductColorDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9", colorHex: "#", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//       ProductColorDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA", colorHex: "#", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//       ProductColorDTO(
//           id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s", colorHex: "#", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//     ]),
//   ]),
//   // BrandDTO(id: Utils.uuid(), name: "o Boticário", imageName: "o_boticário_logo.png", products: [
//   //   ProductDTO(
//   //       id: Utils.uuid(),
//   //       name: "Base Protetor Stick Glam Skin Protect",
//   //       productType: productTypesDummy[2],
//   //       imageName: "mac_powder_kiss_mull_it_over.png",
//   //
//   //       productColors: [
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4",colorHex: "#f1d9d9", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9",colorHex: "#", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA",colorHex: "#", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s",colorHex: "#", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   //       ]),
//   // ]),
//   // BrandDTO(id: Utils.uuid(), name: "Bruna Tavares", imageName: "bruna_tavares_logo.jpg", products: [
//   //   ProductDTO(
//   //       id: Utils.uuid(),
//   //       name: "Base Protetor Stick Glam Skin Protect",
//   //       productType: productTypesDummy[2],
//   //       imageName: "mac_powder_kiss_mull_it_over.png",
//   //
//   //       productColors: [
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4",colorHex: "#", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9",colorHex: "#", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA",colorHex: "#", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s",colorHex: "#", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   //       ]),
//   // ]),
//   // BrandDTO(id: Utils.uuid(), name: "Essence", imageName: 'essence_logo.png', products: [
//   //   ProductDTO(
//   //       id: Utils.uuid(),
//   //       name: "Base Protetor Stick Glam Skin Protect",
//   //       productType: productTypesDummy[2],
//   //       imageName: "mac_powder_kiss_mull_it_over.png",
//   //
//   //       productColors: [
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4",colorHex: "#", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9",colorHex: "#", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA",colorHex: "#", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s",colorHex: "#", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   //       ]),
//   // ]),
//   // BrandDTO(id: Utils.uuid(), name: "Eudora", imageName: 'eudora_logo.jpg', products: [
//   //   ProductDTO(
//   //       id: Utils.uuid(),
//   //       name: "Base Protetor Stick Glam Skin Protect",
//   //       productType: productTypesDummy[2],
//   //       imageName: "mac_powder_kiss_mull_it_over.png",
//   //
//   //       productColors: [
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4",colorHex: "#", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9",colorHex: "#", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA",colorHex: "#", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s",colorHex: "#", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   //       ]),
//   // ]),
//   // BrandDTO(id: Utils.uuid(), name: "Fenty Beauty", imageName: 'fenty_beauty_logo.jpg', products: [
//   //   ProductDTO(
//   //       id: Utils.uuid(),
//   //       name: "Base Protetor Stick Glam Skin Protect",
//   //       productType: productTypesDummy[2],
//   //       imageName: "mac_powder_kiss_mull_it_over.png",
//   //
//   //       productColors: [
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4",colorHex: "#", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9",colorHex: "#", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA",colorHex: "#", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s",colorHex: "#", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   //       ]),
//   // ]),
//   // BrandDTO(id: Utils.uuid(), name: "Fran", imageName: null, products: [
//   //   ProductDTO(
//   //       id: Utils.uuid(),
//   //       name: "Base Protetor Stick Glam Skin Protect",
//   //       productType: productTypesDummy[2],
//   //       imageName: "mac_powder_kiss_mull_it_over.png",
//   //
//   //       productColors: [
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4",colorHex: "#", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9",colorHex: "#", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA",colorHex: "#", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s",colorHex: "#", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   //       ]),
//   // ]),
//   // BrandDTO(id: Utils.uuid(), name: "Jequiti", imageName: 'jequiti_logo.png', products: [
//   //   ProductDTO(
//   //       id: Utils.uuid(),
//   //       name: "Base Protetor Stick Glam Skin Protect",
//   //       productType: productTypesDummy[2],
//   //       imageName: "mac_powder_kiss_mull_it_over.png",
//   //
//   //       productColors: [
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4",colorHex: "#", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9",colorHex: "#", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA",colorHex: "#", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s",colorHex: "#", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   //       ]),
//   // ]),
//   // BrandDTO(id: Utils.uuid(), name: "Mahav", imageName: 'mahav_logo.png', products: [
//   //   ProductDTO(
//   //       id: Utils.uuid(),
//   //       name: "Base Protetor Stick Glam Skin Protect",
//   //       productType: productTypesDummy[2],
//   //       imageName: "mac_powder_kiss_mull_it_over.png",
//   //
//   //       productColors: [
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4",colorHex: "#", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9",colorHex: "#", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA",colorHex: "#", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s",colorHex: "#", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   //       ]),
//   // ]),

//   // BrandDTO(id: Utils.uuid(), name: "Mari Maria", imageName: 'mari_maria_logo.jpg', products: [
//   //   ProductDTO(
//   //       id: Utils.uuid(),
//   //       name: "Base Protetor Stick Glam Skin Protect",
//   //       productType: productTypesDummy[2],
//   //       imageName: "mac_powder_kiss_mull_it_over.png",
//   //
//   //       productColors: [
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4",colorHex: "#", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9",colorHex: "#", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA",colorHex: "#", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s",colorHex: "#", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   //       ]),
//   // ]),

//   // BrandDTO(id: Utils.uuid(), name: "Maybelline", imageName: 'maybelline_logo.png', products: [
//   //   ProductDTO(
//   //       id: Utils.uuid(),
//   //       name: "Base Protetor Stick Glam Skin Protect",
//   //       productType: productTypesDummy[2],
//   //       imageName: "mac_powder_kiss_mull_it_over.png",
//   //
//   //       productColors: [
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4",colorHex: "#", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9",colorHex: "#", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA",colorHex: "#", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s",colorHex: "#", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   //       ]),
//   // ]),

//   // BrandDTO(id: Utils.uuid(), name: "Natura", imageName: 'natura_logo.png', products: [
//   //   ProductDTO(
//   //       id: Utils.uuid(),
//   //       name: "Base Protetor Stick Glam Skin Protect",
//   //       productType: productTypesDummy[2],
//   //       imageName: "mac_powder_kiss_mull_it_over.png",
//   //
//   //       productColors: [
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4",colorHex: "#", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9",colorHex: "#", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA",colorHex: "#", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s",colorHex: "#", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   //       ]),
//   // ]),

//   // BrandDTO(id: Utils.uuid(), name: "Payot", imageName: 'payot_logo.png', products: [
//   //   ProductDTO(
//   //       id: Utils.uuid(),
//   //       name: "Base Protetor Stick Glam Skin Protect",
//   //       productType: productTypesDummy[2],
//   //       imageName: "mac_powder_kiss_mull_it_over.png",
//   //
//   //       productColors: [
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4",colorHex: "#", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9",colorHex: "#", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA",colorHex: "#", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s",colorHex: "#", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   //       ]),
//   // ]),

//   // BrandDTO(id: Utils.uuid(), name: "Rare Beauty", imageName: 'rare_beauty_logo.png', products: [
//   //   ProductDTO(
//   //       id: Utils.uuid(),
//   //       name: "Base Protetor Stick Glam Skin Protect",
//   //       productType: productTypesDummy[2],
//   //       imageName: "mac_powder_kiss_mull_it_over.png",
//   //
//   //       productColors: [
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "00", colorType: colorsDummy[0], buyUrl: "https://amzn.to/3Dx1mM4",colorHex: "#", images: ["bruna_tavares_bt_lux_lana.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "05", colorType: colorsDummy[1], buyUrl: "https://amzn.to/3OyeMO9",colorHex: "#", images: ["mac_satin_twig.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "10", colorType: colorsDummy[2], buyUrl: "https://amzn.to/3KetWFA",colorHex: "#", images: ["mac_matte_chili.png", "mac_satin_twig.png"]),
//   //         ProductColorDTO(id: Utils.uuid(), brandColorName: "15", colorType: colorsDummy[3], buyUrl: "https://amzn.to/44Zb59s",colorHex: "#", images: ["mac_powder_kiss_mull_it_over.png", "mac_satin_twig.png"]),
//   //       ]),
//   // ]),

//   //BrandDTO(id: Utils.uuid(), name: "Mari Maria", imageUrl: BrandImagesAssets.mariMaria, products: []),
// ];
