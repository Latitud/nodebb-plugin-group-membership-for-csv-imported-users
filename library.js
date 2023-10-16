'use strict';

const nconf = require.main.require('nconf');
const winston = require.main.require('winston');

const meta = require.main.require('./src/meta');

const controllers = require('./lib/controllers');

const routeHelpers = require.main.require('./src/routes/helpers');
const User = require.main.require('./src/user');
const Groups = require.main.require('./src/groups');

const plugin = {};


plugin.extendCreatedUsers = async ({uids}) => {
	const createdUsers = await User.getUsersWithFields(uids,['uid', 'groups_to_import',],0);

	plugin.createGroupMemberships(createdUsers);
	plugin.updateProfileFields(createdUsers);
}

plugin.createGroupMemberships = async (createdUsers) => {
	console.log(`user-csv-importing-extension: Membership creation started.`);
	console.log(`user-csv-importing-extension: Memberships will be created for the following uids: ${createdUsers.map(user=>user.uid)}.`);
	
	await Promise.all(createdUsers.map(async (user) => {
		try {
			if(user.groups_to_import){
				const groupsToJoin = user.groups_to_import.split(",");
				await Groups.join(groupsToJoin, user.uid);
				console.log(`user-csv-importing-extension: User ${user.uid} is now a member of group ${groupsToJoin}.`);	
			}
		} catch (error) {
			console.error(`user-csv-importing-extension: An error occoured when creating group memberships!`);
			console.error(error);
		}
	}))
	
	console.log("user-csv-importing-extension: Membership creation finished.");
}

plugin.updateProfileFields = async (createdUsers) => {
	console.log(`user-csv-importing-extension: Profile update started.`);
	console.log(`user-csv-importing-extension: Profiles will be updated for the following uids: ${createdUsers.map(user=>user.uid)}.`);
	
	//await Promise.all(createdUsers.map(async (user) => {
	//	try {
	//		if(user.groups_to_import){
	//			const groupsToJoin = user.groups_to_import.split(",");
	//			await Groups.join(groupsToJoin, user.uid);
	//			console.log(`user-csv-importing-extension: User ${user.uid} is now a member of group ${groupsToJoin}.`);	
	//		}
	//	} catch (error) {
	//		console.error(`user-csv-importing-extension: An error occoured when creating group memberships!`);
	//		console.error(error);
	//	}
	//}))
	
	console.log("user-csv-importing-extension: Profile update finished.");
}

plugin.init = async (params) => {
	const { router } = params;

	routeHelpers.setupPageRoute(router, '/nodebb-plugin-user-csv-importing-extension', [(req, res, next) => {
		setImmediate(next);
	}], (req, res) => {
		winston.info(`[plugins/nodebb-plugin-user-csv-importing-extension] Navigated to ${nconf.get('relative_path')}/nodebb-plugin-user-csv-importing-extension`);
		res.render('quickstart', { uid: req.uid });
	});

	routeHelpers.setupAdminPageRoute(router, '/admin/plugins/nodebb-plugin-user-csv-importing-extension', controllers.renderAdminPage);
};

plugin.addAdminNavigation = (header) => {
	header.plugins.push({
		route: '/plugins/nodebb-plugin-user-csv-importing-extension',
		icon: 'fa-tint',
		name: 'Import Users via CSV - Extension',
	});

	return header;
};

module.exports = plugin;