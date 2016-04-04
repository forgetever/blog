/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-04-04 13:06:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_ad
-- ----------------------------
DROP TABLE IF EXISTS `blog_ad`;
CREATE TABLE `blog_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_ad
-- ----------------------------

-- ----------------------------
-- Table structure for blog_asset
-- ----------------------------
DROP TABLE IF EXISTS `blog_asset`;
CREATE TABLE `blog_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of blog_asset
-- ----------------------------

-- ----------------------------
-- Table structure for blog_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `blog_auth_access`;
CREATE TABLE `blog_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of blog_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for blog_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `blog_auth_rule`;
CREATE TABLE `blog_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of blog_auth_rule
-- ----------------------------
INSERT INTO `blog_auth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', null, '内容管理', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', null, '所有留言', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', null, '删除网站留言', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', null, '评论管理', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', null, '删除评论', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', null, '评论审核', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', null, '文章管理', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', null, '文章排序', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', null, '文章置顶', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', null, '文章推荐', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', null, '批量移动', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', null, '文章审核', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', null, '删除文章', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', null, '编辑文章', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', null, '提交编辑', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', null, '添加文章', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', null, '提交添加', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/index', null, '分类管理', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', null, '文章分类排序', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', null, '删除分类', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', null, '编辑分类', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', null, '提交编辑', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', null, '添加分类', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', null, '提交添加', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', null, '页面管理', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', null, '页面排序', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', null, '删除页面', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', null, '编辑页面', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', null, '提交编辑', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', null, '添加页面', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', null, '提交添加', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', null, '回收站', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', null, '文章回收', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', null, '文章还原', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', null, '彻底删除', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', null, '页面回收', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', null, '彻底删除', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', null, '页面还原', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', null, '扩展工具', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', null, '备份管理', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', null, '数据还原', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', null, '数据备份', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', null, '提交数据备份', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', null, '下载备份', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', null, '删除备份', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', null, '数据备份导入', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', null, '插件管理', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', null, '插件启用切换', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', null, '插件设置', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', null, '插件设置提交', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', null, '插件安装', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', null, '插件卸载', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', null, '幻灯片', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', null, '幻灯片管理', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', null, '幻灯片排序', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', null, '幻灯片显示切换', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', null, '删除幻灯片', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', null, '编辑幻灯片', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', null, '提交编辑', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', null, '添加幻灯片', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', null, '提交添加', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', null, '幻灯片分类', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', null, '删除分类', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', null, '编辑分类', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', null, '添加分类', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', null, '提交添加', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', null, '网站广告', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', null, '广告显示切换', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', null, '删除广告', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', null, '编辑广告', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', null, '提交编辑', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', null, '添加广告', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', null, '提交添加', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', null, '友情链接', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', null, '友情链接排序', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', null, '友链显示切换', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', null, '删除友情链接', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', null, '编辑友情链接', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', null, '提交编辑', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', null, '添加友情链接', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', null, '提交添加', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', null, '第三方登陆', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', null, '提交设置', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', null, '菜单管理', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', null, '前台菜单', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', null, '菜单管理', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', null, '前台导航排序', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', null, '删除菜单', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', null, '编辑菜单', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', null, '提交编辑', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', null, '添加菜单', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', null, '提交添加', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', null, '菜单分类', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', null, '删除分类', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', null, '编辑分类', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', null, '添加分类', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', null, '提交添加', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', null, '后台菜单', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', null, '添加菜单', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', null, '提交添加', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', null, '后台菜单排序', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', null, '菜单备份', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', null, '编辑菜单', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', null, '提交编辑', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', null, '删除菜单', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', null, '所有菜单', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', null, '设置', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', null, '个人信息', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', null, '修改信息', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', null, '修改信息提交', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', null, '修改密码', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', null, '提交修改', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', null, '网站信息', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', null, '提交修改', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', null, '路由列表', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', null, '路由添加', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', null, '路由添加提交', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', null, '路由编辑', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', null, '路由编辑提交', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', null, '路由删除', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', null, '路由禁止', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', null, '路由启用', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', null, '路由排序', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', null, '邮箱配置', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', null, 'SMTP配置', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', null, '提交配置', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', null, '邮件模板', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', null, '提交模板', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', null, '清除缓存', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', null, '用户管理', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', null, '用户组', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', null, '本站用户', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', null, '拉黑会员', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', null, '启用会员', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', null, '第三方用户', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', null, '第三方用户解绑', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', null, '管理组', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', null, '角色管理', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', null, '成员管理', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', null, '权限设置', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', null, '提交设置', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', null, '编辑角色', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', null, '提交编辑', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', null, '删除角色', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', null, '添加角色', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', null, '提交添加', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', null, '管理员', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', null, '删除管理员', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', null, '管理员编辑', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', null, '编辑提交', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', null, '管理员添加', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', null, '添加提交', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', null, '插件更新', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', null, '文件存储', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', null, '文件存储设置提交', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', null, '禁用幻灯片', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', null, '启用幻灯片', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', null, '禁用管理员', '1', '');
INSERT INTO `blog_auth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', null, '启用管理员', '1', '');

-- ----------------------------
-- Table structure for blog_comments
-- ----------------------------
DROP TABLE IF EXISTS `blog_comments`;
CREATE TABLE `blog_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of blog_comments
-- ----------------------------

-- ----------------------------
-- Table structure for blog_common_action_log
-- ----------------------------
DROP TABLE IF EXISTS `blog_common_action_log`;
CREATE TABLE `blog_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of blog_common_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for blog_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `blog_guestbook`;
CREATE TABLE `blog_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of blog_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for blog_links
-- ----------------------------
DROP TABLE IF EXISTS `blog_links`;
CREATE TABLE `blog_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of blog_links
-- ----------------------------
INSERT INTO `blog_links` VALUES ('1', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '', '1', '0', '', '0');

-- ----------------------------
-- Table structure for blog_menu
-- ----------------------------
DROP TABLE IF EXISTS `blog_menu`;
CREATE TABLE `blog_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of blog_menu
-- ----------------------------
INSERT INTO `blog_menu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '1', '内容管理', 'th', '', '30');
INSERT INTO `blog_menu` VALUES ('2', '1', 'Api', 'Guestbookadmin', 'index', '', '1', '1', '所有留言', '', '', '0');
INSERT INTO `blog_menu` VALUES ('3', '2', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `blog_menu` VALUES ('4', '1', 'Comment', 'Commentadmin', 'index', '', '1', '1', '评论管理', '', '', '0');
INSERT INTO `blog_menu` VALUES ('5', '4', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `blog_menu` VALUES ('6', '4', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `blog_menu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `blog_menu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `blog_menu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '文章置顶', '', '', '0');
INSERT INTO `blog_menu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '文章推荐', '', '', '0');
INSERT INTO `blog_menu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `blog_menu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `blog_menu` VALUES ('18', '1', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '2');
INSERT INTO `blog_menu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `blog_menu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `blog_menu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `blog_menu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '3');
INSERT INTO `blog_menu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `blog_menu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `blog_menu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `blog_menu` VALUES ('32', '1', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', '', '', '4');
INSERT INTO `blog_menu` VALUES ('33', '32', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `blog_menu` VALUES ('34', '33', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('35', '33', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('36', '32', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `blog_menu` VALUES ('37', '36', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('38', '36', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '1', '扩展工具', 'cloud', '', '40');
INSERT INTO `blog_menu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '1', '备份管理', '', '', '0');
INSERT INTO `blog_menu` VALUES ('41', '40', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `blog_menu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `blog_menu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `blog_menu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('46', '40', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('47', '39', 'Admin', 'Plugin', 'index', '', '1', '1', '插件管理', '', '', '0');
INSERT INTO `blog_menu` VALUES ('48', '47', 'Admin', 'Plugin', 'toggle', '', '1', '0', '插件启用切换', '', '', '0');
INSERT INTO `blog_menu` VALUES ('49', '47', 'Admin', 'Plugin', 'setting', '', '1', '0', '插件设置', '', '', '0');
INSERT INTO `blog_menu` VALUES ('50', '49', 'Admin', 'Plugin', 'setting_post', '', '1', '0', '插件设置提交', '', '', '0');
INSERT INTO `blog_menu` VALUES ('51', '47', 'Admin', 'Plugin', 'install', '', '1', '0', '插件安装', '', '', '0');
INSERT INTO `blog_menu` VALUES ('52', '47', 'Admin', 'Plugin', 'uninstall', '', '1', '0', '插件卸载', '', '', '0');
INSERT INTO `blog_menu` VALUES ('53', '39', 'Admin', 'Slide', 'default', '', '1', '1', '幻灯片', '', '', '1');
INSERT INTO `blog_menu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '幻灯片管理', '', '', '0');
INSERT INTO `blog_menu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `blog_menu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `blog_menu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `blog_menu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `blog_menu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '幻灯片分类', '', '', '0');
INSERT INTO `blog_menu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `blog_menu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `blog_menu` VALUES ('68', '39', 'Admin', 'Ad', 'index', '', '1', '1', '网站广告', '', '', '2');
INSERT INTO `blog_menu` VALUES ('69', '68', 'Admin', 'Ad', 'toggle', '', '1', '0', '广告显示切换', '', '', '0');
INSERT INTO `blog_menu` VALUES ('70', '68', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('71', '68', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('72', '71', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `blog_menu` VALUES ('73', '68', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('74', '73', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `blog_menu` VALUES ('75', '39', 'Admin', 'Link', 'index', '', '0', '1', '友情链接', '', '', '3');
INSERT INTO `blog_menu` VALUES ('76', '75', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `blog_menu` VALUES ('77', '75', 'Admin', 'Link', 'toggle', '', '1', '0', '友链显示切换', '', '', '0');
INSERT INTO `blog_menu` VALUES ('78', '75', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('79', '75', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('80', '79', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `blog_menu` VALUES ('81', '75', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('82', '81', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `blog_menu` VALUES ('83', '39', 'Api', 'Oauthadmin', 'setting', '', '1', '1', '第三方登陆', 'leaf', '', '4');
INSERT INTO `blog_menu` VALUES ('84', '83', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `blog_menu` VALUES ('85', '0', 'Admin', 'Menu', 'default', '', '1', '1', '菜单管理', 'list', '', '20');
INSERT INTO `blog_menu` VALUES ('86', '85', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `blog_menu` VALUES ('87', '86', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `blog_menu` VALUES ('88', '87', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `blog_menu` VALUES ('89', '87', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('90', '87', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('91', '90', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `blog_menu` VALUES ('92', '87', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('93', '92', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `blog_menu` VALUES ('94', '86', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `blog_menu` VALUES ('95', '94', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('96', '94', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('97', '96', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `blog_menu` VALUES ('98', '94', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('99', '98', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `blog_menu` VALUES ('100', '85', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '0');
INSERT INTO `blog_menu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `blog_menu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `blog_menu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `blog_menu` VALUES ('104', '100', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `blog_menu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('108', '100', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '1', '设置', 'cogs', '', '0');
INSERT INTO `blog_menu` VALUES ('110', '109', 'Admin', 'Setting', 'userdefault', '', '0', '1', '个人信息', '', '', '0');
INSERT INTO `blog_menu` VALUES ('111', '110', 'Admin', 'User', 'userinfo', '', '1', '1', '修改信息', '', '', '0');
INSERT INTO `blog_menu` VALUES ('112', '111', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `blog_menu` VALUES ('113', '110', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `blog_menu` VALUES ('114', '113', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `blog_menu` VALUES ('115', '109', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `blog_menu` VALUES ('116', '115', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `blog_menu` VALUES ('117', '115', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `blog_menu` VALUES ('118', '115', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `blog_menu` VALUES ('119', '118', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `blog_menu` VALUES ('120', '115', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `blog_menu` VALUES ('121', '120', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `blog_menu` VALUES ('122', '115', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `blog_menu` VALUES ('123', '115', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `blog_menu` VALUES ('124', '115', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `blog_menu` VALUES ('125', '115', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `blog_menu` VALUES ('126', '109', 'Admin', 'Mailer', 'default', '', '1', '1', '邮箱配置', '', '', '0');
INSERT INTO `blog_menu` VALUES ('127', '126', 'Admin', 'Mailer', 'index', '', '1', '1', 'SMTP配置', '', '', '0');
INSERT INTO `blog_menu` VALUES ('128', '127', 'Admin', 'Mailer', 'index_post', '', '1', '0', '提交配置', '', '', '0');
INSERT INTO `blog_menu` VALUES ('129', '126', 'Admin', 'Mailer', 'active', '', '1', '1', '邮件模板', '', '', '0');
INSERT INTO `blog_menu` VALUES ('130', '129', 'Admin', 'Mailer', 'active_post', '', '1', '0', '提交模板', '', '', '0');
INSERT INTO `blog_menu` VALUES ('131', '109', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '1');
INSERT INTO `blog_menu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '10');
INSERT INTO `blog_menu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '1', '用户组', '', '', '0');
INSERT INTO `blog_menu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `blog_menu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `blog_menu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `blog_menu` VALUES ('137', '133', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `blog_menu` VALUES ('138', '137', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `blog_menu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `blog_menu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `blog_menu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `blog_menu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `blog_menu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `blog_menu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `blog_menu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `blog_menu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `blog_menu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `blog_menu` VALUES ('155', '47', 'Admin', 'Plugin', 'update', '', '1', '0', '插件更新', '', '', '0');
INSERT INTO `blog_menu` VALUES ('156', '39', 'Admin', 'Storage', 'index', '', '1', '1', '文件存储', '', '', '0');
INSERT INTO `blog_menu` VALUES ('157', '156', 'Admin', 'Storage', 'setting_post', '', '1', '0', '文件存储设置提交', '', '', '0');
INSERT INTO `blog_menu` VALUES ('158', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `blog_menu` VALUES ('159', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `blog_menu` VALUES ('160', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `blog_menu` VALUES ('161', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');

-- ----------------------------
-- Table structure for blog_nav
-- ----------------------------
DROP TABLE IF EXISTS `blog_nav`;
CREATE TABLE `blog_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of blog_nav
-- ----------------------------
INSERT INTO `blog_nav` VALUES ('9', '2', '0', '给我留言', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"6\";}}', '', '1', '5', '0-9');
INSERT INTO `blog_nav` VALUES ('10', '2', '0', '关于系统', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"7\";}}', '', '1', '6', '0-10');
INSERT INTO `blog_nav` VALUES ('7', '2', '0', '学习点滴', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"4\";}}', '', '1', '3', '0-7');
INSERT INTO `blog_nav` VALUES ('8', '2', '0', '资源分享', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"5\";}}', '', '1', '4', '0-8');
INSERT INTO `blog_nav` VALUES ('6', '2', '0', '生活点滴', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}', '', '1', '2', '0-6');
INSERT INTO `blog_nav` VALUES ('5', '2', '0', '网站首页', '', 'home', '', '1', '1', '0-5');
INSERT INTO `blog_nav` VALUES ('11', '2', '6', '生活随笔', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"9\";}}', '', '1', '0', '0-6-11');
INSERT INTO `blog_nav` VALUES ('12', '2', '6', '杂乱文档', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"10\";}}', '', '1', '0', '0-6-12');
INSERT INTO `blog_nav` VALUES ('13', '2', '7', 'html-css', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"11\";}}', '', '1', '0', '0-7-13');
INSERT INTO `blog_nav` VALUES ('14', '2', '7', '前端框架', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"12\";}}', '', '1', '0', '0-7-14');
INSERT INTO `blog_nav` VALUES ('15', '2', '7', '后端语言', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"13\";}}', '', '1', '0', '0-7-15');
INSERT INTO `blog_nav` VALUES ('16', '2', '7', '桌面相关', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"14\";}}', '', '1', '0', '0-7-16');
INSERT INTO `blog_nav` VALUES ('17', '2', '8', '实用资源', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"15\";}}', '', '1', '0', '0-8-17');
INSERT INTO `blog_nav` VALUES ('18', '2', '8', '实用技巧', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"16\";}}', '', '1', '0', '0-8-18');
INSERT INTO `blog_nav` VALUES ('19', '2', '8', '休闲资源', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"17\";}}', '', '1', '0', '0-8-19');
INSERT INTO `blog_nav` VALUES ('20', '2', '8', '书籍推荐', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"18\";}}', '', '1', '0', '0-8-20');

-- ----------------------------
-- Table structure for blog_nav_cat
-- ----------------------------
DROP TABLE IF EXISTS `blog_nav_cat`;
CREATE TABLE `blog_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

-- ----------------------------
-- Records of blog_nav_cat
-- ----------------------------
INSERT INTO `blog_nav_cat` VALUES ('2', '主导航', '1', '首页导航栏');

-- ----------------------------
-- Table structure for blog_oauth_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_oauth_user`;
CREATE TABLE `blog_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of blog_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for blog_options
-- ----------------------------
DROP TABLE IF EXISTS `blog_options`;
CREATE TABLE `blog_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

-- ----------------------------
-- Records of blog_options
-- ----------------------------
INSERT INTO `blog_options` VALUES ('1', 'member_email_active', '{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `blog_options` VALUES ('2', 'site_options', '{\"site_name\":\"\\u5f20\\u749e\\u7684\\u535a\\u5ba2\",\"site_host\":\"http:\\/\\/localhost\\/\",\"site_admin_url_password\":\"\",\"site_tpl\":\"myblog\",\"site_adminstyle\":\"bluesky\",\"site_icp\":\"\",\"site_admin_email\":\"791458703@qq.com\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"\\u5f20\\u749e\\u7684\\u535a\\u5ba2\",\"site_seo_keywords\":\"\\u5f20\\u749e \\u535a\\u5ba2 \\u751f\\u6d3b \\u5b66\\u4e60 \\u524d\\u7aef \\u540e\\u7aef \",\"site_seo_description\":\"\\u5f20\\u749e \\u535a\\u5ba2 \\u751f\\u6d3b \\u5b66\\u4e60 \\u524d\\u7aef \\u540e\\u7aef \",\"urlmode\":\"0\",\"html_suffix\":\"\",\"comment_time_interval\":60}', '1');
INSERT INTO `blog_options` VALUES ('3', 'cmf_settings', '{\"banned_usernames\":\"\"}', '1');

-- ----------------------------
-- Table structure for blog_plugins
-- ----------------------------
DROP TABLE IF EXISTS `blog_plugins`;
CREATE TABLE `blog_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of blog_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for blog_posts
-- ----------------------------
DROP TABLE IF EXISTS `blog_posts`;
CREATE TABLE `blog_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- ----------------------------
-- Records of blog_posts
-- ----------------------------
INSERT INTO `blog_posts` VALUES ('1', '1', 'dom javascript ', 'http://www.w3cfuns.com/notes/22817/cfe1f4015cc636aa16ce4a85980c4c4e.html', '2016-04-03 17:54:41', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">一、JScript中对象的三种类型：</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&lt;1&gt; 内建对象 -&gt;JS本身所提供的对象，如Array, Math, Date等；</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&lt;2&gt; 宿主对象 -&gt;由其运行环境(浏览器)所提供的对象，如window, document等；</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&lt;3&gt; 自定义对象 -&gt; 程序员自定 . . .</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">二、为HTML5 DOM新增方法getElementsByClassName()所做的新旧浏览器兼容：</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;function getElementsByClassName(node, className){</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;if(node.getElementsByClassName){</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; return node.getElementsByClassName(className);</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;} else {</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; var results = new Array();</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; var elems = node.getElementsByTagName(&quot;*&quot;);</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; for(var i = 0; i &lt; elems.length; i++){</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;if(elems[i].className.indexOf(className) != -1){</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; results[results.length] = elems[i];</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;}</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; }</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; return results;</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;}</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;}</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">三、nodeType的返回值1/2/3分别对应的是 元素节点、属性节点、文本节点。</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">注： DOM -&gt; document object model;</span><br style=\"word-wrap: break-word; box-sizing: border-box; color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: arial, verdana, &#39;Microsoft YaHei&#39;, Tahoma, Simsun, sans-serif; font-size: 14px; line-height: 25.2px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;BOM -&gt; browser object model.</span></p>', 'DOM编程艺术重要知识点-1', 'JScript中对象的三种类型', '1', '1', '2016-04-03 17:51:14', null, '0', null, '', '0', '{\"thumb\":\"\"}', '9', '0', '0', '0');
INSERT INTO `blog_posts` VALUES ('2', '1', '', '', '2016-04-04 10:37:36', '<p>blog终于上线啦，希望大家多多捧场。。。现在功能简单，以后会不断完善</p>', '上线啦！', '博客上线', '1', '1', '2016-04-04 10:36:32', null, '0', null, '', '0', '{\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `blog_posts` VALUES ('3', '1', 'Java final static', 'http://lavasoft.blog.51cto.com/62575/18771/', '2016-04-04 12:06:40', '<p><span style=\"color:#ff0000;font-size:18px;padding: 0px; margin: 0px;\"><strong style=\"padding: 0px; margin: 0px;\">Java关键字final、static使用总结</strong></span></p><p><span style=\"font-size:12px;padding: 0px; margin: 0px;\"></span>&nbsp;</p><p><span style=\"font-size:12px;padding: 0px; margin: 0px;\"><strong style=\"padding: 0px; margin: 0px;\"><span style=\"color:#ff0000;font-size:16px;padding: 0px; margin: 0px;\">一、final</span></strong><br style=\"padding: 0px; margin: 0px;\"/></span><span style=\"font-size:16px;padding: 0px; margin: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 根据程序上下文环境，Java关键字final有“这是无法改变的”或者“终态的”含义，它可以修饰非抽象类、非抽象类成员方法和变量。你可能出于两种理解而需要阻止改变：设计或效率。</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; final类不能被继承，没有子类，final类中的方法默认是final的。<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; final方法不能被子类的方法覆盖，但可以被继承。<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; final成员变量表示常量，只能被赋值一次，赋值后值不再改变。<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; final不能用于修饰构造方法。<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 注意：父类的private成员方法是不能被子类方法覆盖的，因此private类型的方法默认是final类型的。</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"></span>&nbsp;</p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">1、final类<br style=\"padding: 0px; margin: 0px;\"/></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; final类不能被继承，因此final类的成员方法没有机会被覆盖，默认都是final的。在设计类时候，如果这个类不需要有子类，类的实现细节不允许改变，并且确信这个类不会载被扩展，那么就设计为final类。</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\">2、final方法<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 如果一个类不允许其子类覆盖某个方法，则可以把这个方法声明为final方法。<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 使用final方法的原因有二：<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 第一、把方法锁定，防止任何继承类修改它的意义和实现。<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 第二、高效。编译器在遇到调用final方法时候会转入内嵌机制，大大提高执行效率。<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 例如：<br style=\"padding: 0px; margin: 0px;\"/></span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"></span></p><p><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">class</span>&nbsp;Test1 {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">void</span>&nbsp;main(String[] args) {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">// TODO 自动生成方法存根&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">void</span>&nbsp;f1() {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;f1&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><span style=\"color:#008000;padding: 0px; margin: 0px;\">//无法被子类覆盖的方法&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">void</span>&nbsp;f2() {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;f2&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">void</span>&nbsp;f3() {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;f3&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">private</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">void</span>&nbsp;f4() {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;f4&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">class</span>&nbsp;Test2&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">extends</span>&nbsp;Test1 {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">void</span>&nbsp;f1(){&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;Test1父类方法f1被覆盖!&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">void</span>&nbsp;main(String[] args) {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;Test2 t=<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">new</span>&nbsp;Test2();&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;t.f1();&nbsp;&nbsp;&nbsp;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;t.f2();&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//调用从父类继承过来的final方法&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;t.f3();&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//调用从父类继承过来的方法&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//t.f4(); //调用失败，无法从父类继承获得&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>}</p><p></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">3、final变量（常量）<br style=\"padding: 0px; margin: 0px;\"/></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 用final修饰的成员变量表示常量，值一旦给定就无法改变！<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; final修饰的变量有三种：静态变量、实例变量和局部变量，分别表示三种类型的常量。<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 从下面的例子中可以看出，一旦给final变量初值后，值就不能再改变了。<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 另外，final变量定义的时候，可以先声明，而不给初值，这中变量也称为final空白，无论什么情况，编译器都确保空白final在使用之前必须被初始化。但是，final空白在final关键字final的使用上提供了更大的灵活性，为此，一个类中的final数据成员就可以实现依对象而有所不同，却有保持其恒定不变的特征。</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"></span>&nbsp;</p><p><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">package</span>&nbsp;org.leizhimin;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">class</span>&nbsp;Test3 {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">private</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>&nbsp;String S =&nbsp;<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>实例变量S&quot;</span>;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">private</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">int</span>&nbsp;A = 100;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">int</span>&nbsp;B = 90;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">int</span>&nbsp;C = 80;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">private</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">int</span>&nbsp;D = 70;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">int</span>&nbsp;E;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//final空白,必须在初始化对象的时候赋初值&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;Test3(<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">int</span>&nbsp;x) {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E = x;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">/**&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @param args&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */</span>&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">void</span>&nbsp;main(String[] args) {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Test3 t =&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">new</span>&nbsp;Test3(2);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//t.A=101;&nbsp;&nbsp;&nbsp;&nbsp;//出错,final变量的值一旦给定就无法改变&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//t.B=91; //出错,final变量的值一旦给定就无法改变&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//t.C=81; //出错,final变量的值一旦给定就无法改变&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//t.D=71; //出错,final变量的值一旦给定就无法改变&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(t.A);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(t.B);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(t.C);&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//不推荐用对象方式访问静态字段&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(t.D);&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//不推荐用对象方式访问静态字段&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(Test3.C);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(Test3.D);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//System.out.println(Test3.E); //出错,因为E为final空白,依据不同对象值有所不同.&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(t.E);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Test3 t1 =&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">new</span>&nbsp;Test3(3);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(t1.E);&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//final空白变量E依据对象的不同而不同&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">private</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">void</span>&nbsp;test() {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">new</span>&nbsp;Test3(1).A);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(Test3.C);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(Test3.D);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">void</span>&nbsp;test2() {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">int</span>&nbsp;a;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//final空白,在需要的时候才赋值&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">int</span>&nbsp;b = 4;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//局部常量--final用于局部变量的情形&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">int</span>&nbsp;c;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//final空白,一直没有给赋值.&nbsp;&nbsp;&nbsp;&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a = 3;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//a=4;&nbsp;&nbsp;&nbsp;&nbsp;出错,已经给赋过值了.&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//b=2; 出错,已经给赋过值了.&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>}</p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"></span>&nbsp;</p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">4、final参数</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 当函数参数为final类型时，你可以读取使用该参数，但是无法改变该参数的值。<br style=\"padding: 0px; margin: 0px;\"/></span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px; color: rgb(85, 85, 85); font-family: 宋体, &#39;Arial Narrow&#39;, arial, serif; white-space: normal; background-color: rgb(255, 255, 255);\"></span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"></span><span style=\"font-size:12px;padding: 0px; margin: 0px;\"></span>&nbsp;</p><p><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">class</span>&nbsp;Test4 {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">void</span>&nbsp;main(String[] args) {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">new</span>&nbsp;Test4().f1(2);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">void</span>&nbsp;f1(<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">int</span>&nbsp;i) {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//i++;&nbsp;&nbsp;&nbsp;&nbsp;//i是final类型的,值不允许改变的.&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.print(i);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>}</p><p><br style=\"padding: 0px; margin: 0px;\"/><span style=\"font-size:16px;padding: 0px; margin: 0px;\"><strong style=\"padding: 0px; margin: 0px;\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\">二、static</span></strong></span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"><strong style=\"padding: 0px; margin: 0px;\"><span style=\"color:#ff0000;padding: 0px; margin: 0px;\"><br style=\"padding: 0px; margin: 0px;\"/></span></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static表示“全局”或者“静态”的意思，用来修饰成员变量和成员方法，也可以形成静态static代码块，但是Java语言中没有全局变量的概念。</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#ff0000;padding: 0px; margin: 0px;\">被static修饰的成员变量和成员方法独立于该类的任何对象。</span>也就是说，它不依赖类特定的实例，被类的所有实例共享。只要这个类被加载，Java虚拟机就能根据类名在运行时数据区的方法区内定找到他们。因此，static对象可以在它的任何对象创建之前访问，无需引用任何对象。</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#ff1493;padding: 0px; margin: 0px;\">用public修饰的static成员变量和成员方法本质是全局变量和全局方法，当声明它类的对象市，不生成static变量的副本，而是类的所有实例共享同一个static变量。</span></span></p><p><span style=\"color:#ff1493;font-size:16px;padding: 0px; margin: 0px;\"></span>&nbsp;</p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static变量前可以有private修饰，表示这个变量可以在类的静态代码块中，或者类的其他静态成员方法中使用（当然也可以在非静态成员方法中使用--废话），但是不能在其他类中通过类名来直接引用，这一点很重要。</span>实际上你需要搞明白，<span style=\"color:#ff1493;padding: 0px; margin: 0px;\">private是访问权限限定，static表示不要实例化就可以使用</span>，这样就容易理解多了。static前面加上其它访问权限关键字的效果也以此类推。</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"></span>&nbsp;</p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static修饰的成员变量和成员方法习惯上称为静态变量和静态方法，可以直接通过类名来访问，访问语法为：<br style=\"padding: 0px; margin: 0px;\"/>类名.静态方法名(参数列表...)&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>类名.静态变量名</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 用static修饰的代码块表示静态代码块，当Java虚拟机（JVM）加载类时，就会执行该代码块（用处非常大，呵呵）。</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"></span>&nbsp;</p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">1、static变量<br style=\"padding: 0px; margin: 0px;\"/></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 按照是否静态的对类成员变量进行分类可分两种：一种是被static修饰的变量，叫静态变量或类变量；另一种是没有被static修饰的变量，叫实例变量。两者的区别是：<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 对于静态变量在内存中只有一个拷贝（节省内存），JVM只为静态分配一次内存，在加载类的过程中完成静态变量的内存分配，可用类名直接访问（方便），当然也可以通过对象来访问（但是这是不推荐的）。<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 对于实例变量，没创建一个实例，就会为实例变量分配一次内存，实例变量可以在内存中有多个拷贝，互不影响（灵活）。</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"><span style=\"color:#0000ff;padding: 0px; margin: 0px;\"></span></span>&nbsp;</p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">2、静态方法<br style=\"padding: 0px; margin: 0px;\"/></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 静态方法可以直接通过类名调用，任何的实例也都可以调用，因此静态方法中不能用this和super关键字，不能直接访问所属类的实例变量和实例方法(就是不带static的成员变量和成员成员方法)，只能访问所属类的静态成员变量和成员方法。因为实例成员与特定的对象关联！这个需要去理解，想明白其中的道理，不是记忆！！！<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 因为static方法独立于任何实例，因此static方法必须被实现，而不能是抽象的abstract。</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"><span style=\"color:#0000ff;padding: 0px; margin: 0px;\"></span></span>&nbsp;</p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">3、static代码块</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static代码块也叫静态代码块，是在类中独立于类成员的static语句块，可以有多个，位置可以随便放，它不在任何的方法体内，JVM加载类时会执行这些静态的代码块，如果static代码块有多个，JVM将按照它们在类中出现的先后顺序依次执行它们，每个代码块只会被执行一次。例如：<br style=\"padding: 0px; margin: 0px;\"/></span></p><p><span style=\"font-size:12px;padding: 0px; margin: 0px;\"></span>&nbsp;</p><p><span style=\"font-size:12px;padding: 0px; margin: 0px;\"></span></p><p><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">class</span>&nbsp;Test5 {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">private</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">int</span>&nbsp;a;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">private</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">int</span>&nbsp;b;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;{&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Test5.a = 3;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(a);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Test5 t =&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">new</span>&nbsp;Test5();&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t.f();&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t.b = 1000;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(t.b);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;{&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Test5.a = 4;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(a);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">void</span>&nbsp;main(String[] args) {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">// TODO 自动生成方法存根&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;{&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Test5.a = 5;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(a);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">void</span>&nbsp;f() {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;hhahhahah&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>}</p><p></p><p>&nbsp;</p><p><span style=\"font-size:12px;padding: 0px; margin: 0px;\">运行结果：<br style=\"padding: 0px; margin: 0px;\"/><span style=\"color:#f0ffff;padding: 0px; margin: 0px; background-color: rgb(0, 0, 0);\">3<br style=\"padding: 0px; margin: 0px;\"/>hhahhahah<br style=\"padding: 0px; margin: 0px;\"/>1000<br style=\"padding: 0px; margin: 0px;\"/>4<br style=\"padding: 0px; margin: 0px;\"/>5</span></span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 利用静态代码块可以对一些static变量进行赋值，最后再看一眼这些例子，都一个static的main方法，这样JVM在运行main方法的时候可以直接调用而不用创建实例。</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"></span>&nbsp;</p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">4、static和final一块用表示什么</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static final用来修饰成员变量和成员方法，可简单理解为“全局常量”！<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 对于变量，表示一旦给值就不可修改，并且通过类名可以访问。<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 对于方法，表示不可覆盖，并且可以通过类名直接访问。</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 特别要注意一个问题：</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 对于被static和final修饰过的实例常量，实例本身不能再改变了，但对于一些容器类型（比如，ArrayList、HashMap）的实例变量，不可以改变容器变量本身，但可以修改容器中存放的对象，这一点在编程中用到很多。</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 也许说了这么多，反倒把你搞晕了，还是看个例子吧：</span></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"></span>&nbsp;</p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"></span></p><p><span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">class</span>&nbsp;TestStaticFinal {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">private</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>&nbsp;String strStaticFinalVar =&nbsp;<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;aaa&quot;</span>;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">private</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;String strStaticVar =&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">null</span>;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">private</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>&nbsp;String strFinalVar =&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">null</span>;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">private</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">int</span>&nbsp;intStaticFinalVar = 0;&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">private</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>&nbsp;Integer integerStaticFinalVar =&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">new</span>&nbsp;Integer(8);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">private</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">final</span>&nbsp;ArrayList&lt;String&gt; alStaticFinalVar =&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">new</span>&nbsp;ArrayList&lt;String&gt;();&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">private</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">void</span>&nbsp;test() {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;-------------值处理前----------\\r\\n&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;strStaticFinalVar=&quot;</span>&nbsp;+ strStaticFinalVar +&nbsp;<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;\\r\\n&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;strStaticVar=&quot;</span>&nbsp;+ strStaticVar +&nbsp;<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;\\r\\n&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;strFinalVar=&quot;</span>&nbsp;+ strFinalVar +&nbsp;<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;\\r\\n&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;intStaticFinalVar=&quot;</span>&nbsp;+ intStaticFinalVar +&nbsp;<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;\\r\\n&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;integerStaticFinalVar=&quot;</span>&nbsp;+ integerStaticFinalVar +&nbsp;<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;\\r\\n&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;alStaticFinalVar=&quot;</span>&nbsp;+ alStaticFinalVar +&nbsp;<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;\\r\\n&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//strStaticFinalVar=&quot;哈哈哈哈&quot;;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//错误，final表示终态,不可以改变变量本身.&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;strStaticVar =&nbsp;<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;哈哈哈哈&quot;</span>;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//正确，static表示类变量,值可以改变.&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//strFinalVar=&quot;呵呵呵呵&quot;;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//错误, final表示终态，在定义的时候就要初值（哪怕给个null），一旦给定后就不可再更改。&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//intStaticFinalVar=2;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//错误, final表示终态，在定义的时候就要初值（哪怕给个null），一旦给定后就不可再更改。&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//integerStaticFinalVar=new Integer(8);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//错误, final表示终态，在定义的时候就要初值（哪怕给个null），一旦给定后就不可再更改。&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;alStaticFinalVar.add(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;aaa&quot;</span>);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//正确，容器变量本身没有变化，但存放内容发生了变化。这个规则是非常常用的，有很多用途。&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;alStaticFinalVar.add(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;bbb&quot;</span>);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#008000;padding: 0px; margin: 0px;\">//正确，容器变量本身没有变化，但存放内容发生了变化。这个规则是非常常用的，有很多用途。&nbsp;</span><br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;-------------值处理后----------\\r\\n&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;strStaticFinalVar=&quot;</span>&nbsp;+ strStaticFinalVar +&nbsp;<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;\\r\\n&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;strStaticVar=&quot;</span>&nbsp;+ strStaticVar +&nbsp;<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;\\r\\n&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;strFinalVar=&quot;</span>&nbsp;+ strFinalVar +&nbsp;<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;\\r\\n&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;intStaticFinalVar=&quot;</span>&nbsp;+ intStaticFinalVar +&nbsp;<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;\\r\\n&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;integerStaticFinalVar=&quot;</span>&nbsp;+ integerStaticFinalVar +&nbsp;<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;\\r\\n&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.out.println(<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;alStaticFinalVar=&quot;</span>&nbsp;+ alStaticFinalVar +&nbsp;<span style=\"color:#800000;padding: 0px; margin: 0px;\">&quot;\\r\\n&quot;</span>);&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/><br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">public</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">static</span>&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">void</span>&nbsp;main(String args[]) {&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color:#0000ff;padding: 0px; margin: 0px;\">new</span>&nbsp;TestStaticFinal().test();&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;<br style=\"padding: 0px; margin: 0px;\"/>}</p><p></p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"></span>&nbsp;</p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\">运行结果如下：</span></p><p>-------------值处理前----------</p><p>strStaticFinalVar=aaa</p><p>strStaticVar=null</p><p>strFinalVar=null</p><p>intStaticFinalVar=0</p><p>integerStaticFinalVar=8</p><p>alStaticFinalVar=[]</p><p>-------------值处理后----------</p><p>strStaticFinalVar=aaa</p><p>strStaticVar=哈哈哈哈</p><p>strFinalVar=null</p><p>intStaticFinalVar=0</p><p>integerStaticFinalVar=8</p><p>alStaticFinalVar=[aaa, bbb]</p><p><br style=\"padding: 0px; margin: 0px;\"/>Process finished with exit code 0</p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\"></span>&nbsp;</p><p><span style=\"font-size:16px;padding: 0px; margin: 0px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 看了上面这个例子，就清楚很多了，但必须明白：通过static final修饰的容器类型变量中所“装”的对象是可改变的。这是和一般基本类型和类类型变量差别很大的地方。</span></p><p><br/></p>', 'Java关键字final、static使用总结', 'Java关键字final、static使用总结', '1', '1', '2016-04-04 12:03:59', null, '0', null, '', '0', '{\"thumb\":\"20160404\\/5701e84615286.jpg\"}', '2', '0', '0', '0');

-- ----------------------------
-- Table structure for blog_role
-- ----------------------------
DROP TABLE IF EXISTS `blog_role`;
CREATE TABLE `blog_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of blog_role
-- ----------------------------
INSERT INTO `blog_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for blog_role_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_role_user`;
CREATE TABLE `blog_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of blog_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for blog_route
-- ----------------------------
DROP TABLE IF EXISTS `blog_route`;
CREATE TABLE `blog_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of blog_route
-- ----------------------------

-- ----------------------------
-- Table structure for blog_slide
-- ----------------------------
DROP TABLE IF EXISTS `blog_slide`;
CREATE TABLE `blog_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of blog_slide
-- ----------------------------

-- ----------------------------
-- Table structure for blog_slide_cat
-- ----------------------------
DROP TABLE IF EXISTS `blog_slide_cat`;
CREATE TABLE `blog_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of blog_slide_cat
-- ----------------------------

-- ----------------------------
-- Table structure for blog_terms
-- ----------------------------
DROP TABLE IF EXISTS `blog_terms`;
CREATE TABLE `blog_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

-- ----------------------------
-- Records of blog_terms
-- ----------------------------
INSERT INTO `blog_terms` VALUES ('3', '生活点滴', '', 'article', '生活点滴包含生活随笔杂乱文档', '0', '0', '0-3', '', '', '', 'class', 'content', '0', '1');
INSERT INTO `blog_terms` VALUES ('4', '学习点滴', '', 'article', '学习点滴包含html&amp;css,前端框架，后端语言，桌面相关', '0', '0', '0-4', '', '', '', 'class', 'content', '0', '1');
INSERT INTO `blog_terms` VALUES ('5', '资源分享', '', 'article', '', '0', '0', '0-5', '', '', '', 'class', 'content', '0', '1');
INSERT INTO `blog_terms` VALUES ('6', '给我留言', '', 'article', '', '0', '0', '0-6', '', '', '', 'contact', 'contact', '0', '1');
INSERT INTO `blog_terms` VALUES ('7', '关于系统', '', 'article', '', '0', '0', '0-7', '', '', '', 'about', 'about', '0', '1');
INSERT INTO `blog_terms` VALUES ('8', '网站首页', '', 'article', '', '0', '0', '0-8', '', '', '', 'index', 'index', '0', '1');
INSERT INTO `blog_terms` VALUES ('9', '生活随笔', '', 'article', '', '3', '0', '0-3-9', '', '', '', 'class', 'content', '0', '1');
INSERT INTO `blog_terms` VALUES ('10', '杂乱文档', '', 'article', '', '3', '0', '0-3-10', '', '', '', 'class', 'content', '0', '1');
INSERT INTO `blog_terms` VALUES ('11', 'Html-Css', '', 'article', '', '4', '0', '0-4-11', '', '', '', 'class', 'content', '0', '1');
INSERT INTO `blog_terms` VALUES ('12', '前端框架', '', 'article', '', '4', '0', '0-4-12', '', '', '', 'class', 'content', '0', '1');
INSERT INTO `blog_terms` VALUES ('13', '后端语音', '', 'article', '', '4', '0', '0-4-13', '', '', '', 'class', 'content', '0', '1');
INSERT INTO `blog_terms` VALUES ('14', '桌面相关', '', 'article', '', '4', '0', '0-4-14', '', '', '', 'class', 'content', '0', '1');
INSERT INTO `blog_terms` VALUES ('15', '实用资源', '', 'article', '', '5', '0', '0-5-15', '', '', '', 'class', 'content', '0', '1');
INSERT INTO `blog_terms` VALUES ('16', '使用技巧', '', 'article', '', '5', '0', '0-5-16', '', '', '', 'class', 'content', '0', '1');
INSERT INTO `blog_terms` VALUES ('17', '休闲资源', '', 'article', '', '5', '0', '0-5-17', '', '', '', 'class', 'content', '0', '1');
INSERT INTO `blog_terms` VALUES ('18', '书籍分享', '', 'article', '', '5', '0', '0-5-18', '', '', '', 'class', 'content', '0', '1');

-- ----------------------------
-- Table structure for blog_term_relationships
-- ----------------------------
DROP TABLE IF EXISTS `blog_term_relationships`;
CREATE TABLE `blog_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

-- ----------------------------
-- Records of blog_term_relationships
-- ----------------------------
INSERT INTO `blog_term_relationships` VALUES ('1', '1', '11', '0', '1');
INSERT INTO `blog_term_relationships` VALUES ('2', '2', '7', '0', '1');
INSERT INTO `blog_term_relationships` VALUES ('3', '3', '13', '0', '1');

-- ----------------------------
-- Table structure for blog_users
-- ----------------------------
DROP TABLE IF EXISTS `blog_users`;
CREATE TABLE `blog_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of blog_users
-- ----------------------------
INSERT INTO `blog_users` VALUES ('1', 'admin', '###380aaa3a8d397b7aa52d23d40ff5dfcb', 'admin', '791458703@qq.com', '', null, '0', null, null, '0.0.0.0', '2016-04-04 12:03:49', '2016-04-03 03:54:06', '', '1', '0', '1', '0', '');

-- ----------------------------
-- Table structure for blog_user_favorites
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_favorites`;
CREATE TABLE `blog_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of blog_user_favorites
-- ----------------------------
