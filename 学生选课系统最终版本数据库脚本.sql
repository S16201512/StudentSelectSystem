/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.13 : Database - stacs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`stacs` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `stacs`;

/*Table structure for table `t_a_t` */

DROP TABLE IF EXISTS `t_a_t`;

CREATE TABLE `t_a_t` (
  `Kdate` varchar(24) DEFAULT NULL,
  `Tno` varchar(10) DEFAULT NULL,
  `Kno` varchar(24) DEFAULT NULL,
  `KworkDay` varchar(24) DEFAULT NULL,
  `Cno` varchar(20) DEFAULT NULL,
  `Croom` varchar(6) DEFAULT NULL,
  `Cweek` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_a_t` */

insert  into `t_a_t`(`Kdate`,`Tno`,`Kno`,`KworkDay`,`Cno`,`Croom`,`Cweek`) values ('2017-2018下学期','16201513','1.2节','3','16201513数据结构','D311','第二周'),('2017-2018下学期','16201513','1.2节','1','16201513数据库','D302','第一周'),('2017-2018下学期','16201513','1.2节','3','16201513数据结构','D311','第一周'),('2017-2018下学期','16201513','3.4节','2','16201513数据库','D301','第一周'),('2017-2018下学期','16201513','3.4节','4','16201513数据结构','D311','第一周'),('2017-2018下学期','16201513','5.6节','1','16201513数据结构','D102','第一周'),('2017-2018下学期','16201513','7.8节','5','16201513音乐','D301','第一周'),('2017-2018下学期','16201513','5.6节','2','16201513音乐','D110','第一周'),('2017-2018下学期','16201513','5.6节','4','16201513大学物理','D102','第一周'),('2017-2018下学期','16201513','5.6节','3','16201513数据库','D102','第一周'),('2017-2018下学期','16201513','1.2节','1','16201513数据库','D302','第二周'),('2017-2018下学期','16201513','1.2节','3','16201513数据结构','D311','第二周'),('2017-2018下学期','16201513','3.4节','2','16201513数据库','D301','第二周'),('2017-2018下学期','16201513','3.4节','4','16201513数据结构','D311','第二周'),('2017-2018下学期','16201513','5.6节','1','16201513数据结构','D102','第二周'),('2017-2018下学期','16201513','7.8节','5','16201513音乐','D301','第二周'),('2017-2018下学期','16201513','7.8节','2','16201513音乐','D110','第二周'),('2017-2018下学期','16201513','5.6节','4','16201513大学物理','D102','第二周'),('2017-2018下学期','16201513','5.6节','3','16201513数据库','D102','第二周');

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `Ano` varchar(8) NOT NULL,
  `Apassword` varchar(40) DEFAULT NULL,
  `Aname` varchar(50) DEFAULT NULL,
  `Agender` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`Ano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_admin` */

insert  into `t_admin`(`Ano`,`Apassword`,`Aname`,`Agender`) values ('1','202cb962ac59075b964b07152d234b70','何文勇','M');

/*Table structure for table `t_arrange_class` */

DROP TABLE IF EXISTS `t_arrange_class`;

CREATE TABLE `t_arrange_class` (
  `Kdate` varchar(24) DEFAULT NULL,
  `ClassNo` varchar(24) DEFAULT NULL,
  `KworkDay` varchar(24) DEFAULT NULL,
  `Kno` varchar(24) DEFAULT NULL,
  `Cno` varchar(20) DEFAULT NULL,
  `RoomNo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_arrange_class` */

insert  into `t_arrange_class`(`Kdate`,`ClassNo`,`KworkDay`,`Kno`,`Cno`,`RoomNo`) values ('2018-2019,2','162015','星期一','1,2节','16201513数据库','A201'),('2018-2019,2','162015','星期一','3,4节','16201513操作系统','B301'),('2018-2019,2','162015','星期一','7,8节','16201513数据结构','D601'),('2018-2019,2','162015','星期二','1,2节','16201513大学物理','F101'),('2018-2019,2','162015','星期二','9,10节','16201513美术','D201'),('2018-2019,2','162015','星期三','3,4节','16201513数据结构','B101'),('2018-2019,2','162015','星期三','7,8节','16201513JAVA面向对象','D301'),('2018-2019,2','162015','星期四','3,4节','16201513JAVA面向对象','G301'),('2018-2019,2','162015','星期四','7,8节','16201513WEB开发','D321'),('2018-2019,2','162015','星期五','1,2节','16201513体育','D341'),('2018-2019,2','162015','星期五','7,8节','16201513汇编原理','S301');

/*Table structure for table `t_arrange_room` */

DROP TABLE IF EXISTS `t_arrange_room`;

CREATE TABLE `t_arrange_room` (
  `Kdate` varchar(24) DEFAULT NULL,
  `RoomNo` varchar(10) DEFAULT NULL,
  `KworkDay` varchar(24) DEFAULT NULL,
  `Kno` varchar(24) DEFAULT NULL,
  `Cno` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_arrange_room` */

insert  into `t_arrange_room`(`Kdate`,`RoomNo`,`KworkDay`,`Kno`,`Cno`) values ('2018-2019,2','A201','星期一','1,2节','16201513数据库'),('2018-2019,2','B301','星期一','3,4节','16201513操作系统'),('2018-2019,2','S301','星期一','5,6节','16201513篮球课'),('2018-2019,2','D601','星期一','7,8节','16201513数据结构'),('2018-2019,2','F101','星期二','1,2节','16201513大学物理'),('2018-2019,2','G301','星期二','3,4节','16201513大学语文'),('2018-2019,2','D201','星期二','9,10节','16201513美术'),('2018-2019,2','B101','星期三','3,4节','16201513数据结构'),('2018-2019,2','C302','星期三','5,6节','16201513WEB开发'),('2018-2019,2','D301','星期三','7,8节','16201513JAVA面向对象'),('2018-2019,2','G301','星期四','3,4节','16201513JAVA面向对象'),('2018-2019,2','D321','星期四','7,8节','16201513WEB开发'),('2018-2019,2','D341','星期五','1,2节','16201513体育'),('2018-2019,2','G341','星期五','3,4节','16201513音乐'),('2018-2019,2','S301','星期五','7,8节','16201513汇编原理');

/*Table structure for table `t_arrange_student` */

DROP TABLE IF EXISTS `t_arrange_student`;

CREATE TABLE `t_arrange_student` (
  `Kdate` varchar(24) DEFAULT NULL,
  `Sno` varchar(10) DEFAULT NULL,
  `KworkDay` varchar(24) DEFAULT NULL,
  `Kno` varchar(24) DEFAULT NULL,
  `Cno` varchar(20) DEFAULT NULL,
  `RoomNo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_arrange_student` */

insert  into `t_arrange_student`(`Kdate`,`Sno`,`KworkDay`,`Kno`,`Cno`,`RoomNo`) values ('2018-2019,2','16201501','星期一','1,2节','16201513数据库','A201'),('2018-2019,2','16201501','星期一','3,4节','16201513操作系统','B301'),('2018-2019,2','16201501','星期一','5,6节','16201513篮球课','S301'),('2018-2019,2','16201501','星期一','7,8节','16201513数据结构','D601'),('2018-2019,2','16201501','星期二','1,2节','16201513大学物理','F101'),('2018-2019,2','16201501','星期二','3,4节','16201513大学语文','G301'),('2018-2019,2','16201501','星期二','9,10节','16201513美术','D201'),('2018-2019,2','16201501','星期三','3,4节','16201513数据结构','B101'),('2018-2019,2','16201501','星期三','5,6节','16201513WEB开发','C302'),('2018-2019,2','16201501','星期三','7,8节','16201513JAVA面向对象','D301'),('2018-2019,2','16201501','星期四','3,4节','16201513JAVA面向对象','G301'),('2018-2019,2','16201501','星期四','7,8节','16201513WEB开发','D321'),('2018-2019,2','16201501','星期五','1,2节','16201513体育','D341'),('2018-2019,2','16201501','星期五','3,4节','16201513音乐','G341'),('2018-2019,2','16201501','星期五','7,8节','16201513汇编原理','S301');

/*Table structure for table `t_course` */

DROP TABLE IF EXISTS `t_course`;

CREATE TABLE `t_course` (
  `Cno` varchar(20) NOT NULL,
  `Cname` varchar(40) DEFAULT NULL,
  `Time_out` varchar(5) DEFAULT NULL,
  `Credit` double DEFAULT NULL,
  `Cintroduction` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_course` */

/*Table structure for table `t_sc` */

DROP TABLE IF EXISTS `t_sc`;

CREATE TABLE `t_sc` (
  `Sno` varchar(8) NOT NULL,
  `Cno` varchar(20) NOT NULL,
  `Tno` varchar(8) NOT NULL,
  `Grade` double DEFAULT NULL,
  PRIMARY KEY (`Sno`,`Cno`,`Tno`),
  KEY `Cno` (`Cno`),
  KEY `Tno` (`Tno`),
  CONSTRAINT `t_sc_ibfk_1` FOREIGN KEY (`Sno`) REFERENCES `t_student` (`sno`),
  CONSTRAINT `t_sc_ibfk_2` FOREIGN KEY (`Cno`) REFERENCES `t_course` (`cno`),
  CONSTRAINT `t_sc_ibfk_3` FOREIGN KEY (`Tno`) REFERENCES `t_teacher` (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_sc` */

/*Table structure for table `t_student` */

DROP TABLE IF EXISTS `t_student`;

CREATE TABLE `t_student` (
  `Sno` varchar(8) NOT NULL,
  `Spassword` varchar(40) DEFAULT NULL,
  `Sname` varchar(50) DEFAULT NULL,
  `Sgender` varchar(2) DEFAULT NULL,
  `Smail` varchar(50) DEFAULT NULL,
  `SidentityNo` varchar(18) DEFAULT NULL,
  `Stele` varchar(11) DEFAULT NULL,
  `Sdorm` varchar(20) DEFAULT NULL,
  `Sdept` varchar(50) DEFAULT NULL,
  `Sidentity` varchar(20) DEFAULT NULL,
  `Sbirth` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_student` */

insert  into `t_student`(`Sno`,`Spassword`,`Sname`,`Sgender`,`Smail`,`SidentityNo`,`Stele`,`Sdorm`,`Sdept`,`Sidentity`,`Sbirth`) values ('16201501','202cb962ac59075b964b07152d234b70','张军','M','133711@qq.com','157983333253635','1579833332','20-502','软件学院','学生','1998-04-06'),('16201502','202cb962ac59075b964b07152d234b70','张神','F','133711@qq.com','157982333353635','1579833332','20-502','软件学院','学生','1998-04-06'),('16201503','202cb962ac59075b964b07152d234b70','巫女服','M','133711@qq.com','157983333253635','1579833332','20-502','软件学院','学生','1998-04-06'),('16201504','202cb962ac59075b964b07152d234b70','天天','F','133711@qq.com','15798333253635','1579833332','20-502','软件学院','学生','1998-04-06'),('16201505','202cb962ac59075b964b07152d234b70','卡军','M','133711@qq.com','15733398253635','1579833332','20-502','软件学院','学生','1998-04-06'),('16201506','202cb962ac59075b964b07152d234b70','校方','F','133711@qq.com','15733398253635','1579833332','20-502','软件学院','学生','1998-04-06'),('16201507','202cb962ac59075b964b07152d234b70','真大方','M','133711@qq.com','15798253635','1579833332','20-502','软件学院','学生','1998-04-06'),('16201508','202cb962ac59075b964b07152d234b70','甲午','F','133711@qq.com','15793338253635','1579833332','20-502','软件学院','学生','1998-04-06'),('16201512','202cb962ac59075b964b07152d234b70','何文勇','M','1060667497@qq.com','360','127','20-430','软件工程','学生','19980517');

/*Table structure for table `t_tc` */

DROP TABLE IF EXISTS `t_tc`;

CREATE TABLE `t_tc` (
  `Tno` varchar(8) NOT NULL,
  `Cno` varchar(20) NOT NULL,
  PRIMARY KEY (`Tno`,`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_tc` */

/*Table structure for table `t_teacher` */

DROP TABLE IF EXISTS `t_teacher`;

CREATE TABLE `t_teacher` (
  `Tno` varchar(8) NOT NULL,
  `Tpassword` varchar(40) DEFAULT NULL,
  `Tname` varchar(50) DEFAULT NULL,
  `Tgender` varchar(2) DEFAULT NULL,
  `Tphone` varchar(11) DEFAULT NULL,
  `Temail` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_teacher` */

insert  into `t_teacher`(`Tno`,`Tpassword`,`Tname`,`Tgender`,`Tphone`,`Temail`) values ('11111111','202cb962ac59075b964b07152d234b70','张军','M','15798253635','133711@qq.com'),('22222222','202cb962ac59075b964b07152d234b70','张神','F','15798253635','133711@qq.com'),('33333333','202cb962ac59075b964b07152d234b70','巫女服','M','15798253635','133711@qq.com'),('44444444','202cb962ac59075b964b07152d234b70','天天','F','15798253635','133711@qq.com'),('55555555','202cb962ac59075b964b07152d234b70','卡军','M','15798253635','133711@qq.com'),('66666666','202cb962ac59075b964b07152d234b70','校方','F','15798253635','133711@qq.com'),('77777777','202cb962ac59075b964b07152d234b70','真大方','M','15798253635','133711@qq.com'),('88888888','202cb962ac59075b964b07152d234b70','甲午','F','15798253635','133711@qq.com');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(8) DEFAULT NULL,
  `Password` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
