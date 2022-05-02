CREATE TABLE `darrkbunker_fingerprint` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
    `oldfingerprint` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
    `newfingerprint` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
    PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=4
;

CREATE TABLE `darrkbunker_permissions` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
    PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=2
;
                