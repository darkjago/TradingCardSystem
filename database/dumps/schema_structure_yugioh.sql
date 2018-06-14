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

/*Table structure for table `albums` */

DROP TABLE IF EXISTS `albums`;

CREATE TABLE `albums` (
  `id_album` int(11) NOT NULL AUTO_INCREMENT,
  `album_name` varchar(32) DEFAULT NULL,
  `enable` int(11) DEFAULT '1',
  PRIMARY KEY (`id_album`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `atributes` */

DROP TABLE IF EXISTS `atributes`;

CREATE TABLE `atributes` (
  `id_atribute` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `enable` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_atribute`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';

/*Table structure for table `card_type` */

DROP TABLE IF EXISTS `card_type`;

CREATE TABLE `card_type` (
  `id_type` int(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `enable` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';

/*Table structure for table `cards` */

DROP TABLE IF EXISTS `cards`;

CREATE TABLE `cards` (
  `id_card` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `monster_flags` int(11) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `id_rarity` int(11) NOT NULL,
  `enable` int(11) NOT NULL DEFAULT '1',
  `sheet` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `specific_type` int(11) DEFAULT NULL,
  `id_atribute` int(11) DEFAULT NULL,
  `id_album` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `link` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id_card`),
  KEY `id_type` (`id_type`,`id_rarity`,`id_atribute`,`id_album`),
  KEY `FK_rarity` (`id_rarity`),
  KEY `FK_album` (`id_album`),
  CONSTRAINT `FK_album` FOREIGN KEY (`id_album`) REFERENCES `albums` (`id_album`),
  CONSTRAINT `FK_card_type` FOREIGN KEY (`id_type`) REFERENCES `card_type` (`id_type`),
  CONSTRAINT `FK_rarity` FOREIGN KEY (`id_rarity`) REFERENCES `rarity` (`id_rarity`)
) ENGINE=InnoDB AUTO_INCREMENT=879 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';

/*Table structure for table `monster_flags` */

DROP TABLE IF EXISTS `monster_flags`;

CREATE TABLE `monster_flags` (
  `id_flag` int(11) NOT NULL AUTO_INCREMENT,
  `effect` tinyint(1) NOT NULL DEFAULT '0',
  `spirit` tinyint(1) NOT NULL DEFAULT '0',
  `union_m` tinyint(1) NOT NULL DEFAULT '0',
  `tuner` tinyint(1) NOT NULL DEFAULT '0',
  `pendulum` tinyint(1) NOT NULL DEFAULT '0',
  `enable` int(11) DEFAULT '1',
  PRIMARY KEY (`id_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `monster_type` */

DROP TABLE IF EXISTS `monster_type`;

CREATE TABLE `monster_type` (
  `id_type_monster` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `enable` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_type_monster`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';

/*Table structure for table `rarity` */

DROP TABLE IF EXISTS `rarity`;

CREATE TABLE `rarity` (
  `id_rarity` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `enable` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_rarity`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';

/*Table structure for table `spell_type` */

DROP TABLE IF EXISTS `spell_type`;

CREATE TABLE `spell_type` (
  `id_type_spell` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `enable` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_type_spell`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';

/*Table structure for table `trap_type` */

DROP TABLE IF EXISTS `trap_type`;

CREATE TABLE `trap_type` (
  `id_trap_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `enable` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_trap_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';

/* Function  structure for function  `get_album_id` */

/*!50003 DROP FUNCTION IF EXISTS `get_album_id` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `get_album_id`( _album_name varchar(256) ) RETURNS int(11)
    DETERMINISTIC
BEGIN
	declare album_id int default -1;
	
	select
		id_album
	into
		album_id
	from
		albums
	where
		album_name like concat('%',_album_name,'%') and enable = 1;
		
	if album_id is null then
		set album_id = -1;
	end if;
	
	return album_id;
    END */$$
DELIMITER ;

/* Function  structure for function  `get_album_name` */

/*!50003 DROP FUNCTION IF EXISTS `get_album_name` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `get_album_name`( _id_album int) RETURNS varchar(256) CHARSET latin1
    DETERMINISTIC
BEGIN
	declare album varchar(256) default '';
	
	select
		ifnull(album_name,'')
	into
		album
	from
		albums
	where
		id_album = _id_album and enable = 1;
		
	return album;
END */$$
DELIMITER ;

/* Function  structure for function  `get_monster_flag_value` */

/*!50003 DROP FUNCTION IF EXISTS `get_monster_flag_value` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `get_monster_flag_value`( monster_flag int, flag int ) RETURNS tinyint(1)
BEGIN
	declare flag_value bool default 0;
	declare flag bool default 0;
	
	select monster_flag & flag into flag;
		
	if flag = 0 then
		set flag_value = 0;
	else
		set flag_value = 1;
	end if;
	
	return flag_value;
END */$$
DELIMITER ;

/* Function  structure for function  `get_specific_type` */

/*!50003 DROP FUNCTION IF EXISTS `get_specific_type` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `get_specific_type`( id_type int, id_specific_type int) RETURNS char(32) CHARSET latin1
BEGIN
	declare specific_type varchar(32) default'';
	
	if id_type = 4 then
		select st.name into specific_type from spell_type st where st.id_type_spell = id_specific_type and st.enable = 1;
	elseif id_type = 5 then
		SELECT tt.name into specific_type FROM trap_type tt WHERE tt.id_trap_type = id_specific_type and tt.enable = 1;
	else
		SELECT mt.name into specific_type FROM monster_type mt WHERE mt.id_type_monster = id_specific_type and mt.enable = 1;
	end if;
	
	return specific_type;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `add_new_card` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_new_card` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `add_new_card`(
in card_name varchar(32), 
in _monster_flags int, 
in _id_type int,
in _id_rarity int,
in _album int,
in _sheet int,
in _position int,
in _text varchar(1024),
in _specific_type int,
in _id_atribute int,
in _level int
)
BEGIN
	declare existe, occuped_pos int default 0;
	declare last_card int;
	declare last_monster_flag int;
	declare effect_flag, spirit_flag, union_flag, tuner_flag, pendulum_flag bool default 0;
	
	
	select 
		id_card,
		_album,
		sheet,
		position
	into
		existe,
		@album,
		@hoja,
		@pos
	from 
		cards 
	where 
		name like card_name and id_type = _id_type and specific_type = _specific_type and id_rarity = _id_rarity and enable=1;
		
	
	select
		id_card,
		card_name
	into
		occuped_pos,
		@nombre_carta
	from
		cards c
	where
		c.id_album = _album and c.sheet = _sheet and c.position = _position and c.enable = 1;
	
	if existe < 1 and occuped_pos < 1 then
		insert into cards 
			( name, id_type, id_rarity, enable, id_album, sheet, position,  specific_type, id_atribute, level)
		values
			( card_name, _id_type, _id_rarity, 1, _album, _sheet, _position, _specific_type, _id_atribute, _level);
			
		set last_card = last_insert_id();
				
		if _id_type = 1 then
		
			set effect_flag = get_monster_flag_value(_monster_flags, 1);
			set spirit_flag = get_monster_flag_value(_monster_flags, 2);
			set union_flag = get_monster_flag_value(_monster_flags, 4);
			set tuner_flag = get_monster_flag_value(_monster_flags, 8);
			set pendulum_flag = get_monster_flag_value(_monster_flags, 16);
				
			insert into
				monster_flags (effect, spirit, union_m, tuner, pendulum)
			values
				(effect_flag, spirit_flag, union_flag, tuner_flag, pendulum_flag);
					
			set last_monster_flag = LAST_INSERT_ID();
			
			UPDATE
				cards
			set
				monster_flags = last_monster_flag
			where
				id_card = last_card;
		
		end if;
		
			
	else
		if existe > 0 then
			select concat('Ya existe un registro de la carta \n[',card_name,']\n en el album [',get_album_name(@album),']\n en la hoja [',@hoja,']\ posicion [',@pos,']') as mensaje_error;
		elseif occuped_pos > 0 then
			select concat('La posicion [',_position,']\n en la hoja [',_sheet,']\n del album [',get_album_name(_album),']\n ya se encuentra ocupada por \n[',@nombre_carta,']') as mensaje_error;
		end if;
	
	end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `get_free_positions_album` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_free_positions_album` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `get_free_positions_album`( in _album_name varchar(256), in _id_album int )
BEGIN
	declare id int default -1;
	declare max_album_sheet, sheet_count, position_count, existe int default 0;
	if _album_name is not null then
		set id = get_album_id(_album_name);
	elseif _id_album > -1 then
		set id = _id_album;
	end if;
	
			
	IF id > -1 THEN
	
		SELECT 
			MAX(sheet)
		INTO
			max_album_sheet
		FROM
			cards
		WHERE
			id_album = id AND ENABLE = 1;
			
		
		IF max_album_sheet IS NOT NULL AND max_album_sheet > 0 THEN
			
			DROP TEMPORARY TABLE IF EXISTS free_position;
			CREATE TEMPORARY TABLE free_position(free_sheet INT(11),free_pos INT (11));
			
			SET sheet_count = 0;
			WHILE sheet_count < max_album_sheet DO
					
				SET position_count = 1;
				WHILE position_count < 19 DO
						
					SELECT 
						COUNT(id_card)
					INTO
						existe
					FROM 
						cards
					WHERE
						id_album = id AND sheet = (sheet_count +1) AND POSITION = position_count AND ENABLE = 1;
							
					IF existe < 1 THEN
						INSERT INTO 
							free_position
						SET
							free_sheet = sheet_count + 1,
							free_pos = position_count;
					END IF;
						
					SET position_count = position_count +1;
				END WHILE;
				SET sheet_count = sheet_count + 1;
					
			END WHILE;
				
			SELECT
				free_sheet,
				free_pos
			FROM
				free_position;
					
			DROP TEMPORARY TABLE free_position;
			
		ELSE
			SELECT CONCAT('El album [',IFNULL(_album_name,''),']n o id album [',id,']\n no tiene ninguna posicion ocupada') AS mensaje_error;
			
		END IF;	
	
	ELSE
		SELECT CONCAT('No se encontro album [',IFNULL(_album_name,''),']n o id album[',_id_album,']n.Verifique.') AS mensaje_error;
	END IF;
	
		
	
	
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `get_last_five_added_cards` */

/*!50003 DROP PROCEDURE IF EXISTS  `get_last_five_added_cards` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `get_last_five_added_cards`()
BEGIN
	SELECT 
		c.id_card,
		c.name "CARD NAME",
		get_monster_flag_value(c.monster_flags, 1) EFFECT,
		ct.name "CARD TYPE",
		r.name RARITY,
		al.album_name "ALBUM NAME",
		c.sheet SHEET,
		c.position POSITION,
		get_specific_type(c.id_type, c.specific_type) "TYPE",
		a.name ATTRIBUTE,
		c.level LEVEL	
	FROM 
		cards c
	JOIN 
		card_type ct ON (c.id_type = ct.id_type AND ct.enable = 1)
	JOIN 
		rarity r ON (c.id_rarity = r.id_rarity AND r.enable = 1)
	LEFT JOIN 
		atributes a ON (c.id_atribute = a.id_atribute AND a.enable = 1)
	LEFT JOIN 
		albums al ON (c.id_album = al.id_album AND al.enable = 1)
	WHERE 
		c.enable = 1
	order by
		c.id_card desc
	limit
		5;
END */$$
DELIMITER ;

/* Procedure structure for procedure `search_card` */

/*!50003 DROP PROCEDURE IF EXISTS  `search_card` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `search_card`( in card_name varchar (64))
BEGIN
	select 
		c.id_card,
		c.name "CARD NAME",
		ifnull(mf.effect,0) EFFECT,
		ct.name "CARD TYPE",
		r.name RARITY,
		al.album_name "ALBUM NAME",
		c.sheet SHEET,
		c.position POSITION,
		-- c.text TEXT,
		get_specific_type(c.id_type, c.specific_type) "TYPE",
		a.name ATTRIBUTE,
		c.level LEVEL	
	from cards c
	join card_type ct on (c.id_type = ct.id_type and ct.enable = 1)
	join rarity r on (c.id_rarity = r.id_rarity and r.enable = 1)
	left join atributes a on (c.id_atribute = a.id_atribute and a.enable = 1)
	left join albums al on (c.id_album = al.id_album and al.enable = 1)
	left join monster_flags mf on (mf.id_flag = c.monster_flags and mf.enable = 1)
	where c.name like concat('%', card_name, '%') and c.enable = 1;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
