/*
Navicat MySQL Data Transfer

Source Server         : local8080
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : resto_engine

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2016-06-22 09:07:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `kategori`
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kategori
-- ----------------------------

-- ----------------------------
-- Table structure for `meja`
-- ----------------------------
DROP TABLE IF EXISTS `meja`;
CREATE TABLE `meja` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `no_meja` varchar(10) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of meja
-- ----------------------------

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `deposit` decimal(19,0) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '', 'choyyima.aja@gmail.com', '88997ab14bfed3275c83', '', '0', 'choyyima', '01b307acba4f54f55aafc33bb06bbbf6ca803e9a', '1');
INSERT INTO `member` VALUES ('2', 'tito', 'inno.creative.milestone@gmail.com', 'surabaya', '', '0', '', 'e172dd95f4feb21412a692e73929961e', '1');
INSERT INTO `member` VALUES ('3', '', 'im03t_bang3t@yahoo.com', 'surabaya', '', '0', 'emma', '0c3e78056b0aa371ac2bd80f8635bd0f', '1');
INSERT INTO `member` VALUES ('4', '', 'bgt@yahoo.com', 'surabaya', '', '0', 'emma', '0c3e78056b0aa371ac2bd80f8635bd0f', '1');
INSERT INTO `member` VALUES ('5', '', 'bgt3@yahoo.com', 'surabaya', '', '0', 'emma', 'da55f2696c88b9f8185a813b67bac3df', '1');
INSERT INTO `member` VALUES ('6', '', 'abc@gmail.com', 'sby', '', '0', 'abc', '25d55ad283aa400af464c76d713c07ad', '1');
INSERT INTO `member` VALUES ('7', '', '123@gmail.com', 'sby', '', '0', 'asdg', 'c03a26aa90d0d52c9c7531467928e0d0', '1');
INSERT INTO `member` VALUES ('8', '', '898989@gmail.com', 'sby', '', '0', 'ababab', 'ed2b1f468c5f915f3f1cf75d7068baae', '1');
INSERT INTO `member` VALUES ('9', '', 'admin@gmail.com', 'sby', '', '0', 'admin', 'c93ccd78b2076528346216b3b2f701e6', '1');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_kategori` bigint(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', '0', 'Sambal Belut', 'Smack Down', '4500', 'images/sambal_belut.jpg');
INSERT INTO `products` VALUES ('3', '0', 'Sambal Teri', 'Geli', '4000', 'images/sbl-teri.jpg');
INSERT INTO `products` VALUES ('4', '0', 'Sambal Tempe', 'Unconfidence', '2500', 'images/sbl-tempe.jpg');
INSERT INTO `products` VALUES ('29', '0', 'Sambal Kecap', 'Bull Shit', '2500', 'images/sbl-kecup.jpg');
INSERT INTO `products` VALUES ('5', '0', 'Sambal Tahu', 'Pedhe', '2500', 'images/sbl-tahu.jpg');
INSERT INTO `products` VALUES ('2', '0', 'Sambal Terasi Segar', 'Sport', '2000', 'images/sbl-trasi-segar.jpg');
INSERT INTO `products` VALUES ('8', '0', 'Sambal Terasi Matang', 'Senja', '2500', 'images/sbl-trasi-mateng.jpg');
INSERT INTO `products` VALUES ('9', '0', 'Sambal Terasi Tomat Segar', 'Pusing', '2000', 'images/sambal-terasi-tomat-segar.jpg');
INSERT INTO `products` VALUES ('10', '0', 'Sambal Terasi Lombok Ijo', 'Horor', '2000', 'images/sambal-terasi-lombok-ijo.jpg');
INSERT INTO `products` VALUES ('11', '0', 'Sambal Bawang', 'Goalpal', '1500', 'images/sbl-bawang.jpg');
INSERT INTO `products` VALUES ('12', '0', 'Sambal Bawang Goreng', '', '2000', 'images/sbl-bawang-goreng.jpg');
INSERT INTO `products` VALUES ('13', '0', 'Sambal Bawang Tomat', 'Bete', '2000', 'images/sambal-bawang-tomat.jpg');
INSERT INTO `products` VALUES ('14', '0', 'Sambal Bawang Lombok Ijo', 'Hantu Kiper', '2000', 'images/sbl-bawang-lombok-ijo.jpg');
INSERT INTO `products` VALUES ('15', '0', 'Sambal Bawang Gobal-Gabul', 'Pinalti', '2500', 'images/sbl-bawang-gobal-gabul.jpg');
INSERT INTO `products` VALUES ('16', '0', 'Sambal Leunca', '', '2500', 'images/Sambal-Leunca.jpg');
INSERT INTO `products` VALUES ('17', '0', 'Sambal Rempelo Ati', 'Kurang Ajar', '3500', 'images/sambal-rempelo-ati.jpg');
INSERT INTO `products` VALUES ('18', '0', 'Sambal Goreng Rempelo Ati', '', '5000', 'images/sambal-goreng-rempelo-ati.jpg');
INSERT INTO `products` VALUES ('19', '0', 'Sambal Bajak', 'Teroris', '2500', 'images/sambal-bajak.jpg');
INSERT INTO `products` VALUES ('20', '0', 'Sambal Gobal-Gabul', 'Bingung', '5000', 'images/sbl-gobal-gabul.jpg');
INSERT INTO `products` VALUES ('21', '0', 'Sambal Terong', 'Raksasa', '4000', 'images/sambal-terong.jpg');
INSERT INTO `products` VALUES ('22', '0', 'Sambal Udang Pedas', 'Hati-Hati', '6000', 'images/sbl-udang.jpg');
INSERT INTO `products` VALUES ('23', '0', 'Sambal Cumi', 'Purba', '5000', 'images/sambal-cumi.jpg');
INSERT INTO `products` VALUES ('24', '0', 'Sambal Jamur', 'Parasit', '5000', 'images/sbl-jamur.jpg');
INSERT INTO `products` VALUES ('25', '0', 'Sambal Wader', '', '4000', 'images/sbl-wader.jpg');
INSERT INTO `products` VALUES ('26', '0', 'Sambal Tubruk', 'P3K', '2500', 'images/sbl-tubruk.jpg');
INSERT INTO `products` VALUES ('27', '0', 'Sambal Mangga Muda', 'Semangat', '3000', 'images/sbl-mangga-muda.jpg');
INSERT INTO `products` VALUES ('28', '0', 'Sambal Paru', '', '6000', 'images/sambal-paru.jpg');
INSERT INTO `products` VALUES ('30', '0', 'Pecel', 'Bangun Tidur', '3500', 'images/13255904561. pecel.jpg');
INSERT INTO `products` VALUES ('31', '0', 'Plecing Jawa', 'Escape', '3500', 'images/13255904832. plencing jawa.jpg');
INSERT INTO `products` VALUES ('32', '0', 'Pete Goreng', '', '4500', 'images/13255905073. pete goreng.jpg');
INSERT INTO `products` VALUES ('33', '0', 'Sayur Asem', 'Pasar Burung', '2500', 'images/13255905274. sayur asem.jpg');
INSERT INTO `products` VALUES ('34', '0', 'Lalapan', 'F-1', '3500', 'images/13255905515. lalapan.jpg');
INSERT INTO `products` VALUES ('35', '0', 'Trancam', 'Scare', '3500', 'images/13255905996. trancam.jpg');
INSERT INTO `products` VALUES ('36', '0', 'Gudangan', 'Cadangan', '3500', 'images/13255906187. gudangan.jpg');
INSERT INTO `products` VALUES ('37', '0', 'Terong Goreng', '', '3800', 'images/13277453318._terong_goreng_2.jpg');
INSERT INTO `products` VALUES ('38', '0', 'Ca Kangkung', '', '4500', 'images/13255906779. ca kangkung.jpg');
INSERT INTO `products` VALUES ('39', '0', 'Ca Jamur', '', '5000', 'images/132774530910._ca_jamur_1.jpg');
INSERT INTO `products` VALUES ('40', '0', 'Karedok', '', '4000', 'images/karedok.jpg');
INSERT INTO `products` VALUES ('41', '0', 'Juice Alpokat', '', '5000', 'images/13255908721. jus alpokad.jpg');
INSERT INTO `products` VALUES ('42', '0', 'Juice Semangka', '', '6000', 'images/13255908982. jus semangka.jpg');
INSERT INTO `products` VALUES ('43', '0', 'Juice Sawo', '', '5000', 'images/13255909193. jus sawo.jpg');
INSERT INTO `products` VALUES ('44', '0', 'Juice Jambu', '', '7000', 'images/13255909424. jus jambu.jpg');
INSERT INTO `products` VALUES ('45', '0', 'Juice Melon', '', '6000', 'images/13255910875. jus melon.jpg');
INSERT INTO `products` VALUES ('46', '0', 'Juice Tomat', '', '5000', 'images/13277445356.-Jus-Tomat.jpg');
INSERT INTO `products` VALUES ('47', '0', 'Juice Tomat Susu', '', '6000', 'images/13277445557.-Jus-Tomat-Susu.jpg');
INSERT INTO `products` VALUES ('48', '0', 'Juice Jeruk', '', '6000', 'images/13255911396. jus jeruk.jpg');
INSERT INTO `products` VALUES ('49', '0', 'Juice Apel', '', '6000', 'images/13255911667. jus apel.jpg');
INSERT INTO `products` VALUES ('50', '0', 'Juice Wortel', '', '5000', 'images/13255911848. jus wortel.jpg');
INSERT INTO `products` VALUES ('51', '0', 'Juice Nanas', '', '5000', 'images/13255912039. jus nanas.jpg');
INSERT INTO `products` VALUES ('52', '0', 'Juice Coffe Mix', '', '5000', 'images/132559146919. coffeemix panas - es coffemix.jpg');
INSERT INTO `products` VALUES ('53', '0', 'Juice Sirsak Bulan', '', '9000', 'images/132774457813.-Jus-Sirsak-Bulan-purnama.jpg');
INSERT INTO `products` VALUES ('54', '0', 'Juice Gobal-Gabul', '', '9000', 'images/132774460514.-Jus-Gobal-Gabul.jpg');
INSERT INTO `products` VALUES ('55', '0', 'Juice Strawbery', '', '7000', 'images/132559127211. jus strawberry.jpg');
INSERT INTO `products` VALUES ('56', '0', 'Juice Mangga', '', '7000', 'images/132559130013. jus mangga.jpg');
INSERT INTO `products` VALUES ('57', '0', 'Es Teh', '', '3500', 'images/132559132214. teh panas - es teh.jpg');
INSERT INTO `products` VALUES ('58', '0', 'Teh Panas', '', '3500', 'images/132559132214. teh panas - es teh.jpg');
INSERT INTO `products` VALUES ('59', '0', 'Es Jeruk', '', '5000', 'images/132559136515. jeruk panas - es jeruk.jpg');
INSERT INTO `products` VALUES ('60', '0', 'Jeruk Panas', '', '5000', 'images/132559136515. jeruk panas - es jeruk.jpg');
INSERT INTO `products` VALUES ('61', '0', 'Es Jeruk Nipis', '', '6000', 'images/132559138616. nipis panas - es nipis.jpg');
INSERT INTO `products` VALUES ('62', '0', 'Jeruk Nipis Panas', '', '6000', 'images/132559138616. nipis panas - es nipis.jpg');
INSERT INTO `products` VALUES ('63', '0', 'Lemon Tea', '', '5000', 'images/132774486624.-Es-Lemon-Tea.jpg');
INSERT INTO `products` VALUES ('64', '0', 'Es Coklat', '', '5000', 'images/132559142817. coklat panas - es coklat.jpg');
INSERT INTO `products` VALUES ('65', '0', 'Coklat Panas', '', '5000', 'images/132559142817. coklat panas - es coklat.jpg');
INSERT INTO `products` VALUES ('66', '0', 'Es Susu Coklat', '', '6000', 'images/132559145318. susu coklat panas - es susu coklat.jpg');
INSERT INTO `products` VALUES ('67', '0', 'Susu Cokelat Panas', '', '6000', 'images/132559145318. susu coklat panas - es susu coklat.jpg');
INSERT INTO `products` VALUES ('68', '0', 'Es Coffemix', '', '5000', 'images/132559146919. coffeemix panas - es coffemix.jpg');
INSERT INTO `products` VALUES ('69', '0', 'Coffemix Panas', '', '5000', 'images/132559146919. coffeemix panas - es coffemix.jpg');
INSERT INTO `products` VALUES ('70', '0', 'Air Es', '', '1500', 'images/132559149420. air es.jpg');
INSERT INTO `products` VALUES ('71', '0', 'Air Mineral Botol', '', '3000', 'images/air-mineral.jpg');
INSERT INTO `products` VALUES ('72', '0', 'Nasi Putih (Per Porsi)', '', '4000', 'images/nasi-piring.jpg');
INSERT INTO `products` VALUES ('73', '0', 'Nasi Putih (Per Cating)', 'Untuk 2 orang lebih', '16000', 'images/nasi-bakul.jpg');

-- ----------------------------
-- Table structure for `products_added`
-- ----------------------------
DROP TABLE IF EXISTS `products_added`;
CREATE TABLE `products_added` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `item_added` varchar(200) NOT NULL,
  `price` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of products_added
-- ----------------------------
INSERT INTO `products_added` VALUES ('1', '', 'Nasi Putih (Per Porsi)', '4000', '1', '4000', '21-06-2016');
INSERT INTO `products_added` VALUES ('2', '::1', 'Nasi Putih (Per Porsi)', '4000', '2', '8000', '21-06-2016');
INSERT INTO `products_added` VALUES ('3', '::1', 'Es Susu Coklat', '6000', '1', '6000', '21-06-2016');
INSERT INTO `products_added` VALUES ('4', '::1', 'Sambal Bawang Gobal-Gabul', '2500', '1', '2500', '21-06-2016');
INSERT INTO `products_added` VALUES ('5', '::1', 'Sambal Bawang', '1500', '1', '1500', '21-06-2016');
INSERT INTO `products_added` VALUES ('6', '::1', 'Plecing Jawa', '3500', '1', '3500', '21-06-2016');
INSERT INTO `products_added` VALUES ('7', '::1', 'Ca Jamur', '5000', '1', '5000', '21-06-2016');
INSERT INTO `products_added` VALUES ('8', '::1', 'Ca Kangkung', '4500', '1', '4500', '21-06-2016');
INSERT INTO `products_added` VALUES ('15', '127.0.0.1', 'Sambal Tahu', '2500', '1', '2500', '21-06-2016');
INSERT INTO `products_added` VALUES ('14', '127.0.0.1', 'Sambal Tempe', '2500', '1', '2500', '21-06-2016');
INSERT INTO `products_added` VALUES ('13', '127.0.0.1', 'Sambal Teri', '4000', '1', '4000', '21-06-2016');
INSERT INTO `products_added` VALUES ('16', '127.0.0.1', 'Nasi Putih (Per Porsi)', '4000', '1', '4000', '21-06-2016');
INSERT INTO `products_added` VALUES ('17', '127.0.0.1', 'Air Es', '1500', '1', '1500', '21-06-2016');
INSERT INTO `products_added` VALUES ('18', '127.0.0.1', 'Plecing Jawa', '3500', '1', '3500', '21-06-2016');
INSERT INTO `products_added` VALUES ('19', '127.0.0.1', 'Sayur Asem', '2500', '1', '2500', '21-06-2016');

-- ----------------------------
-- Table structure for `products_bought`
-- ----------------------------
DROP TABLE IF EXISTS `products_bought`;
CREATE TABLE `products_bought` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(200) NOT NULL,
  `item_names` varchar(200) NOT NULL,
  `prices` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of products_bought
-- ----------------------------

-- ----------------------------
-- Table structure for `reservation`
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_member` bigint(11) NOT NULL,
  `id_meja` bigint(11) NOT NULL,
  `id_product` bigint(11) NOT NULL,
  `date` varchar(11) NOT NULL,
  `jam` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of reservation
-- ----------------------------
