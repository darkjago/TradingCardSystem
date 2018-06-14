/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.7.22-0ubuntu18.04.1 : Database - yu-gi-oh
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yu-gi-oh` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `yu-gi-oh`;

/*Data for the table `atributes` */

insert  into `atributes`(`id_atribute`,`name`,`enable`) values (1,'Dark',1),(2,'Earth',1),(3,'Light',1),(4,'Wind',1),(5,'Fire',1),(6,'Water',1),(7,'Divine',1);

/*Data for the table `card_type` */

insert  into `card_type`(`id_type`,`name`,`enable`) values (1,'Monster',1),(2,'Fusion Monster',1),(3,'Ritual Monster',1),(4,'Spell',1),(5,'Trap',1),(6,'Synchro Monster',1),(7,'XYZ Monster',1);

/*Data for the table `monster_flags` */

/*Data for the table `monster_type` */

insert  into `monster_type`(`id_type_monster`,`name`,`enable`) values (1,'SPELLCASTER',1),(2,'WARRIOR',1),(3,'FAIRY',1),(4,'BEAST',1),(5,'BEAST-WARRIOR',1),(6,'WINDGET-BEAST',1),(7,'AQUA',1),(8,'FISH',1),(9,'SEA SERPENT',1),(10,'REPTILE',1),(11,'PSIQUIC',1),(12,'DINOSAUR',1),(13,'ROCK',1),(14,'DIVINE BEAST',1);

/*Data for the table `rarity` */

insert  into `rarity`(`id_rarity`,`name`,`enable`) values (1,'Common',1),(2,'Rare',1),(3,'Super',1),(4,'Ultra',1),(5,'Ghost',1),(6,'Secret',1),(7,'Mosaic',1);

/*Data for the table `spell_type` */

insert  into `spell_type`(`id_type_spell`,`name`,`enable`) values (1,'NORMAL',1),(2,'QUICK',1),(3,'CONTINUOUS',1),(4,'EQUIP',1),(5,'FIELD',1),(6,'RITUAL',1);

/*Data for the table `trap_type` */

insert  into `trap_type`(`id_trap_type`,`name`,`enable`) values (1,'NORMAL',1),(2,'CONTINUOUS',1),(3,'COUNTER',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
