import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:mapbeauty/modules/product/domain/models/color_type.dart';
import 'package:mapbeauty/modules/product/domain/models/product_type.dart';
import 'package:mapbeauty/modules/product/presentation/components/product_color_images_widget.dart';
import 'package:mapbeauty/modules/product/services/dto/brand_dto.dart';
import 'package:mapbeauty/modules/product/services/dto/color_type_dto.dart';
import 'package:mapbeauty/modules/product/services/dto/product_colors_dto.dart';
import 'package:mapbeauty/modules/product/services/dto/product_dto.dart';
import 'package:mapbeauty/modules/product/services/dto/product_type_dto.dart';
import 'package:mapbeauty/modules/product/services/dummy_data.dart';

abstract class ProductStore {
  Future<List<BrandDTO>> loadBrandsAndProducts();
}

class ProductStoreImpl implements ProductStore {
  Map<String, List<List<dynamic>>> _csvData = {};
  List<ProductTypeDTO> _productTypeList = [];
  List<ColorTypeDTO> _colorTypeList = [];

  @override
  Future<List<BrandDTO>> loadBrandsAndProducts() async {
    await loadCSVData();
    loadProductTypeList();
    loadColorTypeList();
    return getBrands();
  }

  Future<void> loadCSVData() async {
    final brandsCSV = await loadDataFromCSV('assets/map_data/map_beauty_marcas.csv');
    final productTypeCSV = await loadDataFromCSV('assets/map_data/map_beauty _tipo_produtos.csv');
    final productsCSV = await loadDataFromCSV('assets/map_data/map_beauty_linhas_produtos.csv');
    final productColorsCSV = await loadDataFromCSV('assets/map_data/map_beauty_cores_produto.csv');
    final productColorImagesCSV = await loadDataFromCSV('assets/map_data/map_beauty_imagens_cores_produtos.csv');
    final colorTypeCSV = await loadDataFromCSV('assets/map_data/map_beauty_cores_padronizadas.csv');

    _csvData["brands"] = brandsCSV;
    _csvData["productType"] = productTypeCSV;
    _csvData["products"] = productsCSV;
    _csvData["productColors"] = productColorsCSV;
    _csvData["productColorImages"] = productColorImagesCSV;
    _csvData["colorType"] = colorTypeCSV;
  }

  Future<List<List<dynamic>>> loadDataFromCSV(String bundle) async {
    final data = await rootBundle.loadString(bundle);
    List<List<dynamic>> list = const CsvToListConverter().convert(data);

    return list;
  }

  void loadProductTypeList() {
    final list = _csvData["productType"];
    if (list == null) return;

    for (int a = 0; a < list.length; a++) {
      final productType = list[a];

      final id = productType[0];
      final type = productType[0];

      _productTypeList.add(ProductTypeDTO(id: id, type: type));
    }
  }

  void loadColorTypeList() {
    final list = _csvData["colorType"];
    if (list == null) return;

    for (int a = 0; a < list.length; a++) {
      final colorType = list[a];

      final id = colorType[0];
      final name = colorType[0];

      _colorTypeList.add(ColorTypeDTO(id: id, colorName: name));
    }
  }

  List<BrandDTO> getBrands() {
    final list = _csvData["brands"];
    List<BrandDTO> brands = [];
    if (list == null) brands;

    for (int a = 0; a < list!.length; a++) {
      if (a == 0) continue;
      final brandCSV = list[a];

      final id = brandCSV[0];
      final name = brandCSV[1];
      final imageName = brandCSV[2];
      final products = getProducts(name);

      brands.add(BrandDTO(id: id, name: name, imageName: imageName, products: products));
    }
    return brands;
  }

  ProductTypeDTO getProductType(String type) {
    final types = _productTypeList.where((element) => type == element.type);
    return types.first;
  }

  List<ProductDTO> getProducts(String brandName) {
    final list = _csvData["products"];
    List<ProductDTO> productList = [];
    if (list == null) return productList;

    for (int a = 0; a < list.length; a++) {
      final productCSV = list[a];

      if (productCSV[2] == brandName) {
        final id = productCSV[0];
        final name = productCSV[1];

        final productType = getProductType(productCSV[3]);
        final productColors = getProductColors(name);

        productList.add(ProductDTO(id: id, name: name, productType: productType, productColors: productColors));
      }
    }
    return productList;
  }

  List<ProductColorDTO> getProductColors(String productName) {
    final list = _csvData["productColors"];
    List<ProductColorDTO> productColorList = [];
    if (list == null) return productColorList;

    for (int a = 0; a < list.length; a++) {
      final productColorCSV = list[a];

      if (productColorCSV[1] == productName) {
        final id = productColorCSV[0];
        final brandColorName = productColorCSV[2];
        final colorType = getColorsType(productColorCSV[3]) ?? ColorTypeDTO(id: id, colorName: "");
        final buyUrl = productColorCSV[4];
        final colorHex = productColorCSV[5];
        // final imageName = productColorCSV[5];
        final images = getProductColorsImages(id);

        productColorList.add(ProductColorDTO(id: id, brandColorName: brandColorName, colorType: colorType, buyUrl: buyUrl, colorHex: colorHex, images: images));
      }
    }
    return productColorList;
  }

  List<String> getProductColorsImages(int productColorID) {
    final list = _csvData["productColorImages"];
    List<String> productColorsImages = [];
    if (list == null) return productColorsImages;

    for (int a = 0; a < list.length; a++) {
      final productColorsImageCSV = list[a];

      final id = productColorsImageCSV[0];
      if (id == productColorID) {
        final name = productColorsImageCSV[1];
        productColorsImages.add(name);
      }
    }
    return productColorsImages;
  }

  ColorTypeDTO getColorsType(String colorTypeName) {
    final types = _colorTypeList.where((element) => colorTypeName == element.colorName);

    return types.first;
  }
}
