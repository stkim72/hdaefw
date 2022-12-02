-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.10.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.2.0.6576
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 wigo.tb_sys_api_exec_hst 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_api_exec_hst` (
  `API_HST_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'API이력ID',
  `API_ID` int(11) DEFAULT NULL COMMENT 'API ID',
  `API_CALL_URL` varchar(1000) DEFAULT NULL COMMENT 'API호출URL',
  `API_RSLT_CD` varchar(100) DEFAULT NULL COMMENT 'API결과코드',
  `API_RSLT_MSG_TXN` varchar(1000) DEFAULT NULL COMMENT 'API결과메시지내역',
  `API_PARAM_TXN` longtext DEFAULT NULL COMMENT 'API파라미터내역',
  `API_RSLT_TXN` longtext DEFAULT NULL COMMENT 'API결과내역',
  `API_CALL_DT` datetime NOT NULL COMMENT 'API호출일시',
  `API_EXEC_MSEC` int(11) DEFAULT NULL COMMENT 'API실행초',
  `API_CALL_IP_ADDR` varchar(100) DEFAULT NULL COMMENT 'API호출IP주소',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`API_HST_ID`),
  KEY `IX_SYS_API_EXEC_HST_01` (`API_ID`,`API_CALL_DT` DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='API실행로그';

-- 테이블 데이터 wigo.tb_sys_api_exec_hst:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_api_exec_hst`;

-- 테이블 wigo.tb_sys_api_info_bas 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_api_info_bas` (
  `API_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'API ID',
  `SYS_CD` varchar(20) DEFAULT NULL COMMENT '시스템코드',
  `API_NM` varchar(100) DEFAULT NULL COMMENT 'API명',
  `API_URL` varchar(1000) DEFAULT NULL COMMENT 'APIURL',
  `CALL_MTHD_CD` varchar(100) DEFAULT NULL COMMENT '호출메쏘드코드',
  `API_AUTH_YN` varchar(1) DEFAULT NULL COMMENT 'API권한여부',
  `USE_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`API_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='API기본';

-- 테이블 데이터 wigo.tb_sys_api_info_bas:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_api_info_bas`;

-- 테이블 wigo.tb_sys_batch_exec_hst 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_batch_exec_hst` (
  `BATCH_HST_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '배치이력ID',
  `BATCH_ID` varchar(20) DEFAULT NULL COMMENT '배치ID',
  `SYS_CD` varchar(20) DEFAULT NULL COMMENT '시스템코드',
  `WRK_ID` varchar(100) DEFAULT NULL COMMENT '작업ID',
  `BATCH_RSLT_CD` varchar(100) DEFAULT NULL COMMENT '배치결과코드',
  `BATCH_CALL_DT` datetime DEFAULT NULL COMMENT '배치호출일시',
  `BATCH_EXEC_MSEC` int(11) DEFAULT NULL COMMENT '배치실행밀리초',
  `ERR_MSG_TXN` longtext DEFAULT NULL COMMENT '오류메시지내역',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`BATCH_HST_ID`),
  KEY `IX_SYS_BATCH_EXEC_HST01` (`BATCH_ID`,`BATCH_CALL_DT`),
  KEY `IX_SYS_BATCH_EXEC_HST02` (`BATCH_CALL_DT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='배치실행이력';

-- 테이블 데이터 wigo.tb_sys_batch_exec_hst:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_batch_exec_hst`;

-- 테이블 wigo.tb_sys_batch_info_bas 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_batch_info_bas` (
  `BATCH_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '배치ID',
  `SYS_CD` varchar(20) DEFAULT NULL COMMENT '시스템코드',
  `BATCH_NM` varchar(100) DEFAULT NULL COMMENT '배치명',
  `WRK_ID` varchar(100) DEFAULT NULL COMMENT '작업ID',
  `LAST_EXEC_DT` datetime DEFAULT NULL COMMENT '최종실행일시',
  `LAST_SUCC_YN` varchar(1) DEFAULT NULL COMMENT '최종성공여부',
  `USE_YN` varchar(1) DEFAULT 'Y' COMMENT '사용여부',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`BATCH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='배치정보기본';

-- 테이블 데이터 wigo.tb_sys_batch_info_bas:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_batch_info_bas`;

-- 테이블 wigo.tb_sys_chng_hst 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_chng_hst` (
  `CHNG_HST_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '변경이력ID',
  `MENU_ID` varchar(20) DEFAULT NULL COMMENT '메뉴코드',
  `CHNG_CALL_URL` varchar(1000) DEFAULT NULL COMMENT '변경호출URL',
  `CHNG_RSLT_TXN` longtext DEFAULT NULL COMMENT '변경결과내역',
  `CHNG_PARAM_TXN` longtext DEFAULT NULL COMMENT '변경파라미터내역',
  `CHNG_CALL_TXN` longtext DEFAULT NULL COMMENT '변경호출내역',
  `CHNG_CALL_DT` datetime DEFAULT NULL COMMENT '변경호출일시',
  `CHNG_EXEC_MSEC` int(11) DEFAULT NULL COMMENT '변경실행밀리초',
  `CHNG_CALL_IP_ADDR` varchar(100) DEFAULT NULL COMMENT '변경호출IP주소',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`CHNG_HST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='정보변경이력';

-- 테이블 데이터 wigo.tb_sys_chng_hst:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_chng_hst`;

-- 테이블 wigo.tb_sys_comn_cd_bas 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_comn_cd_bas` (
  `COMN_CD` varchar(100) NOT NULL COMMENT '공통코드',
  `TOP_COMN_CD` varchar(100) NOT NULL COMMENT '최상위공통코드',
  `COMN_CD_LVL_NO` tinyint(4) NOT NULL COMMENT '공통코드레벨번호',
  `COMN_CD_ODRG` smallint(6) NOT NULL COMMENT '공통코드순번',
  `PRNTS_COMN_CD` varchar(100) DEFAULT NULL COMMENT '부모공통코드',
  `COMN_CD_NM` varchar(100) NOT NULL COMMENT '공통코드명',
  `USE_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `RFRN_1_COMN_CD` varchar(100) DEFAULT NULL COMMENT '참조1공통코드',
  `RFRN_2_COMN_CD` varchar(100) DEFAULT NULL COMMENT '참조2공통코드',
  `RFRN_3_COMN_CD` varchar(100) DEFAULT NULL COMMENT '참조3공통코드',
  `RFRN_4_COMN_CD` varchar(100) DEFAULT NULL COMMENT '참조4공통코드',
  `RFRN_5_COMN_CD` varchar(100) DEFAULT NULL COMMENT '참조5공통코드',
  `RFRN_6_COMN_CD` varchar(100) DEFAULT NULL COMMENT '참조6공통코드',
  `RFRN_7_COMN_CD` varchar(100) DEFAULT NULL COMMENT '참조7공통코드',
  `RFRN_8_COMN_CD` varchar(100) DEFAULT NULL COMMENT '참조8공통코드',
  `RFRN_9_COMN_CD` varchar(100) DEFAULT NULL COMMENT '참조9공통코드',
  `COMN_CD_1_USE_YN` varchar(1) DEFAULT 'Y' COMMENT '공통코드1사용여부',
  `COMN_CD_2_USE_YN` varchar(1) DEFAULT 'Y' COMMENT '공통코드2사용여부',
  `COMN_CD_3_USE_YN` varchar(1) DEFAULT 'Y' COMMENT '공통코드3사용여부',
  `COMN_CD_4_USE_YN` varchar(1) DEFAULT 'Y' COMMENT '공통코드4사용여부',
  `COMN_CD_5_USE_YN` varchar(1) DEFAULT 'Y' COMMENT '공통코드5사용여부',
  `COMN_CD_6_USE_YN` varchar(1) DEFAULT 'Y' COMMENT '공통코드6사용여부',
  `COMN_CD_7_USE_YN` varchar(1) DEFAULT 'Y' COMMENT '공통코드7사용여부',
  `COMN_CD_8_USE_YN` varchar(1) DEFAULT 'Y' COMMENT '공통코드8사용여부',
  `COMN_CD_9_USE_YN` varchar(1) DEFAULT 'Y' COMMENT '공통코드9사용여부',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`TOP_COMN_CD`,`COMN_CD`) USING BTREE,
  KEY `IX_SYS_COMN_CD_BAS_IX01` (`TOP_COMN_CD`,`COMN_CD_LVL_NO`,`COMN_CD_ODRG`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='공통코드';

-- 테이블 데이터 wigo.tb_sys_comn_cd_bas:~189 rows (대략적) 내보내기
DELETE FROM `tb_sys_comn_cd_bas`;
INSERT INTO `tb_sys_comn_cd_bas` (`COMN_CD`, `TOP_COMN_CD`, `COMN_CD_LVL_NO`, `COMN_CD_ODRG`, `PRNTS_COMN_CD`, `COMN_CD_NM`, `USE_YN`, `RFRN_1_COMN_CD`, `RFRN_2_COMN_CD`, `RFRN_3_COMN_CD`, `RFRN_4_COMN_CD`, `RFRN_5_COMN_CD`, `RFRN_6_COMN_CD`, `RFRN_7_COMN_CD`, `RFRN_8_COMN_CD`, `RFRN_9_COMN_CD`, `COMN_CD_1_USE_YN`, `COMN_CD_2_USE_YN`, `COMN_CD_3_USE_YN`, `COMN_CD_4_USE_YN`, `COMN_CD_5_USE_YN`, `COMN_CD_6_USE_YN`, `COMN_CD_7_USE_YN`, `COMN_CD_8_USE_YN`, `COMN_CD_9_USE_YN`, `REGR_ID`, `REG_DT`, `AMDR_ID`, `AMD_DT`) VALUES
	('AS', 'S000', 2, 3, 'S000', 'AS', 'Y', '#BABABA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-22 17:28:24', 'CRM_13007', '2022-10-24 10:09:48'),
	('BOS', 'S000', 2, 6, 'S000', 'BOS', 'Y', '#E5E5E9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-06-02 15:41:14', 'CRM_13007', '2022-10-24 10:09:48'),
	('CRA', 'S000', 2, 8, 'S000', '세라체크', 'Y', '#FFCBCB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-08-23 11:38:43', 'CRM_13007', '2022-10-24 10:09:48'),
	('CRM', 'S000', 2, 1, 'S000', 'CRM', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 16:31:08', 'CRM_13007', '2022-09-20 13:36:24'),
	('CTC', 'S000', 2, 2, 'S000', '상담', 'Y', '#FFE7E7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-22 17:28:24', 'CRM_13007', '2022-10-24 10:09:48'),
	('DNA', 'S000', 2, 9, 'S000', '세라DNA', 'Y', '#FFAE94', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-06-07 17:04:58', 'CRM_13007', '2022-10-24 10:09:48'),
	('EON', 'S000', 2, 12, 'S000', '발송', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-07 14:58:40', 'CRM_13007', '2022-10-24 10:09:48'),
	('IoT', 'S000', 2, 10, 'S000', 'IoT', 'Y', '#C9EAFF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-06-07 17:39:14', 'CRM_13007', '2022-10-24 10:09:48'),
	('MEM', 'S000', 2, 7, 'S000', '멤버십', 'Y', '#F0F4FF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-06-07 16:42:22', 'CRM_13007', '2022-10-24 10:09:48'),
	('POS', 'S000', 2, 5, 'S000', 'POS', 'Y', '#F4B6FF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-04-28 11:09:25', 'CRM_13007', '2022-10-24 10:09:48'),
	('PRC', 'S000', 2, 11, 'S000', '부모님연구소', 'Y', '#FFFFFF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13005', '2022-08-29 13:53:25', 'CRM_13007', '2022-10-24 10:09:48'),
	('S000', 'S000', 1, 130, NULL, '시스템', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '2020000001', '2022-02-25 09:36:45', '2020000001', '2022-02-25 09:36:45'),
	('SAP', 'S000', 2, 4, 'S000', 'SAP', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-07 13:57:57', 'CRM_13007', '2022-10-24 10:09:48'),
	('N', 'S010', 2, 2, 'S010', '미사용', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-08 16:31:21', 'USR20220303092315201', '2022-06-23 20:51:13'),
	('S010', 'S010', 1, 124, NULL, '사용여부', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-08 16:31:39', 'SYSTEM', '2021-02-08 16:31:39'),
	('Y', 'S010', 2, 1, 'S010', '사용', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-08 16:31:21', 'SYSTEM', '2021-02-08 16:31:21'),
	('1', 'S020', 2, 1, 'S020', '대분류', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-08 16:31:56', 'SYSTEM', '2021-02-08 16:31:56'),
	('2', 'S020', 2, 2, 'S020', '소분류', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-08 16:31:56', 'SYSTEM', '2021-02-08 16:31:56'),
	('S020', 'S020', 1, 125, NULL, '코드분류', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-08 16:40:34', 'SYSTEM', '2021-02-08 16:40:34'),
	('N', 'S030', 2, 1, 'S030', '정상', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-08 16:31:56', 'SYSTEM', '2021-02-08 16:31:56'),
	('S030', 'S030', 1, 126, NULL, '회원상태', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-08 16:40:34', 'SYSTEM', '2021-02-08 16:40:34'),
	('Y', 'S030', 2, 2, 'S030', '탈퇴', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-08 16:31:56', 'SYSTEM', '2021-02-08 16:31:56'),
	('F', 'S040', 2, 2, 'S040', '여', 'Y', '#fc7e7e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '2020000001', '2021-02-08 16:44:22', 'CRM_13007', '2022-10-24 10:35:09'),
	('M', 'S040', 2, 1, 'S040', '남', 'Y', '#51b8e5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '2020000001', '2021-02-08 16:44:22', 'CRM_13007', '2022-10-24 10:35:09'),
	('S040', 'S040', 1, 127, NULL, '성별', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '2020000001', '2021-02-08 16:43:53', '2020000001', '2021-02-08 16:43:53'),
	('N', 'S050', 2, 2, 'S050', '아니오', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '2020000001', '2021-02-15 18:03:15', '2020000001', '2021-02-15 18:03:15'),
	('S050', 'S050', 1, 128, NULL, '여부', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '2020000001', '2021-02-15 18:02:49', '2020000001', '2021-02-15 18:02:49'),
	('Y', 'S050', 2, 1, 'S050', '예', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '2020000001', '2021-02-15 18:03:15', '2020000001', '2021-02-15 18:03:15'),
	('010', 'S060', 2, 1, 'S060', '양력', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'admin', '2021-04-21 09:28:02', 'admin', '2021-04-21 09:28:02'),
	('020', 'S060', 2, 2, 'S060', '음력', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'admin', '2021-04-21 09:28:02', '2020000001', '2022-03-04 16:50:58'),
	('S060', 'S060', 1, 129, NULL, '양력/음력', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'admin', '2021-04-21 09:27:22', 'admin', '2021-04-21 09:27:22'),
	('button', 'S070', 2, 10, 'S070', 'button', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:02:37', 'USR20220303092315201', '2022-03-11 12:02:37'),
	('char', 'S070', 2, 1, 'S070', 'char', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:02:37', 'USR20220303092315201', '2022-03-11 12:02:37'),
	('checkbox', 'S070', 2, 4, 'S070', 'checkbox', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:02:37', 'USR20220303092315201', '2022-03-11 12:02:37'),
	('combo', 'S070', 2, 5, 'S070', 'combo', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:02:37', 'USR20220303092315201', '2022-03-11 12:02:37'),
	('date', 'S070', 2, 6, 'S070', 'date', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:02:37', 'USR20220303092315201', '2022-03-11 12:02:37'),
	('datemonth', 'S070', 2, 7, 'S070', 'datemonth', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:02:37', 'USR20220303092315201', '2022-03-11 12:02:37'),
	('datetime', 'S070', 2, 8, 'S070', 'datetime', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:02:37', 'USR20220303092315201', '2022-03-11 12:02:37'),
	('html', 'S070', 2, 11, 'S070', 'html', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:02:37', 'USR20220303092315201', '2022-03-11 12:02:37'),
	('int', 'S070', 2, 3, 'S070', 'int', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:02:37', 'USR20220303092315201', '2022-03-11 12:02:37'),
	('number', 'S070', 2, 2, 'S070', 'number', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:02:37', 'USR20220303092315201', '2022-03-11 12:02:37'),
	('phone', 'S070', 2, 12, 'S070', 'phone', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:02:37', 'USR20220303092315201', '2022-03-11 12:02:37'),
	('S070', 'S070', 1, 132, NULL, '데이터유형', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:00:55', 'USR20220303092315201', '2022-03-11 12:00:55'),
	('time', 'S070', 2, 9, 'S070', 'time', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:02:37', 'USR20220303092315201', '2022-03-11 12:02:37'),
	('center', 'S080', 2, 2, 'S080', 'center', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:03:44', 'USR20220303092315201', '2022-03-11 12:03:44'),
	('left', 'S080', 2, 1, 'S080', 'left', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:03:44', 'USR20220303092315201', '2022-03-11 12:03:44'),
	('right', 'S080', 2, 3, 'S080', 'right', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:03:44', 'USR20220303092315201', '2022-03-11 12:03:44'),
	('S080', 'S080', 1, 133, NULL, '정렬', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-03-11 12:03:21', 'USR20220303092315201', '2022-04-08 09:13:08'),
	('REG_DT', 'S090', 2, 3, 'S090', '등록일', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-14 16:47:51', 'USR20220303092315201', '2022-04-14 16:47:51'),
	('S090', 'S090', 1, 203, NULL, '일자구분', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-14 16:46:18', 'USR20220303092315201', '2022-04-14 16:46:18'),
	('USE_END_DT', 'S090', 2, 2, 'S090', '사용만료일', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-14 16:47:51', 'USR20220303092315201', '2022-04-14 16:47:51'),
	('USE_STA_DT', 'S090', 2, 1, 'S090', '사용시작일', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-14 16:47:51', 'USR20220303092315201', '2022-04-14 16:47:51'),
	('10', 'S100', 2, 1, 'S100', '10대', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-15 13:54:32', 'USR20220303092315201', '2022-04-15 13:54:32'),
	('20', 'S100', 2, 2, 'S100', '20대', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-15 13:54:32', 'USR20220303092315201', '2022-04-15 13:54:32'),
	('30', 'S100', 2, 3, 'S100', '30대', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-15 13:54:32', 'USR20220303092315201', '2022-04-15 13:54:32'),
	('40', 'S100', 2, 4, 'S100', '40대', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-15 13:54:32', 'USR20220303092315201', '2022-04-15 13:54:32'),
	('50', 'S100', 2, 5, 'S100', '50대', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-15 13:54:32', 'USR20220303092315201', '2022-04-15 13:54:32'),
	('60', 'S100', 2, 6, 'S100', '60대', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-15 13:54:32', 'USR20220303092315201', '2022-04-15 13:54:32'),
	('70', 'S100', 2, 7, 'S100', '70대', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-15 13:54:32', 'USR20220303092315201', '2022-04-15 13:54:32'),
	('80', 'S100', 2, 8, 'S100', '80대', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-15 13:54:32', 'USR20220303092315201', '2022-04-15 13:54:32'),
	('90', 'S100', 2, 9, 'S100', '90대', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-15 13:54:32', 'USR20220303092315201', '2022-04-15 13:54:32'),
	('S100', 'S100', 1, 208, NULL, '나이대', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-15 13:53:19', 'USR20220303092315201', '2022-04-15 13:53:19'),
	('N', 'S110', 2, 2, 'S110', '공개안함', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-19 10:42:05', 'USR20220303092315201', '2022-04-19 10:43:00'),
	('S110', 'S110', 1, 213, NULL, '공개여부', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-19 10:40:33', 'USR20220303092315201', '2022-04-19 10:40:33'),
	('Y', 'S110', 2, 1, 'S110', '공개', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-19 10:42:05', 'USR20220303092315201', '2022-04-19 10:43:00'),
	('001', 'S120', 2, 1, 'S120', '상세조회', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-19 16:47:40', 'USR20220303092315201', '2022-06-03 15:35:26'),
	('002', 'S120', 2, 2, 'S120', '목록조회', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-06-03 14:27:44', 'USR20220303092315201', '2022-06-03 15:35:26'),
	('003', 'S120', 2, 3, 'S120', '엑셀다운로드', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-06-03 14:27:44', 'USR20220303092315201', '2022-06-03 14:27:44'),
	('004', 'S120', 2, 4, 'S120', '수정', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-06-03 14:27:44', 'USR20220303092315201', '2022-06-03 14:27:44'),
	('005', 'S120', 2, 5, 'S120', '입력', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-06-03 15:35:38', 'USR20220303092315201', '2022-06-03 15:35:38'),
	('006', 'S120', 2, 6, 'S120', '삭제', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-06-03 15:35:50', 'USR20220303092315201', '2022-06-03 15:35:50'),
	('S120', 'S120', 1, 215, NULL, '수행업무코드', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-19 16:47:06', 'USR20220303092315201', '2022-04-19 16:47:06'),
	('1', 'S130', 2, 1, 'S130', '1회', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:25:18', 'USR20220303092315201', '2022-04-21 14:25:18'),
	('10', 'S130', 2, 10, 'S130', '10회', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:25:18', 'USR20220303092315201', '2022-04-21 14:25:18'),
	('2', 'S130', 2, 2, 'S130', '2회', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:25:18', 'USR20220303092315201', '2022-04-21 14:25:18'),
	('3', 'S130', 2, 3, 'S130', '3회', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:25:18', 'USR20220303092315201', '2022-04-21 14:25:18'),
	('4', 'S130', 2, 4, 'S130', '4회', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:25:18', 'USR20220303092315201', '2022-04-21 14:25:18'),
	('5', 'S130', 2, 5, 'S130', '5회', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:25:18', 'USR20220303092315201', '2022-04-21 14:25:18'),
	('6', 'S130', 2, 6, 'S130', '6회', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:25:18', 'USR20220303092315201', '2022-04-21 14:25:18'),
	('7', 'S130', 2, 7, 'S130', '7회', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:25:18', 'USR20220303092315201', '2022-04-21 14:25:18'),
	('8', 'S130', 2, 8, 'S130', '8회', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:25:18', 'USR20220303092315201', '2022-04-21 14:25:18'),
	('9', 'S130', 2, 9, 'S130', '9회', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:25:18', 'USR20220303092315201', '2022-04-21 14:25:18'),
	('S130', 'S130', 1, 217, NULL, '횟수', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:24:17', 'USR20220303092315201', '2022-04-21 14:24:17'),
	('10', 'S140', 2, 1, 'S140', '10점', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:26:13', 'USR20220303092315201', '2022-04-21 14:26:13'),
	('100', 'S140', 2, 10, 'S140', '100점', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:26:13', 'USR20220303092315201', '2022-04-21 14:26:13'),
	('20', 'S140', 2, 2, 'S140', '20점', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:26:13', 'USR20220303092315201', '2022-04-21 14:26:13'),
	('30', 'S140', 2, 3, 'S140', '30점', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:26:13', 'USR20220303092315201', '2022-04-21 14:26:13'),
	('40', 'S140', 2, 4, 'S140', '40점', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:26:13', 'USR20220303092315201', '2022-04-21 14:26:13'),
	('50', 'S140', 2, 5, 'S140', '50점', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:26:13', 'USR20220303092315201', '2022-04-21 14:26:13'),
	('60', 'S140', 2, 6, 'S140', '60점', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:26:13', 'USR20220303092315201', '2022-04-21 14:26:13'),
	('70', 'S140', 2, 7, 'S140', '70점', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:26:13', 'USR20220303092315201', '2022-04-21 14:26:13'),
	('80', 'S140', 2, 8, 'S140', '80점', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:26:13', 'USR20220303092315201', '2022-04-21 14:26:13'),
	('90', 'S140', 2, 9, 'S140', '90점', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:26:13', 'USR20220303092315201', '2022-04-21 14:26:13'),
	('S140', 'S140', 1, 218, NULL, '점수', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-04-21 14:24:17', 'USR20220303092315201', '2022-04-21 14:24:17'),
	('N', 'S150', 2, 2, 'S150', '실패', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-05-25 17:15:52', 'USR20220303092315201', '2022-05-25 17:15:52'),
	('S150', 'S150', 1, 258, NULL, '배치결과코드', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-05-25 17:14:38', 'USR20220303092315201', '2022-05-25 17:15:58'),
	('Y', 'S150', 2, 1, 'S150', '성공', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-05-25 17:15:52', 'USR20220303092315201', '2022-05-25 17:15:52'),
	('1', 'S160', 2, 1, 'S160', '1년', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-07-08 16:21:50', 'USR20220303092315201', '2022-07-08 16:21:50'),
	('3', 'S160', 2, 2, 'S160', '3년', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-07-08 16:21:50', 'USR20220303092315201', '2022-07-08 16:21:50'),
	('5', 'S160', 2, 3, 'S160', '5년', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-07-08 16:21:50', 'USR20220303092315201', '2022-07-08 16:21:50'),
	('99', 'S160', 2, 4, 'S160', '탈퇴시까지', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-07-08 16:21:50', 'USR20220303092315201', '2022-07-08 16:21:50'),
	('S160', 'S160', 1, 266, NULL, '휴면기간코드', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-07-08 16:20:17', 'USR20220303092315201', '2022-07-08 16:20:17'),
	('010', 'S170', 2, 1, 'S170', '휴면1개월전', 'N', 'CRM_0021', '1000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-07-11 13:29:14', 'CRM_13007', '2022-10-13 14:03:21'),
	('020', 'S170', 2, 2, 'S170', '휴면1일전', 'N', 'CRM_0021', '1000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-07-11 13:29:14', 'CRM_13007', '2022-10-13 14:03:21'),
	('030', 'S170', 2, 3, 'S170', '휴면처리', 'N', 'CRM_0011', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-07-11 13:29:14', 'CRM_13007', '2022-10-13 14:03:21'),
	('110', 'S170', 2, 4, 'S170', '탈퇴1개월전', 'N', 'ts0001', '1000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-07-11 13:29:14', 'CRM_13007', '2022-10-13 14:03:21'),
	('120', 'S170', 2, 5, 'S170', '탈퇴1일전', 'N', 'ts0001', '1000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-07-11 13:29:14', 'CRM_13007', '2022-10-13 14:03:21'),
	('130', 'S170', 2, 6, 'S170', '탈퇴처리', 'Y', 'CRM_0012', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-07-11 13:29:14', 'CRM_13007', '2022-10-13 14:17:30'),
	('140', 'S170', 2, 7, 'S170', '쿠폰 재알림', 'Y', 'CRM_0014', '1000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-07-11 13:29:14', 'CRM_13007', '2022-10-12 13:43:29'),
	('210', 'S170', 2, 8, 'S170', '소멸 예정 포인트 알림', 'N', 'CRM_0019', '1000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-08-05 16:14:34', 'CRM_13007', '2022-10-07 15:41:22'),
	('220', 'S170', 2, 9, 'S170', '포인트적립알림', 'N', 'CRM_0016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-08-09 14:09:40', 'CRM_13007', '2022-10-07 15:41:22'),
	('230', 'S170', 2, 10, 'S170', '포인트사용알림', 'N', 'CRM_0017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-08-09 14:09:40', 'CRM_13007', '2022-10-07 15:41:22'),
	('240', 'S170', 2, 11, 'S170', '포인트취소알림', 'N', 'CRM_0018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-08-09 14:09:40', 'CRM_13007', '2022-10-07 15:41:22'),
	('250', 'S170', 2, 14, 'S170', '구매추천포인트', 'Y', 'CRM_0009', NULL, NULL, NULL, NULL, NULL, 'N', NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-30 11:33:40', 'CRM_13002', '2022-10-07 22:51:06'),
	('310', 'S170', 2, 12, 'S170', '광고성정보수신동의철회', 'N', 'CRM_0022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-08-11 10:49:00', 'CRM_10004', '2022-10-14 11:27:56'),
	('320', 'S170', 2, 13, 'S170', '광고성정보수신동의', 'N', 'CRM_0030', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-08-11 10:49:00', 'CRM_10004', '2022-10-14 11:27:56'),
	('410', 'S170', 2, 14, 'S170', '멤버십가입완료', 'N', 'CRM_0020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-30 11:33:40', 'CRM_10004', '2022-10-14 11:27:56'),
	('S170', 'S170', 1, 267, NULL, '메시지템플릿(참조1:알림톡,3:sms,5,mail)', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'USR20220303092315201', '2022-07-11 13:27:35', 'USR20220303092315201', '2022-07-11 16:17:46'),
	('7z', 'S180', 2, 28, 'S180', '7z', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('ace', 'S180', 2, 32, 'S180', 'ace', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('ai', 'S180', 2, 6, 'S180', 'ai', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('alz', 'S180', 2, 30, 'S180', 'alz', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('avi', 'S180', 2, 40, 'S180', 'avi', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('csv', 'S180', 2, 34, 'S180', 'csv', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('doc', 'S180', 2, 8, 'S180', 'doc', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('docm', 'S180', 2, 10, 'S180', 'docm', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('docx', 'S180', 2, 9, 'S180', 'docx', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('dotm', 'S180', 2, 12, 'S180', 'dotm', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('dotx', 'S180', 2, 11, 'S180', 'dotx', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('ezz', 'S180', 2, 33, 'S180', 'ezz', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('gif', 'S180', 2, 3, 'S180', 'gif', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('hwp', 'S180', 2, 36, 'S180', 'hwp', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('jpg', 'S180', 2, 1, 'S180', 'jpg', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('mp3', 'S180', 2, 38, 'S180', 'mp3', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('mp4', 'S180', 2, 39, 'S180', 'mp4', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('pdf', 'S180', 2, 37, 'S180', 'pdf', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('png', 'S180', 2, 2, 'S180', 'png', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('potx', 'S180', 2, 23, 'S180', 'potx', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('ppam', 'S180', 2, 24, 'S180', 'ppam', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('ppsm', 'S180', 2, 26, 'S180', 'ppsm', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('ppsx', 'S180', 2, 25, 'S180', 'ppsx', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('ppt', 'S180', 2, 20, 'S180', 'ppt', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('pptm', 'S180', 2, 22, 'S180', 'pptm', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('pptx', 'S180', 2, 21, 'S180', 'pptx', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('psd', 'S180', 2, 5, 'S180', 'psd', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('rar', 'S180', 2, 29, 'S180', 'rar', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('S180', 'S180', 1, 274, NULL, '파일확장자', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:21:09', 'CRM_13007', '2022-09-28 14:21:09'),
	('svg', 'S180', 2, 7, 'S180', 'svg', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('tar', 'S180', 2, 31, 'S180', 'tar', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('tiff', 'S180', 2, 4, 'S180', 'tiff', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('txt', 'S180', 2, 35, 'S180', 'txt', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('wav', 'S180', 2, 41, 'S180', 'wav', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('xlam', 'S180', 2, 19, 'S180', 'xlam', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('xls', 'S180', 2, 13, 'S180', 'xls', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('xlsb', 'S180', 2, 18, 'S180', 'xlsb', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('xlsm', 'S180', 2, 15, 'S180', 'xlsm', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('xlsx', 'S180', 2, 14, 'S180', 'xlsx', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('xltm', 'S180', 2, 17, 'S180', 'xltm', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('xltx', 'S180', 2, 16, 'S180', 'xltx', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('zip', 'S180', 2, 27, 'S180', 'zip', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-09-28 14:38:22', 'CRM_13007', '2022-09-28 14:38:22'),
	('000', 'S190', 2, 3, 'S190', '비회원', 'Y', '#EFEFEF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 16:16:45', 'CRM_13007', '2022-10-24 10:27:54'),
	('001', 'S190', 2, 2, 'S190', '통합고객', 'Y', '#9AF7B0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 16:16:45', 'CRM_13007', '2022-10-24 10:27:54'),
	('002', 'S190', 2, 1, 'S190', '멤버십', 'Y', '#BB64FF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 16:16:45', 'CRM_13007', '2022-10-24 10:27:54'),
	('S190', 'S190', 1, 275, NULL, '체험회원구분', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 16:16:09', 'CRM_13007', '2022-10-06 16:16:09'),
	('0', 'S200', 2, 7, 'S200', '미입력', 'Y', '#E5E5E5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:12:32', 'CRM_13007', '2022-10-07 13:21:01'),
	('1', 'S200', 2, 1, 'S200', '1회(신규)', 'Y', '#40458E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:12:32', 'CRM_13007', '2022-10-07 13:19:04'),
	('10', 'S200', 2, 6, 'S200', '10회이상', 'Y', '#158FAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:12:32', 'CRM_13007', '2022-10-07 13:19:04'),
	('2', 'S200', 2, 2, 'S200', '2회', 'Y', '#4F965F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:12:32', 'CRM_13007', '2022-10-07 13:19:04'),
	('3', 'S200', 2, 3, 'S200', '3회', 'Y', '#D46C7A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:12:32', 'CRM_13007', '2022-10-07 13:19:04'),
	('4', 'S200', 2, 4, 'S200', '4회', 'Y', '#F87979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:12:32', 'CRM_13007', '2022-10-07 13:19:04'),
	('5', 'S200', 2, 5, 'S200', '5회이상', 'Y', '#DB4035', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:12:32', 'CRM_13007', '2022-10-07 13:19:04'),
	('S200', 'S200', 1, 276, NULL, '체험횟수', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:10:25', 'CRM_13007', '2022-10-06 17:10:25'),
	('10', 'S210', 2, 1, 'S210', '10대', 'Y', '#40458E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:17:59', 'CRM_13007', '2022-10-07 13:20:28'),
	('20', 'S210', 2, 2, 'S210', '20대', 'Y', '#4F965F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:17:59', 'CRM_13007', '2022-10-07 13:20:28'),
	('30', 'S210', 2, 3, 'S210', '30대', 'Y', '#D46C7A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:17:59', 'CRM_13007', '2022-10-07 13:20:28'),
	('40', 'S210', 2, 4, 'S210', '40대', 'Y', '#F87979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:17:59', 'CRM_13007', '2022-10-07 13:20:28'),
	('50', 'S210', 2, 5, 'S210', '50대', 'Y', '#DB4035', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:17:59', 'CRM_13007', '2022-10-07 13:20:28'),
	('60', 'S210', 2, 6, 'S210', '60대', 'Y', '#158FAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:17:59', 'CRM_13007', '2022-10-07 13:20:28'),
	('70', 'S210', 2, 7, 'S210', '70대', 'Y', '#68B3C8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:17:59', 'CRM_13007', '2022-10-07 13:20:28'),
	('80', 'S210', 2, 8, 'S210', '80대 이상', 'Y', '#E5E5E5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:17:59', 'CRM_13007', '2022-10-07 13:20:28'),
	('S210', 'S210', 1, 277, NULL, '체험연령대', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:13:58', 'CRM_13007', '2022-10-06 17:13:58'),
	('1', 'S220', 2, 7, 'S220', '일요일', 'Y', '#68B3C8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:26:49', 'CRM_13007', '2022-10-07 13:22:39'),
	('2', 'S220', 2, 1, 'S220', '월요일', 'Y', '#40458E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:26:49', 'CRM_13007', '2022-10-07 13:22:39'),
	('3', 'S220', 2, 2, 'S220', '화요일', 'Y', '#4F965F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:26:49', 'CRM_13007', '2022-10-07 13:22:39'),
	('4', 'S220', 2, 3, 'S220', '수요일', 'Y', '#D46C7A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:26:49', 'CRM_13007', '2022-10-07 13:22:39'),
	('5', 'S220', 2, 4, 'S220', '목요일', 'Y', '#F87979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:26:49', 'CRM_13007', '2022-10-07 13:22:39'),
	('6', 'S220', 2, 5, 'S220', '금요일', 'Y', '#DB4035', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:26:49', 'CRM_13007', '2022-10-07 13:22:39'),
	('7', 'S220', 2, 6, 'S220', '토요일', 'Y', '#158FAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:26:49', 'CRM_13007', '2022-10-07 13:22:39'),
	('S220', 'S220', 1, 278, NULL, '요일', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'CRM_13007', '2022-10-06 17:25:28', 'CRM_13007', '2022-10-06 17:25:28');

-- 테이블 wigo.tb_sys_emp_bas 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_emp_bas` (
  `EMP_ID` varchar(20) NOT NULL COMMENT '사원ID',
  `ORG_ID` varchar(20) NOT NULL COMMENT '조직ID',
  `EMP_NM` varchar(100) DEFAULT NULL COMMENT '사원명',
  `CMP_CD` varchar(7) DEFAULT NULL COMMENT '회사코드',
  `JOB_ID` varchar(20) DEFAULT NULL COMMENT '직업ID',
  `DUTY_CD` varchar(20) DEFAULT NULL COMMENT '직무코드',
  `TEL_NO` varchar(88) DEFAULT NULL COMMENT '전화번호',
  `EMP_GRADE_CD` varchar(3) DEFAULT NULL COMMENT '사원등급코드',
  `BIRTHDAY` varchar(8) DEFAULT NULL COMMENT '생년월일',
  `EMAIL_ADDR` varchar(1000) DEFAULT NULL COMMENT '이메일주소',
  `STATUS_CD` varchar(3) DEFAULT NULL COMMENT '상태코드',
  `ENCO_YMD` varchar(8) DEFAULT NULL COMMENT '입사년월일',
  `RETIRE_YMD` varchar(8) DEFAULT NULL COMMENT '퇴사년월일',
  `EMP_TYPE_CD` varchar(3) DEFAULT NULL COMMENT '사원유형코드',
  `MPHON_NO` varchar(88) DEFAULT NULL COMMENT '이동전화번호',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`EMP_ID`),
  KEY `IX_SYS_EMP_BAS_IX01` (`ORG_ID`,`EMP_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='사원기본';

-- 테이블 데이터 wigo.tb_sys_emp_bas:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_emp_bas`;

-- 테이블 wigo.tb_sys_err_hst 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_err_hst` (
  `ERR_HST_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '오류이력ID',
  `MENU_ID` varchar(20) DEFAULT NULL COMMENT '메뉴코드',
  `MENU_URL` varchar(1000) DEFAULT NULL COMMENT '메뉴URL',
  `ERR_CD` varchar(20) DEFAULT NULL COMMENT '오류코드',
  `ERR_MSG_TXN` longtext DEFAULT NULL COMMENT '오류메시지내역',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`ERR_HST_ID` DESC),
  KEY `IX_SYS_ERR_HST_IX01` (`ERR_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='오류이력';

-- 테이블 데이터 wigo.tb_sys_err_hst:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_err_hst`;

-- 테이블 wigo.tb_sys_file_bas 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_file_bas` (
  `FILE_ID` varchar(20) NOT NULL COMMENT '파일ID',
  `FILE_ODRG` smallint(6) NOT NULL COMMENT '파일순번',
  `FILE_NM` varchar(1000) DEFAULT NULL COMMENT '파일명',
  `FILE_SIZE` bigint(20) DEFAULT NULL COMMENT '파일크기',
  `FILE_SAVE_NM` varchar(1000) DEFAULT NULL COMMENT '파일저장명',
  `FILE_URL` varchar(1000) DEFAULT NULL COMMENT '파일URL',
  `FILE_EXT_NM` varchar(100) DEFAULT NULL COMMENT '파일확장자',
  `MIME_TYPE_NM` varchar(100) DEFAULT NULL COMMENT 'MIME유형명',
  `TEMP_YN` varchar(1) DEFAULT 'N' COMMENT '임시파일여부',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`FILE_ID`,`FILE_ODRG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='파일기본';

-- 테이블 데이터 wigo.tb_sys_file_bas:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_file_bas`;

-- 테이블 wigo.tb_sys_grp_bas 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_grp_bas` (
  `GRP_ID` varchar(20) NOT NULL COMMENT '그룹ID',
  `GRP_NM` varchar(1000) DEFAULT NULL COMMENT '그룹명',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`REGR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='권한그룹';

-- 테이블 데이터 wigo.tb_sys_grp_bas:~1 rows (대략적) 내보내기
DELETE FROM `tb_sys_grp_bas`;
INSERT INTO `tb_sys_grp_bas` (`GRP_ID`, `GRP_NM`, `REGR_ID`, `REG_DT`, `AMDR_ID`, `AMD_DT`) VALUES
	('A0001', '시스템관리자', 'SYSTEM', '2022-11-30 17:04:29', 'SYSTEM', '2022-11-30 17:04:29');

-- 테이블 wigo.tb_sys_grp_emp_hst 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_grp_emp_hst` (
  `GRP_EMP_HST_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '그룹사원이력ID',
  `GRP_ID` varchar(20) NOT NULL COMMENT '그룹ID',
  `EMP_ID` varchar(20) NOT NULL COMMENT '사원ID',
  `DEL_YN` varchar(1) NOT NULL COMMENT '삭제여부',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`GRP_EMP_HST_ID`),
  KEY `IX_SYS_GRP_EMP_HST` (`GRP_ID`,`EMP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='그룹사원이력';

-- 테이블 데이터 wigo.tb_sys_grp_emp_hst:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_grp_emp_hst`;

-- 테이블 wigo.tb_sys_grp_emp_rel 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_grp_emp_rel` (
  `GRP_ID` varchar(20) NOT NULL COMMENT '그룹ID',
  `EMP_ID` varchar(20) NOT NULL COMMENT '사원ID',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`GRP_ID`,`EMP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='그룹직원관계';

-- 테이블 데이터 wigo.tb_sys_grp_emp_rel:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_grp_emp_rel`;

-- 테이블 wigo.tb_sys_grp_menu_hst 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_grp_menu_hst` (
  `GRP_MENU_HST_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '그룹메뉴이력ID',
  `GRP_ID` varchar(20) DEFAULT NULL COMMENT '그룹ID',
  `MENU_ID` varchar(20) DEFAULT NULL COMMENT '메뉴ID',
  `DEL_YN` varchar(1) DEFAULT NULL COMMENT '삭제여부',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`GRP_MENU_HST_ID`),
  KEY `IX_SYS_GRP_MENU_HST` (`GRP_ID`,`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='그룹메뉴이력';

-- 테이블 데이터 wigo.tb_sys_grp_menu_hst:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_grp_menu_hst`;

-- 테이블 wigo.tb_sys_grp_menu_rel 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_grp_menu_rel` (
  `GRP_ID` varchar(20) NOT NULL COMMENT '그룹ID',
  `MENU_ID` varchar(20) NOT NULL COMMENT '메뉴ID',
  `MENU_REG_AUTH_YN` varchar(1) DEFAULT NULL COMMENT '등록권한여부',
  `MENU_READ_AUTH_YN` varchar(1) DEFAULT NULL COMMENT '읽기권한여부',
  `MENU_AMD_AUTH_YN` varchar(1) DEFAULT NULL COMMENT '수정권한여부',
  `MENU_DEL_AUTH_YN` varchar(1) DEFAULT NULL COMMENT '삭제권한여부',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`GRP_ID`,`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='그룹메뉴관계';

-- 테이블 데이터 wigo.tb_sys_grp_menu_rel:~164 rows (대략적) 내보내기
DELETE FROM `tb_sys_grp_menu_rel`;
INSERT INTO `tb_sys_grp_menu_rel` (`GRP_ID`, `MENU_ID`, `MENU_REG_AUTH_YN`, `MENU_READ_AUTH_YN`, `MENU_AMD_AUTH_YN`, `MENU_DEL_AUTH_YN`, `REGR_ID`, `REG_DT`, `AMDR_ID`, `AMD_DT`) VALUES
	('A0001', '0100000000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-01-15 10:10:53', 'SYSTEM', '2021-01-15 10:10:53'),
	('A0001', '0101010100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0101010200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-05-30 17:20:41', 'SYSTEM', '2022-05-30 17:20:41'),
	('A0001', '0101010300', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-03 14:42:48', 'SYSTEM', '2022-06-03 14:42:48'),
	('A0001', '0101010400', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-07-03 21:46:54', 'SYSTEM', '2022-07-03 21:46:54'),
	('A0001', '0101020100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-22 16:12:08', 'SYSTEM', '2022-10-18 09:18:52'),
	('A0001', '0101020200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0101030100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0101030200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0101040100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0101040200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-05-03 14:31:24', 'SYSTEM', '2022-05-03 14:31:24'),
	('A0001', '0101050100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0101050200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0101050300', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0101060100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0101060200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0101070100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0101070200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-24 15:07:54', 'SYSTEM', '2022-06-24 15:07:54'),
	('A0001', '0101070300', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-24 15:09:51', 'SYSTEM', '2022-06-24 15:09:51'),
	('A0001', '0101070400', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-24 15:09:56', 'SYSTEM', '2022-06-24 15:09:56'),
	('A0001', '0101070500', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-24 15:14:50', 'SYSTEM', '2022-06-24 15:14:50'),
	('A0001', '0101070600', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-24 15:14:55', 'SYSTEM', '2022-06-24 15:14:55'),
	('A0001', '0101070700', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-24 15:14:59', 'SYSTEM', '2022-06-24 15:14:59'),
	('A0001', '0101080100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0101090100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0101100100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0101110100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0102010100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-22 16:15:22', 'SYSTEM', '2022-04-22 16:15:22'),
	('A0001', '0102010200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-01-15 10:10:52', 'SYSTEM', '2022-03-02 11:44:36'),
	('A0001', '0102010300', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-01-15 10:10:52', 'SYSTEM', '2021-01-15 10:10:52'),
	('A0001', '0102010900', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-03-14 13:16:54', 'SYSTEM', '2022-03-14 13:16:54'),
	('A0001', '0102011000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-03-14 13:37:37', 'SYSTEM', '2022-03-24 09:50:08'),
	('A0001', '0102011100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-03-24 09:50:13', 'SYSTEM', '2022-03-24 09:50:13'),
	('A0001', '0102020200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-01-15 10:10:52', 'SYSTEM', '2021-01-15 10:10:52'),
	('A0001', '0102020700', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-01-15 10:10:52', 'SYSTEM', '2021-01-15 10:10:52'),
	('A0001', '0102030000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-04-23 16:03:56', 'SYSTEM', '2022-02-23 13:14:45'),
	('A0001', '0102030200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-03-24 09:50:13', 'SYSTEM', '2022-04-28 17:39:58'),
	('A0001', '0102030300', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-03-24 09:50:13', 'SYSTEM', '2022-03-24 09:50:13'),
	('A0001', '0102030400', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-03-24 17:00:07', 'SYSTEM', '2022-03-24 17:01:47'),
	('A0001', '0102030500', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-03-24 17:00:12', 'SYSTEM', '2022-03-24 17:01:47'),
	('A0001', '0102030600', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-03-24 17:06:04', 'SYSTEM', '2022-03-24 17:06:04'),
	('A0001', '0102030700', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-03-24 19:26:45', 'SYSTEM', '2022-03-24 19:26:45'),
	('A0001', '0102030800', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-03-25 10:19:02', 'SYSTEM', '2022-03-25 10:19:02'),
	('A0001', '0102030900', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-19 16:03:58', 'SYSTEM', '2022-04-19 16:03:58'),
	('A0001', '0102040100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-03-02 09:35:35', 'SYSTEM', '2022-03-02 09:35:35'),
	('A0001', '0102040200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-03-02 09:35:35', 'SYSTEM', '2022-03-02 11:44:07'),
	('A0001', '0102040300', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-03-02 09:35:35', 'SYSTEM', '2022-03-02 09:35:35'),
	('A0001', '0102050100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-03-25 14:52:30', 'SYSTEM', '2022-03-25 14:52:30'),
	('A0001', '0102060100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-05-25 15:26:29', 'SYSTEM', '2022-05-25 15:26:29'),
	('A0001', '0102070100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-05-25 15:30:52', 'SYSTEM', '2022-05-25 15:30:52'),
	('A0001', '0102070200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-05-25 17:03:38', 'SYSTEM', '2022-05-25 17:03:38'),
	('A0001', '0103010100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0103010200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0103010300', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0103020100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0103030100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0103030200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-05-16 10:25:32', 'SYSTEM', '2022-05-16 10:25:32'),
	('A0001', '0103030300', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-05-16 10:27:34', 'SYSTEM', '2022-05-16 10:27:34'),
	('A0001', '0103030400', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-05-16 10:27:40', 'SYSTEM', '2022-05-16 10:27:40'),
	('A0001', '0103030500', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-05-16 16:56:35', 'SYSTEM', '2022-05-16 16:56:35'),
	('A0001', '0103030600', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-05-24 10:45:41', 'SYSTEM', '2022-05-24 10:45:41'),
	('A0001', '0103040100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-04-11 10:31:24', 'SYSTEM', '2022-04-11 10:31:24'),
	('A0001', '0103050100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-03 15:44:08', 'SYSTEM', '2022-06-03 15:44:08'),
	('A0001', '0103050200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-10-19 15:13:11', 'SYSTEM', '2022-10-19 15:13:11'),
	('A0001', '0103050300', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-15 16:57:39', 'SYSTEM', '2022-06-15 16:57:39'),
	('A0001', '0103050400', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-15 16:57:43', 'SYSTEM', '2022-06-15 16:57:43'),
	('A0001', '0103050500', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-07-11 14:07:16', 'SYSTEM', '2022-07-11 14:07:16'),
	('A0001', '0103050600', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-07-11 14:07:19', 'SYSTEM', '2022-07-11 14:07:19'),
	('A0001', '0103050700', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-07-18 14:01:28', 'SYSTEM', '2022-07-18 14:01:28'),
	('A0001', '0103050800', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-07-18 14:06:32', 'SYSTEM', '2022-07-18 14:06:32'),
	('A0001', '0103050900', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-07-18 14:06:36', 'SYSTEM', '2022-07-18 14:06:36'),
	('A0001', '0103051000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-09-07 13:52:38', 'SYSTEM', '2022-09-07 13:52:38'),
	('A0001', '0103051100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-10-17 16:46:39', 'SYSTEM', '2022-10-17 16:46:39'),
	('A0001', '0103051200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-09-07 13:50:27', 'SYSTEM', '2022-09-07 13:50:27'),
	('A0001', '0103051300', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-10-19 15:13:11', 'SYSTEM', '2022-10-19 15:13:11'),
	('A0001', '0103051400', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-09-07 13:50:42', 'SYSTEM', '2022-09-07 13:50:42'),
	('A0001', '0103051500', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-09-07 13:50:51', 'SYSTEM', '2022-09-07 13:50:51'),
	('A0001', '0103060100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-08 09:46:23', 'SYSTEM', '2022-06-08 09:46:23'),
	('A0001', '0103060200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-08 09:46:23', 'SYSTEM', '2022-06-08 09:46:23'),
	('A0001', '0103060300', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-08 09:46:23', 'SYSTEM', '2022-06-08 09:46:23'),
	('A0001', '0103060400', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-20 21:37:09', 'SYSTEM', '2022-06-20 21:37:09'),
	('A0001', '0103060500', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-07-24 16:57:03', 'SYSTEM', '2022-07-24 16:57:03'),
	('A0001', '0103070100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-08 09:46:23', 'SYSTEM', '2022-06-08 09:46:23'),
	('A0001', '0103070200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-08 09:46:23', 'SYSTEM', '2022-06-08 09:46:23'),
	('A0001', '0103070300', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-08 09:46:23', 'SYSTEM', '2022-06-08 09:46:23'),
	('A0001', '0103080100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-08 09:46:23', 'SYSTEM', '2022-06-08 09:46:23'),
	('A0001', '0103090100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-08 09:46:23', 'SYSTEM', '2022-06-08 09:46:23'),
	('A0001', '0103090200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-20 20:00:16', 'SYSTEM', '2022-06-20 20:00:16'),
	('A0001', '0104010000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-07 12:21:26', 'SYSTEM', '2022-06-07 12:21:26'),
	('A0001', '0104010100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-07 12:21:18', 'SYSTEM', '2022-06-07 12:21:18'),
	('A0001', '0104010200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-07 11:02:42', 'SYSTEM', '2022-06-07 11:02:42'),
	('A0001', '0104010300', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-14 12:38:41', 'SYSTEM', '2022-06-14 12:38:41'),
	('A0001', '0104020000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-07 10:59:16', 'SYSTEM', '2022-06-07 10:59:16'),
	('A0001', '0104020100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-07 11:02:51', 'SYSTEM', '2022-06-07 11:02:51'),
	('A0001', '0104020200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-09 20:04:39', 'SYSTEM', '2022-06-09 20:04:39'),
	('A0001', '0104020300', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-07 11:02:57', 'SYSTEM', '2022-06-07 11:02:57'),
	('A0001', '0104030000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-07 10:59:19', 'SYSTEM', '2022-06-07 10:59:19'),
	('A0001', '0104030100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-07 11:03:02', 'SYSTEM', '2022-06-07 11:03:02'),
	('A0001', '0104040000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-07 11:02:23', 'SYSTEM', '2022-06-07 11:02:23'),
	('A0001', '0104040100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-07 11:03:06', 'SYSTEM', '2022-06-07 11:03:06'),
	('A0001', '0104050000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-07 11:02:21', 'SYSTEM', '2022-06-07 11:02:21'),
	('A0001', '0104050100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2022-06-07 11:03:11', 'SYSTEM', '2022-06-07 11:03:11'),
	('A0001', '0201010100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-01-27 11:01:36', 'SYSTEM', '2021-01-27 11:01:36'),
	('A0001', '0201010200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-01-27 11:00:56', 'SYSTEM', '2021-01-27 11:00:56'),
	('A0001', '0201020100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-13 11:29:26', 'SYSTEM', '2021-02-13 11:29:26'),
	('A0001', '0201020200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-13 11:50:38', 'SYSTEM', '2021-02-13 11:50:38'),
	('A0001', '0201030000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-04-23 16:04:42', 'SYSTEM', '2021-04-23 16:04:42'),
	('A0001', '0202010000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-03 16:37:03', 'SYSTEM', '2021-02-03 16:37:03'),
	('A0001', '0202010100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-09 18:02:30', 'SYSTEM', '2021-02-09 18:02:30'),
	('A0001', '0202020100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-05 17:00:53', 'SYSTEM', '2021-02-05 17:00:53'),
	('A0001', '0202020200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-05 17:00:59', 'SYSTEM', '2021-02-05 17:00:59'),
	('A0001', '0202030100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-09 17:56:28', 'SYSTEM', '2021-02-09 17:56:28'),
	('A0001', '0202030200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-26 11:05:59', 'SYSTEM', '2021-02-26 11:05:59'),
	('A0001', '0202040100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-09 18:00:24', 'SYSTEM', '2021-02-09 18:00:24'),
	('A0001', '0202050100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-23 16:03:48', 'SYSTEM', '2021-02-23 16:03:48'),
	('A0001', '0202050200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-11 14:24:55', 'SYSTEM', '2021-03-11 14:24:55'),
	('A0001', '0202050300', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-15 13:13:23', 'SYSTEM', '2021-03-15 13:13:23'),
	('A0001', '0202050400', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-16 09:17:48', 'SYSTEM', '2021-03-16 09:17:48'),
	('A0001', '0203010100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-02 11:20:03', 'SYSTEM', '2021-03-02 11:20:03'),
	('A0001', '0203010200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-02 11:20:15', 'SYSTEM', '2021-03-02 11:20:15'),
	('A0001', '0203020100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-02 11:20:22', 'SYSTEM', '2021-03-02 11:20:22'),
	('A0001', '0203020200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-02 11:20:32', 'SYSTEM', '2021-03-02 11:20:32'),
	('A0001', '0203030100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-02 11:22:54', 'SYSTEM', '2021-03-02 11:22:54'),
	('A0001', '0301010000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-01-27 17:28:32', 'SYSTEM', '2021-01-27 17:28:32'),
	('A0001', '0301010100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-01-26 13:48:53', 'SYSTEM', '2021-01-26 13:48:53'),
	('A0001', '0301020100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-04-12 13:00:12', 'SYSTEM', '2021-04-12 13:00:12'),
	('A0001', '0301020200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-04-12 13:00:18', 'SYSTEM', '2021-04-12 13:00:18'),
	('A0001', '0301030100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-17 14:47:13', 'SYSTEM', '2021-02-17 14:47:13'),
	('A0001', '0301030200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-17 14:47:05', 'SYSTEM', '2021-02-17 14:47:05'),
	('A0001', '0301030300', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-17 14:47:09', 'SYSTEM', '2021-02-17 14:47:09'),
	('A0001', '0301030400', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-26 14:04:12', 'SYSTEM', '2021-02-26 14:04:12'),
	('A0001', '0301040100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-23 15:03:17', 'SYSTEM', '2021-03-23 15:03:17'),
	('A0001', '0301040200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-23 15:03:49', 'SYSTEM', '2021-03-23 15:03:49'),
	('A0001', '0301050100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-04-21 16:21:34', 'SYSTEM', '2021-04-21 16:21:34'),
	('A0001', '0301050200', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-05-04 13:47:49', 'SYSTEM', '2021-05-04 13:47:49'),
	('A0001', '0302010000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-01-27 15:46:12', 'SYSTEM', '2021-01-27 15:46:12'),
	('A0001', '0302010100', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-01-27 15:43:39', 'SYSTEM', '2021-01-27 15:43:39'),
	('A0001', '0302020000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-19 09:32:44', 'SYSTEM', '2021-02-19 09:32:44'),
	('A0001', '0303010000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-01 10:58:54', 'SYSTEM', '2021-02-01 10:58:54'),
	('A0001', '0303020000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-01 10:59:00', 'SYSTEM', '2021-02-01 10:59:00'),
	('A0001', '0303030000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-01 10:59:05', 'SYSTEM', '2021-02-01 10:59:05'),
	('A0001', '0304020000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-16 10:03:00', 'SYSTEM', '2021-02-16 10:03:00'),
	('A0001', '0305010000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-15 11:29:58', 'SYSTEM', '2021-02-15 11:29:58'),
	('A0001', '0305030000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-17 11:03:45', 'SYSTEM', '2021-02-17 11:03:45'),
	('A0001', '0305040000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-04-27 16:13:47', 'SYSTEM', '2021-04-27 16:13:47'),
	('A0001', '0306010000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-17 17:03:06', 'SYSTEM', '2021-02-17 17:03:06'),
	('A0001', '0306020000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-03 10:59:55', 'SYSTEM', '2021-03-03 10:59:55'),
	('A0001', '0306030000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-08 14:19:41', 'SYSTEM', '2021-03-08 14:19:41'),
	('A0001', '0306040000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-18 16:00:01', 'SYSTEM', '2021-03-18 16:00:01'),
	('A0001', '0306050000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-24 09:27:00', 'SYSTEM', '2021-03-24 09:27:00'),
	('A0001', '0306060000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-04-23 16:05:21', 'SYSTEM', '2021-04-23 16:05:21'),
	('A0001', '0307010000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-18 16:36:28', 'SYSTEM', '2021-02-18 16:36:28'),
	('A0001', '0307020000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-24 09:18:21', 'SYSTEM', '2021-02-24 09:18:21'),
	('A0001', '0307030000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-02-24 15:06:19', 'SYSTEM', '2021-02-24 15:06:19'),
	('A0001', '0307040000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-02 13:44:18', 'SYSTEM', '2021-03-02 13:44:18'),
	('A0001', '0308010000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-05 10:30:41', 'SYSTEM', '2021-03-05 10:30:41'),
	('A0001', '0308020000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-11 14:46:27', 'SYSTEM', '2021-03-11 14:46:27'),
	('A0001', '0308030000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-04-05 16:00:54', 'SYSTEM', '2021-04-05 16:00:54'),
	('A0001', '0401010000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-30 09:49:27', 'SYSTEM', '2021-03-30 09:49:27'),
	('A0001', '0401020000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-30 09:49:37', 'SYSTEM', '2021-03-30 09:49:37'),
	('A0001', '0401030000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-04-19 17:56:08', 'SYSTEM', '2021-04-19 17:56:08'),
	('A0001', '0402010000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-30 09:49:47', 'SYSTEM', '2021-03-30 09:49:47'),
	('A0001', '0402020000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-03-30 09:49:52', 'SYSTEM', '2021-03-30 09:49:52'),
	('A0001', '2010100000', 'Y', 'Y', 'Y', 'Y', 'SYSTEM', '2021-01-27 10:23:52', 'SYSTEM', '2021-01-27 10:23:52');

-- 테이블 wigo.tb_sys_grp_org_hst 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_grp_org_hst` (
  `GRP_ORG_HST_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '그룹조직이력ID',
  `GRP_ID` varchar(20) NOT NULL COMMENT '그룹ID',
  `ORG_ID` varchar(20) NOT NULL COMMENT '조직ID',
  `DEL_YN` varchar(1) NOT NULL COMMENT '삭제여부',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`GRP_ORG_HST_ID`),
  KEY `IX_SYS_GRP_MENU_HST` (`GRP_ID`,`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='그룹조직이력';

-- 테이블 데이터 wigo.tb_sys_grp_org_hst:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_grp_org_hst`;

-- 테이블 wigo.tb_sys_grp_org_rel 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_grp_org_rel` (
  `GRP_ID` varchar(20) NOT NULL COMMENT '그룹ID',
  `ORG_ID` varchar(20) NOT NULL COMMENT '조직ID',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`GRP_ID`,`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='그룹조직관계';

-- 테이블 데이터 wigo.tb_sys_grp_org_rel:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_grp_org_rel`;

-- 테이블 wigo.tb_sys_grp_user_rel 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_grp_user_rel` (
  `GRP_ID` varchar(20) NOT NULL COMMENT '그룹ID',
  `USER_ID` int(11) NOT NULL COMMENT '사용자ID',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`GRP_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='그룹사용자관계';

-- 테이블 데이터 wigo.tb_sys_grp_user_rel:~1 rows (대략적) 내보내기
DELETE FROM `tb_sys_grp_user_rel`;
INSERT INTO `tb_sys_grp_user_rel` (`GRP_ID`, `USER_ID`, `REGR_ID`, `REG_DT`, `AMDR_ID`, `AMD_DT`) VALUES
	('A0001', 999999999, 'SYSTEM', '2022-11-30 17:31:17', 'SYSTEM', '2022-11-30 17:31:19');

-- 테이블 wigo.tb_sys_menu_bas 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_menu_bas` (
  `MENU_ID` varchar(20) NOT NULL COMMENT '메뉴ID',
  `MENU_NM` varchar(1000) NOT NULL COMMENT '메뉴명',
  `MENU_URL` varchar(100) DEFAULT NULL COMMENT '메뉴URL',
  `TOP_MENU_ID` varchar(20) NOT NULL COMMENT '최상위메뉴ID',
  `PRNTS_MENU_ID` varchar(20) DEFAULT NULL COMMENT '부모메뉴ID',
  `MENU_LVL_NO` tinyint(4) NOT NULL COMMENT '메뉴레벨번호',
  `MENU_ODRG` smallint(6) NOT NULL COMMENT '메뉴순번',
  `MENU_ICON_CD` varchar(1000) DEFAULT NULL COMMENT '메뉴아이콘코드',
  `MENU_AUTH_YN` varchar(1) DEFAULT 'Y' COMMENT '메뉴권한여부',
  `MENU_SHOW_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '메뉴노출여부',
  `MENU_POPUP_YN` varchar(1) NOT NULL DEFAULT 'N' COMMENT '메뉴팝업여부',
  `MENU_POPUP_WDTH_LEN` smallint(6) DEFAULT NULL COMMENT '메뉴팝업가로길이',
  `MENU_POPUP_VRCT_LEN` smallint(6) DEFAULT NULL COMMENT '메뉴팝업세로길이',
  `MENU_EXPLN` varchar(4000) DEFAULT NULL COMMENT '메뉴설명',
  `CHNG_LOG_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '변경로그여부',
  `USE_YN` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`MENU_ID`),
  KEY `IX_SYS_MENU_BAS_01` (`MENU_URL`),
  KEY `IX_SYS_MENU_BAS_02` (`PRNTS_MENU_ID`,`MENU_LVL_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='메뉴기본';

-- 테이블 데이터 wigo.tb_sys_menu_bas:~38 rows (대략적) 내보내기
DELETE FROM `tb_sys_menu_bas`;
INSERT INTO `tb_sys_menu_bas` (`MENU_ID`, `MENU_NM`, `MENU_URL`, `TOP_MENU_ID`, `PRNTS_MENU_ID`, `MENU_LVL_NO`, `MENU_ODRG`, `MENU_ICON_CD`, `MENU_AUTH_YN`, `MENU_SHOW_YN`, `MENU_POPUP_YN`, `MENU_POPUP_WDTH_LEN`, `MENU_POPUP_VRCT_LEN`, `MENU_EXPLN`, `CHNG_LOG_YN`, `USE_YN`, `REGR_ID`, `REG_DT`, `AMDR_ID`, `AMD_DT`) VALUES
	('0100000000', '관리메뉴', NULL, '0100000000', NULL, 1, 1, NULL, 'Y', 'Y', 'N', 0, 0, NULL, 'Y', 'Y', 'SYSTEM', '2021-01-15 10:10:53', 'SYSTEM', '2022-02-23 12:55:38'),
	('0101000000', '공통', NULL, '0100000000', '0100000000', 2, 4, NULL, 'Y', 'Y', 'N', 0, 0, NULL, 'Y', 'Y', 'SYSTEM', '2021-01-15 10:10:53', 'SYSTEM', '2022-04-11 10:09:01'),
	('0101010000', '시스템관리', NULL, '0100000000', '0101000000', 3, 1, NULL, 'Y', 'Y', 'N', 0, 0, '시스템관리', 'Y', 'Y', 'SYSTEM', '2021-01-15 10:10:53', 'SYSTEM', '2022-05-25 15:31:38'),
	('0101010100', '메뉴관리', 'menu', '0100000000', '0101010000', 4, 1, NULL, 'Y', 'Y', 'N', 0, 0, '메뉴관리', 'Y', 'Y', 'SYSTEM', '2021-01-15 10:10:53', 'SYSTEM', '2022-03-24 09:52:05'),
	('0101010200', '권한관리', 'group', '0100000000', '0101010000', 4, 2, NULL, 'Y', 'Y', 'N', 0, 0, '그룹관리', 'Y', 'Y', 'SYSTEM', '2021-01-15 10:10:53', 'SYSTEM', '2022-06-10 16:20:12'),
	('0101010300', '사용자관리', 'user', '0100000000', '0101010000', 4, 3, NULL, 'Y', 'Y', 'N', 0, 0, '사용자관리', 'Y', 'N', 'SYSTEM', '2021-01-15 10:10:53', 'SYSTEM', '2022-05-27 19:57:27'),
	('0101010900', '부서관리', 'organization', '0100000000', '0101010000', 4, 4, NULL, 'Y', 'Y', 'N', 0, 0, '부서관리', 'N', 'Y', 'SYSTEM', '2022-03-14 13:14:53', 'SYSTEM', '2022-03-24 09:57:09'),
	('0101011000', '직원관리', 'employ', '0100000000', '0101010000', 4, 5, NULL, 'Y', 'Y', 'N', 0, 0, '직원관리', 'N', 'Y', 'SYSTEM', '2022-03-14 13:37:10', 'SYSTEM', '2022-03-24 09:52:05'),
	('0101011100', '공통코드관리', 'code', '0100000000', '0101010000', 4, 6, NULL, 'Y', 'Y', 'N', 0, 0, '공통코드관리', 'Y', 'Y', 'SYSTEM', '2022-03-24 09:39:16', 'SYSTEM', '2022-03-24 09:59:17'),
	('0101020000', '개발', NULL, '0100000000', '0101000000', 3, 6, NULL, 'Y', 'N', 'N', 0, 0, '개발', 'Y', 'N', 'SYSTEM', '2021-01-15 10:10:53', 'SYSTEM', '2022-09-01 17:25:53'),
	('0101020200', '첨부파일관리', 'file', '0100000000', '0101020000', 4, 2, NULL, 'N', 'N', 'N', 0, 0, NULL, 'N', 'Y', 'SYSTEM', '2021-01-15 10:10:53', 'SYSTEM', '2022-03-03 16:59:42'),
	('0101020700', '주소검색(행자부)', 'address', '0100000000', '0101020000', 4, 7, NULL, 'N', 'Y', 'N', 0, 0, NULL, 'N', 'Y', 'SYSTEM', '2021-01-15 10:10:53', 'SYSTEM', '2022-03-03 16:59:43'),
	('0101020900', '약관목록', 'stipulationList', '0100000000', '0101020000', 4, 9, NULL, 'N', 'Y', 'N', 0, 0, NULL, 'N', 'Y', 'SYSTEM', '2022-04-08 11:54:23', 'SYSTEM', '2022-04-08 11:54:23'),
	('0101021000', '약관상세', 'stipulationDetail', '0100000000', '0101020000', 4, 10, NULL, 'N', 'N', 'N', 0, 0, NULL, 'N', 'Y', 'SYSTEM', '2022-04-11 10:15:02', 'SYSTEM', '2022-04-11 10:15:02'),
	('0101021100', '쿠폰', 'cusCouponList', '0100000000', '0101020000', 4, 11, NULL, 'N', 'Y', 'N', 0, 0, NULL, 'N', 'Y', 'SYSTEM', '2022-04-12 10:02:30', 'SYSTEM', '2022-04-12 10:02:30'),
	('0101021200', '테스트', 'test', '0100000000', '0101020000', 4, 12, NULL, 'N', 'Y', 'N', 0, 0, NULL, 'N', 'Y', 'SYSTEM', '2022-04-14 14:48:34', 'SYSTEM', '2022-06-08 10:48:32'),
	('0101021300', '제휴사정보 홈', 'partnerHome', '0100000000', '0101020000', 4, 13, NULL, 'N', 'Y', 'N', 0, 0, NULL, 'N', 'Y', 'SYSTEM', '2022-04-18 10:29:37', 'SYSTEM', '2022-04-18 10:29:37'),
	('0101029900', '그리드XML', 'genGrid', '0100000000', '0101020000', 4, 8, NULL, 'N', 'Y', 'N', 0, 0, NULL, 'N', 'Y', 'SYSTEM', '2021-01-15 10:10:53', 'SYSTEM', '2022-02-24 09:52:15'),
	('0101030000', '로그', NULL, '0100000000', '0101000000', 3, 4, NULL, 'N', 'Y', 'N', 0, 0, '로그', 'N', 'Y', 'SYSTEM', '2022-02-24 09:09:40', 'SYSTEM', '2022-05-25 15:31:38'),
	('0101030200', '로그인이력', 'userLoginHist', '0100000000', '0101030000', 4, 1, NULL, 'Y', 'Y', 'N', 0, 0, '로그인이력', 'N', 'Y', 'SYSTEM', '2022-03-24 09:47:35', 'SYSTEM', '2022-04-19 16:05:19'),
	('0101030300', '정보변경이력', 'chngHst', '0100000000', '0101030000', 4, 2, NULL, 'Y', 'Y', 'N', 0, 0, '정보변경이력', 'N', 'Y', 'SYSTEM', '2022-03-24 09:48:54', 'SYSTEM', '2022-04-19 16:05:19'),
	('0101030400', '그룹메뉴변경이력', 'grpMenuHst', '0100000000', '0101030000', 4, 3, NULL, 'Y', 'Y', 'N', 0, 0, '그룹메뉴변경이력', 'N', 'Y', 'SYSTEM', '2022-03-24 16:47:08', 'SYSTEM', '2022-04-19 16:05:19'),
	('0101030500', '그룹부서변경이력', 'grpOrgHst', '0100000000', '0101030000', 4, 4, NULL, 'Y', 'Y', 'N', 0, 0, '그룹부서변경이력', 'N', 'Y', 'SYSTEM', '2022-03-24 16:57:49', 'SYSTEM', '2022-04-19 16:05:19'),
	('0101030600', '그룹사원변경이력', 'grpEmpHst', '0100000000', '0101030000', 4, 5, NULL, 'Y', 'Y', 'N', 0, 0, '그룹사원변경이력', 'N', 'Y', 'SYSTEM', '2022-03-24 16:57:59', 'SYSTEM', '2022-04-19 16:05:19'),
	('0101030700', '예외발생이력', 'errorHst', '0100000000', '0101030000', 4, 6, NULL, 'Y', 'Y', 'N', 0, 0, '예외발생이력', 'N', 'Y', 'SYSTEM', '2022-03-24 19:20:54', 'SYSTEM', '2022-04-19 16:05:19'),
	('0101030800', '엑셀다운로드이력', 'excelLog', '0100000000', '0101030000', 4, 8, NULL, 'Y', 'Y', 'N', 0, 0, '엑셀다운로드이력', 'N', 'Y', 'SYSTEM', '2022-03-25 10:07:03', 'SYSTEM', '2022-04-19 16:05:19'),
	('0101030900', '고객정보조회이력', 'infoHist', '0100000000', '0101030000', 4, 7, NULL, 'Y', 'Y', 'N', 0, 0, '고객정보조회', 'N', 'Y', 'SYSTEM', '2022-04-19 16:02:37', 'SYSTEM', '2022-04-19 16:45:55'),
	('0101040000', 'API관리', NULL, '0100000000', '0101000000', 3, 2, NULL, 'Y', 'Y', 'N', 0, 0, 'API관리', 'N', 'Y', 'SYSTEM', '2022-03-02 09:23:10', 'SYSTEM', '2022-05-25 15:31:38'),
	('0101040100', 'API키관리', 'apikey', '0100000000', '0101040000', 4, 2, NULL, 'Y', 'Y', 'N', 0, 0, 'API키관리', 'N', 'Y', 'SYSTEM', '2022-03-02 09:24:40', 'SYSTEM', '2022-03-04 16:50:08'),
	('0101040200', 'API관리', 'apiManage', '0100000000', '0101040000', 4, 1, NULL, 'Y', 'Y', 'N', 0, 0, 'API관리', 'Y', 'Y', 'SYSTEM', '2022-03-02 09:24:56', 'SYSTEM', '2022-03-04 16:50:08'),
	('0101040300', 'API실행이력', 'apiHist', '0100000000', '0101040000', 4, 3, NULL, 'Y', 'Y', 'N', 0, 0, 'API실행이력', 'N', 'Y', 'SYSTEM', '2022-03-02 09:25:21', 'SYSTEM', '2022-03-24 10:04:21'),
	('0101050000', '공지사항', NULL, '0100000000', '0101000000', 3, 5, NULL, 'Y', 'Y', 'N', 0, 0, '공지사항', 'Y', 'Y', 'SYSTEM', '2022-03-25 14:51:55', 'SYSTEM', '2022-05-25 15:31:38'),
	('0101050100', '공지사항', 'notice', '0100000000', '0101050000', 4, 1, NULL, 'Y', 'Y', 'N', 0, 0, '공지사항', 'Y', 'Y', 'SYSTEM', '2022-03-25 14:52:24', 'SYSTEM', '2022-03-25 14:52:24'),
	('0101060000', '과거고객정보조회', NULL, '0100000000', '0101000000', 3, 7, NULL, 'Y', 'Y', 'N', 0, 0, '시스템별 고객정보 통합 데이터 조회', 'Y', 'Y', 'SYSTEM', '2022-05-25 15:25:43', 'SYSTEM', '2022-05-25 15:31:38'),
	('0101060100', '과거고객정보조회', 'userInfo', '0100000000', '0101060000', 4, 1, NULL, 'Y', 'Y', 'N', 0, 0, '시스템별 고객정보 통합 데이터 조회', 'N', 'Y', 'SYSTEM', '2022-05-25 15:26:23', 'SYSTEM', '2022-05-25 15:26:23'),
	('0101070000', '배치관리', NULL, '0100000000', '0101000000', 3, 3, NULL, 'Y', 'Y', 'N', 0, 0, '배치관리', 'Y', 'Y', 'SYSTEM', '2022-05-25 15:30:32', 'SYSTEM', '2022-05-25 15:31:38'),
	('0101070100', '배치관리', 'batch', '0100000000', '0101070000', 4, 1, NULL, 'Y', 'Y', 'N', 0, 0, '배치관리', 'N', 'Y', 'SYSTEM', '2022-05-25 15:30:46', 'SYSTEM', '2022-05-25 15:30:46'),
	('0101070200', '배치실행이력', 'batchHist', '0100000000', '0101070000', 4, 2, NULL, 'Y', 'Y', 'N', 0, 0, '배치실행이력', 'N', 'Y', 'SYSTEM', '2022-05-25 17:03:25', 'SYSTEM', '2022-05-25 17:03:25');

-- 테이블 wigo.tb_sys_ntcart_bas 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_ntcart_bas` (
  `NTCART_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '게시물ID',
  `BRD_ID` varchar(20) NOT NULL COMMENT '게시판ID',
  `UP_NTCART_ID` varchar(20) DEFAULT NULL COMMENT '상위게시물ID',
  `TOP_NTCART_ID` varchar(20) NOT NULL COMMENT '최상위게시물ID',
  `NTCART_NM` varchar(1000) DEFAULT NULL COMMENT '게시물명',
  `NTCART_CTNTS` longtext DEFAULT NULL COMMENT '게시물내용',
  `ANSWER_CTNTS` longtext DEFAULT NULL COMMENT '답변내용',
  `NOTE_STATUS_CD` varchar(3) DEFAULT NULL COMMENT '공지상태코드',
  `POST_STATUS_CD` varchar(3) DEFAULT NULL COMMENT '게시상태코드',
  `NOTE_YN` varchar(1) DEFAULT NULL COMMENT '공지여부',
  `POST_STA_DT` datetime DEFAULT NULL COMMENT '게시시작일시',
  `POST_END_DT` datetime DEFAULT NULL COMMENT '게시종료일시',
  `NOTE_STA_DT` datetime DEFAULT NULL COMMENT '게시상태코드',
  `NOTE_END_DT` datetime DEFAULT NULL COMMENT '공지종료일시',
  `FILE_ID` varchar(20) DEFAULT NULL COMMENT '파일ID',
  `NTCART_PWD` varchar(1000) DEFAULT NULL COMMENT '게시물비밀번호',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`NTCART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='공지기본';

-- 테이블 데이터 wigo.tb_sys_ntcart_bas:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_ntcart_bas`;

-- 테이블 wigo.tb_sys_org_bas 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_org_bas` (
  `ORG_ID` varchar(20) NOT NULL COMMENT '조직ID',
  `ORG_NM` varchar(1000) DEFAULT NULL COMMENT '조직명',
  `ORG_CLASS_ID` varchar(10) DEFAULT NULL COMMENT '조직분류ID',
  `ORG_CLASS_NM` varchar(1000) DEFAULT NULL COMMENT '조직분류명',
  `LVL_NO` tinyint(4) DEFAULT NULL COMMENT '레벨번호',
  `ORG_ODRG` smallint(6) DEFAULT NULL COMMENT '조직순번',
  `UP_ORG_ID` varchar(10) DEFAULT NULL COMMENT '상위조직ID',
  `UP_ORG_NM` varchar(1000) DEFAULT NULL COMMENT '상위조직명',
  `ORG_EMP_ID` varchar(8) DEFAULT NULL COMMENT '조직사원ID',
  `ORG_EMP_NM` varchar(100) DEFAULT NULL COMMENT '조직사원명',
  `STA_YMD` varchar(8) DEFAULT NULL COMMENT '시작년월일',
  `END_YMD` varchar(8) DEFAULT NULL COMMENT '종료년월일',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='조직기본';

-- 테이블 데이터 wigo.tb_sys_org_bas:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_org_bas`;

-- 테이블 wigo.tb_sys_user_bas 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_user_bas` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '사용자ID',
  `LOGIN_ID` varchar(100) DEFAULT NULL COMMENT '로그인ID',
  `LOGIN_PWD` varchar(1000) DEFAULT NULL COMMENT '로그인비밀번호',
  `USER_NM` varchar(100) DEFAULT NULL COMMENT '사용자명',
  `EMAIL_ADDR` varchar(1000) DEFAULT NULL COMMENT '이메일주소',
  `MPHON_NO` varchar(88) DEFAULT NULL COMMENT '이동전화번호',
  `USER_GNDR_CD` varchar(3) DEFAULT NULL COMMENT '사용자성별코드',
  `USER_BIRTHDAY` varchar(8) DEFAULT NULL COMMENT '사용자생년월일',
  `PWD_AMD_DT` datetime DEFAULT NULL COMMENT '비밀번호수정일시',
  `LAST_LOGIN_DT` datetime DEFAULT NULL COMMENT '최종로그인일시',
  `PWD_EXP_DT` datetime DEFAULT NULL COMMENT '비밀번호만료일시',
  `LOGIN_FAIL_CNT` tinyint(4) DEFAULT NULL COMMENT '로그인실패수',
  `DEL_YN` varchar(1) DEFAULT NULL COMMENT '삭제여부',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `IX_SYS_USER_BAS` (`LOGIN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='사용자기본';

-- 테이블 데이터 wigo.tb_sys_user_bas:~1 rows (대략적) 내보내기
DELETE FROM `tb_sys_user_bas`;
INSERT INTO `tb_sys_user_bas` (`USER_ID`, `LOGIN_ID`, `LOGIN_PWD`, `USER_NM`, `EMAIL_ADDR`, `MPHON_NO`, `USER_GNDR_CD`, `USER_BIRTHDAY`, `PWD_AMD_DT`, `LAST_LOGIN_DT`, `PWD_EXP_DT`, `LOGIN_FAIL_CNT`, `DEL_YN`, `REGR_ID`, `REG_DT`, `AMDR_ID`, `AMD_DT`) VALUES
	(999999999, 'ADMIN', '$5$AvoubMud$3m32OFdz57f8ffkj2TpgT90QxRNMKsrtHqrkZbc/MX/', '관리자', 'admin@admin.co.kr', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'N', 'SYSTEM', '2022-11-30 17:06:23', 'SYSTEM', '2022-11-30 17:06:24');

-- 테이블 wigo.tb_sys_user_login_hst 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_user_login_hst` (
  `USER_ID` int(11) NOT NULL COMMENT '사용자ID',
  `LOGIN_DT` datetime NOT NULL COMMENT '로그인일시',
  `LOGIN_IP_ADDR` varchar(100) DEFAULT NULL COMMENT '로그인IP주소',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`USER_ID`,`LOGIN_DT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='로그인이력';

-- 테이블 데이터 wigo.tb_sys_user_login_hst:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_user_login_hst`;

-- 테이블 wigo.tb_sys_user_wdgt_bas 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_sys_user_wdgt_bas` (
  `USER_ID` int(11) NOT NULL COMMENT '사용자ID',
  `MENU_ID` varchar(20) NOT NULL COMMENT '메뉴ID',
  `MENU_ODRG` smallint(6) DEFAULT NULL COMMENT '메뉴순번',
  `REGR_ID` varchar(20) NOT NULL COMMENT '등록자ID',
  `REG_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일시',
  `AMDR_ID` varchar(20) NOT NULL COMMENT '수정자ID',
  `AMD_DT` datetime NOT NULL DEFAULT current_timestamp() COMMENT '수정일시',
  PRIMARY KEY (`USER_ID`,`MENU_ID`),
  UNIQUE KEY `USER_ID` (`USER_ID`,`MENU_ID`,`MENU_ODRG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='사용자위젯기본';

-- 테이블 데이터 wigo.tb_sys_user_wdgt_bas:~0 rows (대략적) 내보내기
DELETE FROM `tb_sys_user_wdgt_bas`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
